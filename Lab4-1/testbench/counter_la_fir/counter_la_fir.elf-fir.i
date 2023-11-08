# 0 "fir.c"
# 1 "/home/ubuntu/Downloads/SoC/course-lab_4.0-2022.1/lab-exmem_fir/testbench/counter_la_fir//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "fir.c"
# 1 "fir.h" 1





int taps[11] = {0,-10,-9,23,56,63,56,23,-9,-10,0};
int inputbuffer[11];
int inputsignal[11] = {1,2,3,4,5,6,7,8,9,10,11};
int outputsignal[11];
# 2 "fir.c" 2

void __attribute__((section(".mprjram"))) initfir()
{


 for (int i = 0; i < 11; i++)
 {
  inputbuffer[i] = 0;
  outputsignal[i] = 0;
 }
}

int __attribute__((section(".mprjram"))) filter(int filter_in)
{
 int filter_out = 0;


 inputbuffer[0] = filter_in;
 for (int k = 11 - 1; k > 0; k--)
 {
  inputbuffer[k] = inputbuffer[k - 1];
 }


 for (int h = 0; h < 11; h++)
 {
  filter_out += taps[h] * inputbuffer[h];
 }

 return filter_out;
}

int *__attribute__((section(".mprjram"))) fir()
{
 initfir();

 for (int j = 0; j < 11; j++)
 {
  outputsignal[j] = filter(inputsignal[j]);
 }

 return outputsignal;
}
