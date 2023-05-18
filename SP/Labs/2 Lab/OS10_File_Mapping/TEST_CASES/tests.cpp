#include "tests.h"

namespace tests
{
	// ������� ��������
	BOOL test1(ht::HtHandle* htHandle)
	{
		ht::Element* insertEl = new ht::Element("test1", 6, "test", 5);

		ht::insert(htHandle, insertEl);
		ht::Element* getEl = ht::get(htHandle, new ht::Element("test1", 6));

		if (
			getEl == NULL ||
			insertEl->keyLength != getEl->keyLength ||
			memcmp(insertEl->key, getEl->key, insertEl->keyLength) != NULL ||
			insertEl->payloadLength != getEl->payloadLength ||
			memcmp(insertEl->payload, getEl->payload, insertEl->payloadLength) != NULL
			)
			return false;

		return true;
	}


	// �������� ��������
	BOOL test2(ht::HtHandle* htHandle)
	{
		ht::Element* element = new ht::Element("test2", 6, "test2", 6);

		ht::insert(htHandle, element);
		ht::removeOne(htHandle, element);
		if (ht::get(htHandle, element) != NULL)
			return false;

		return true;
	}

	// ���������� ��������
	BOOL test3(ht::HtHandle* htHandle)
	{
		// ������� ������� � ������ "testKey" � ��������� "testValue1"
		ht::Element* insertEl = new ht::Element("testKey", 8, "testValue1", 11);

		ht::insert(htHandle, insertEl);


		// ��������� ������� � ������ "testKey"
		ht::update(htHandle, insertEl, "testValue2", 11);


		// �������� ������� � ������ "testKey"
		ht::Element* getEl = ht::get(htHandle, new ht::Element("testKey", 8));


		// ���������, ��� ���������� �������� ������������� ������ �������� ��������
		if (getEl == NULL || getEl->payloadLength != 11 || memcmp(getEl->payload, "testValue2", getEl->payloadLength) != 0)
		{
			return false;
		}

		return true;
	}
	
	// ��������� ��������
	BOOL test4(ht::HtHandle* htHandle)
	{
		// ������� ������� � ��������� ��� � ���-�������
		ht::Element* insertEl = new ht::Element("t4", 3, "test", 5);
		ht::insert(htHandle, insertEl);
		// �������� ������� �� ������������� �����
		ht::Element* getEl = ht::get(htHandle, new ht::Element("t4", 3));

		// ���������, ��� ���������� ������� ������������� ����������
		if (getEl == NULL || getEl->payloadLength != 5 || memcmp(getEl->payload, "test", getEl->payloadLength) != 0)
		{
			return false;
		}

		return true;

	}


	// -------------------------------------------------------------------


	// ���� ������ ������������� �������� ����� � ���������
	BOOL test5(ht::HtHandle* htHandle)
	{
		const char* key = "test5test5test5test5test5";
		const char* value = "test";
		ht::Element* insertEl = new ht::Element(key, strlen(key), value, strlen(value));

		if (!ht::insert(htHandle, insertEl)) {
			const char* expectedError = "-- key size exceeds the maximum allowed";
			const char* actualError = ht::getLastError(htHandle);
			if (strcmp(expectedError, actualError) == 0) {
				return true;
			}
			else {
				return false;
			}
		}
	}


	// ���������, ��� ������� � ������������� ���-������� �� ��������
	BOOL test6(ht::HtHandle* htHandle)
	{
		const int numElements = htHandle->capacity + 1; // ���������� ���������, �������, ��� ������� �������

		const int keyLength = 6;
		const int payloadLength = 5;

		char key[keyLength];
		char payload[payloadLength];

		// ���������� ���-�������
		for (int i = 0; i < numElements; ++i)
		{
			for (int j = 0; j < keyLength; ++j)
			{
				key[j] = 'a' + (rand() % 26); // ��������� ���������� �����
			}
			for (int j = 0; j < payloadLength; ++j)
			{
				payload[j] = 'a' + (rand() % 26); // ��������� ���������� ��������
			}

			ht::Element* insertEl = new ht::Element(key, keyLength, payload, payloadLength); // �������
			if (!ht::insert(htHandle, insertEl)) {
				const char* expectedError = "-- not found free memory";
				const char* actualError = ht::getLastError(htHandle);
				if (strcmp(expectedError, actualError) == 0) {
					return true;
				}
				else {
					return false;
				}
			}
		}
	}

	// ��������� ��������������� ��������
	BOOL test7(ht::HtHandle* htHandle)
	{
		ht::Element* element = new ht::Element("test7", 6);

		if (!(ht::get(htHandle, element)))
		{
			const char* expectedError = "-- not found element (GET)";
			const char* actualError = ht::getLastError(htHandle);
			if (strcmp(expectedError, actualError) == 0) {
				return true;
			}
			else {
				return false;
			}
		}
	}

	// �������� ��������������� ��������
	BOOL test8(ht::HtHandle* htHandle)
	{
		ht::Element* element = new ht::Element("test8", 6, "test8", 6);

		ht::insert(htHandle, element);
		ht::removeOne(htHandle, element);
		if (!(ht::removeOne(htHandle, element)))
		{
			const char* expectedError = "-- not found element (DELETE)";
			const char* actualError = ht::getLastError(htHandle);
			if (strcmp(expectedError, actualError) == 0) {
				return true;
			}
			else {
				return false;
			}
		}
	}

}