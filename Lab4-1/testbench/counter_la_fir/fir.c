#include "fir.h"

void __attribute__((section(".mprjram"))) initfir()
{
	// initial your fir
	// static int cnt = 0;
	for (int i = 0; i < N; i++)
	{
		inputbuffer[i] = 0;
		outputsignal[i] = 0;
	}
}

int __attribute__((section(".mprjram"))) filter(int filter_in)
{
	int filter_out = 0;

	// Buffer Setup
	
	for (int k = N - 1; k > 0; k--)
	{
		inputbuffer[k] = inputbuffer[k - 1]; // Old values shift
	}

	inputbuffer[0] = filter_in; // New value in

	// FIR Calculation
	for (int h = 0; h < N; h++)
	{
		filter_out += taps[h] * inputbuffer[h];
	}

	return filter_out;
}

int *__attribute__((section(".mprjram"))) fir()
{
	initfir();
	// write down your fir
	for (int j = 0; j < N; j++)
	{
		outputsignal[j] = filter(inputsignal[j]);
	}

	return outputsignal;
}
