#include <stdio.h>

float function(float *array, int length){
	float sum = 0;
	int i = 0;
	for (i = 0; i < length; i++){
		sum += array[i];
	}
	return sum;
}

int main(){
	float arr[5] = {1, 1, 2, 3, 5};
	int len = 5;
	printf ("%f", function(arr, len));
return 0;
}
