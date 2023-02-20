#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <stdio.h>
#include <sys/types.h>
#include <Windows.h>
#include <ctime>
#include <cstring>
#include <cassert>
#include <iostream>


BOOL printFileTxt(LPWSTR FileName);
BOOL delRowFileTxt(LPWSTR FileName, DWORD row);
BOOL insRowFileTxt(LPWSTR FileName, LPWSTR str, DWORD row);
BOOL printWathRowFileTxt(LPWSTR FileName, DWORD mlsec);

int main(int argc, char** argv)
{
	setlocale(LC_ALL, "rus");
	char text[] = "D:\\BSTU\\OS09_01.txt";
	wchar_t wtext[40];
	mbstowcs(wtext, text, strlen(text) + 1);
	LPWSTR ptr = wtext;
	printFileTxt(ptr);
}

BOOL printFileTxt(LPWSTR FileName)
{
	struct stat fileInfo;

	std::time_t result = std::time(nullptr);
	//std::cout << std::ctime(&result);

	

	if (stat((char*)FileName, &fileInfo) == 0) {  // Use stat() to get the info
		return(EXIT_FAILURE);
	}

	std::cout << "Type          : ";
	if ((fileInfo.st_mode & S_IFMT) == S_IFDIR) { // From sys/types.h
		std::cout << "Directory\n";
	}
	else {
		std::cout << "File\n";
	}
	std::wstring ws(FileName);
	std::string s(ws.begin(), ws.end());

	size_t i = s.rfind("\\", s.length());

	std::cout << "Name          : ";
	if (i != std::string::npos) {
		std::cout << (s.substr(i + 1, s.length() - i));
	}

	char buffer[32];
	std::strncpy(buffer, std::ctime(&result), 26);
	assert('\n' == buffer[std::strlen(buffer) - 1]);
	std::cout << buffer;

	std::cout << '\n';
	std::cout << "Size          : " <<
		fileInfo.st_size << " bytes\n";         // Size in bytes
	std::cout << "Created       : " <<
		std::ctime(&fileInfo.st_atime);         // Creation time
	std::cout << "Modified      : " <<
		std::ctime(&fileInfo.st_mtime);         // Last mod time
	return 0;
}
BOOL delRowFileTxt(LPWSTR FileName, DWORD row)
{

	return 0;
}
BOOL insRowFileTxt(LPWSTR FileName, LPWSTR str, DWORD row)
{

	return 0;
}
BOOL printWathRowFileTxt(LPWSTR FileName, DWORD mlsec)
{

	return 0;
}