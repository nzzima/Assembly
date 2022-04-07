#pragma once
#define _CRT_SECURE_NO_WARNINGS
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
void QuickSort(int* Lb, int* Ub);
void BubbleSort(int arr[], int lenght);
void BubbleSort_Time_of_random(int arr[], int length);

int main() {

	int length = 20000;
	int  arr_for_asm[20000];

	BubbleSort_Time_of_random(arr_for_asm, 20000);

	//-----------------EXAMPLE QUICK SORT-----------------
	int ar[10] = { 3,7,5,9,1,3,5,3,6,4 };
	QuickSort(&ar[0], &ar[9]);

	printf("\nSimple example quick sorting:\n");
	for (int i = 0; i < 9; ++i)
		printf(" %d", ar[i]);
	printf("\n\n");
	//----------------------------------------------------

	//-----------------QUICK SORT DATA 20000--------------
	FILE* outFile = NULL;
	outFile = fopen("unsorted_random_data.txt", "rb");
	if (outFile == NULL)
	{
		printf("Cannot open file!");
		return;
	}

	for (int i = 0; i < length; ++i)
		fscanf(outFile, "%d", &arr_for_asm[i]);
	fclose(outFile);

	clock_t t = clock();
	QuickSort(&arr_for_asm[0], &arr_for_asm[19999]);
	clock_t end = clock();

	int time = (end - t);
	printf("Time of quick_sorting random data: ");
	printf("%d \n", time);
	printf("\n\n");

	FILE* file = NULL;
	file = fopen("QuickSorted_random_data.txt", "wb");
	if (file == NULL)
	{
		printf("Cannot open file!");
		return;
	}

	for (int i = 0; i < length; ++i)
		fprintf(file, "%d ", arr_for_asm[i]);

	fclose(file);
	//----------------------------------------------------
	
	system("pause");
	return 0;
}

void BubbleSort_Time_of_random(int arr[], int length)
{
	FILE* outFile = NULL;
	outFile = fopen("unsorted_random_data.txt", "rb");
	if (outFile == NULL)
	{
		printf("Cannot open file!");
		return;
	}

	for (int i = 0; i < length; ++i)
		fscanf(outFile, "%d", &arr[i]);
	fclose(outFile);

	clock_t t = clock();
	BubbleSort(arr, length);
	clock_t end = clock();

	int time = (end - t);
	printf("Time of bubble_sorting random data: ");
	printf("%d \n", time);

	FILE* file = NULL;
	file = fopen("BubbleSorted_random_data.txt", "wb");
	if (file == NULL)
	{
		printf("Cannot open file!");
		return;
	}

	for (int i = 0; i < length; ++i)
		fprintf(file, "%d ", arr[i]);

	fclose(file);
}