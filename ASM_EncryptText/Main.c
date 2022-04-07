#pragma once
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

void Encrypt(char[], int, char[], int);

int main()
{
	char key1[] = { "abcd" };
	int key_size = 4;
	char text[] = { "Hello world" };
	int text_size = 11;

	Encrypt(key1, key_size, text, text_size);
	char cryptText = text;
	
	system("pause");
	return 0;
}