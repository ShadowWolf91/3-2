//
//#include "stdafx.h"
//#include <iostream>
//#include <ctime>
//#define _WINSOCK_DEPRECATED_NO_WARNINGS
//#include "Winsock2.h"
//#pragma comment (lib, "ws2_32.lib")
//
//
//struct NTP_packet	//????? NTP
//{
//	CHAR head[4];
//	DWORD32 RootDelay;
//	DWORD32 RootDispersion;
//	CHAR ReferenceIdentifier[4];	//?????????????
//	DWORD ReferenceTimestamp[2];	//32 ????  - ??????? ? 01.01.1900 00:00, 32 ???? - ???? ??????? ? 2^-32 ????????
//	DWORD64 OriginateTimestamp;
//	DWORD32 TransmitTimestamp[2];	//32 ????  - ??????? ? 01.01.1900 00:00, 32 ???? - ???? ??????? ? 2^-32 ????????
//	DWORD32 KeyIdentifier;			//optional
//	DWORD64 MessageDigest[2];		//optional
//};
//int _tmain(int argc, _TCHAR* argv[])
//{
//	int h = CLOCKS_PER_SEC;
//	clock_t t = clock();
//	int d = 613608 * 3600;
//	time_t ttime;
//	time(&ttime);
//
//	WSADATA wsaData;
//	SOCKET s;
//	SOCKADDR_IN server;
//	server.sin_family = AF_INET;
//	server.sin_addr.s_addr = inet_addr("88.147.254.235"); 
//	server.sin_port = htons(123);
//
//	NTP_packet out_buf, in_buf;
//	ZeroMemory(&out_buf, sizeof(out_buf));
//	ZeroMemory(&out_buf, sizeof(out_buf));
//	out_buf.head[0] = 0x1B;
//	out_buf.head[1] = 0x00;
//	out_buf.head[2] = 4;
//	out_buf.head[3] = 0xEC;
//	try
//	{
//		if (WSAStartup(MAKEWORD(2, 0), &wsaData))	throw WSAGetLastError();
//		if ((s = socket(AF_INET, SOCK_DGRAM, NULL)) == INVALID_SOCKET) throw WSAGetLastError();
//		int lenout = 0, lenin = 0, lensockaddr = sizeof(server);
//
//		if ((lenout = sendto(s, (char *)&out_buf, sizeof(out_buf), NULL, (sockaddr *)&server, sizeof(server))) == SOCKET_ERROR) throw WSAGetLastError();
//		if ((lenin = recvfrom(s, (char *)&in_buf, sizeof(in_buf), NULL, (sockaddr *)&server, &lensockaddr)) == SOCKET_ERROR) throw WSAGetLastError();
//
//		in_buf.ReferenceTimestamp[0] = ntohl(in_buf.ReferenceTimestamp[0]) - d;
//		in_buf.TransmitTimestamp[0] = ntohl(in_buf.ReferenceTimestamp[0]) - d;
//		in_buf.TransmitTimestamp[1] = ntohl(in_buf.ReferenceTimestamp[1]);		//???? ??????? in_buf.TransmitTimestamp[1]/2^-32
//		int ms = (int) 1000.0 * ((double)(in_buf.TransmitTimestamp[1]) / (double)0xffffffff);		//???????????
//
//		if (closesocket(s) == INVALID_SOCKET) throw WSAGetLastError();
//		if (WSACleanup() == SOCKET_ERROR) throw WSAGetLastError();
//	}
//
//	catch (int e)
//	{
//		std::cout << "error:" << e << std::endl;
//	};
//
//	return 0;
//}
//


// NTP_SINC.cpp: ?????????? ????? ????? ??? ??????????? ??????????.
//

#include "stdafx.h"
#include<iostream>
#include<ctime>
#include"Winsock2.h"
#include<winbase.h>
#include<winnt.h>
#include<time.h>
#pragma comment(lib, "WS2_32.lib")

struct NTP_packet
{
	CHAR		head[4];
	DWORD32		RootDelay;
	DWORD32		RootDispersion;
	CHAR		ReferenceIdentifier[4]; //?????????????
	DWORD		ReferenceTimestamp[2]; //32 ???? - ??????? ? 01.01.1900 
	DWORD64		OriginateTimestamp;
	DWORD32		TransmitTimestamp[2];
	DWORD32		KeyIdentifier;
	DWORD64		MessageDigest[2];
};

void UnixTimeToFileTime(time_t t, LPFILETIME pft)
{
	// ???????? ????????, ??? LONGLONG ? ??? 64-?????? ????????.
	LONGLONG ll;

	ll = Int32x32To64(t, 10000000) + 116444736000000000;
	pft->dwLowDateTime = (DWORD)ll;
	pft->dwHighDateTime = ll >> 32;
}

void UnixTimeToSystemTime(time_t t, LPSYSTEMTIME pst)
{
	FILETIME ft;

	UnixTimeToFileTime(t, &ft);
	FileTimeToSystemTime(&ft, pst);
}

int main()
{
	int h = CLOCKS_PER_SEC; 
	clock_t t = clock();
	int d = 613608 * 3600; //??? ????? 1900 - 1970
	time_t ttime; //???-?? ??? ? 1970 
	time(&ttime);

	WSAData wsaData;
	SOCKET s;
	SOCKADDR_IN server;
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = inet_addr("88.147.254.229"); //ntp3.ntp-servers.net
	server.sin_port = htons(123);

	NTP_packet out_buf, in_buf;
	ZeroMemory(&out_buf, sizeof(out_buf));
	ZeroMemory(&in_buf, sizeof(in_buf));
	out_buf.head[0] = 0x1B;
	out_buf.head[1] = 0x00;
	out_buf.head[2] = 4;
	out_buf.head[3] = 0xEC;
	for (int i = 0; i < 10; i++) {
		try
		{
			if (WSAStartup(MAKEWORD(2, 0), &wsaData) != 0)
				throw WSAGetLastError();
			if ((s = socket(AF_INET, SOCK_DGRAM, NULL)) == INVALID_SOCKET)
				throw WSAGetLastError();
			int lenout = 0, lenin = 0, lensockaddr = sizeof(server);

			if ((lenout = sendto(s, (char*)&out_buf, sizeof(out_buf), NULL, (sockaddr*)&server, sizeof(server))) == SOCKET_ERROR)
				throw  WSAGetLastError();
			if ((lenin = recvfrom(s, (char*)&in_buf, sizeof(in_buf), NULL, (sockaddr*)&server, &lensockaddr)) == SOCKET_ERROR)
				throw  WSAGetLastError();

			in_buf.ReferenceTimestamp[0] = ntohl(in_buf.ReferenceTimestamp[0]) - d;
			in_buf.TransmitTimestamp[0] = ntohl(in_buf.TransmitTimestamp[0]) - d;
			in_buf.TransmitTimestamp[1] = ntohl(in_buf.TransmitTimestamp[1]);
			int ms = (int) 1000.0*((double)(in_buf.TransmitTimestamp[1]) / (double)0xffffffff);

			SYSTEMTIME sysTime;
			UnixTimeToSystemTime(in_buf.TransmitTimestamp[0], &sysTime);
			sysTime.wMilliseconds = ms;

			std::cout << "ServerTime:" << std::endl;
			printf("%d-%02d-%02d %02d:%02d:%02d.%03d",
				sysTime.wYear,
				sysTime.wMonth,
				sysTime.wDay,
				sysTime.wHour,
				sysTime.wMinute,
				sysTime.wSecond,
				sysTime.wMilliseconds);
			std::cout << std::endl;
			std::cout << "OSTime:" << std::endl;
			SYSTEMTIME st;

			GetLocalTime(&st);

			printf("%d-%02d-%02d %02d:%02d:%02d.%03d",
				st.wYear,
				st.wMonth,
				st.wDay,
				st.wHour,
				st.wMinute,
				st.wSecond,
				st.wMilliseconds);
			std::cout << std::endl;
			std::cout << "Difference in milliseconds : " << (sysTime.wMilliseconds - st.wMilliseconds) << std::endl;
			if (closesocket(s) == INVALID_SOCKET)
				throw WSAGetLastError();
			if (WSACleanup() == SOCKET_ERROR)
				throw WSAGetLastError();
		}
		catch (int e)
		{
			std::cout << "error: " << e << std::endl;
		}
		Sleep(1000);
	}

	system("pause");
	return 0;
}

