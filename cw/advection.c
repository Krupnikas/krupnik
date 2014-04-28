#include <stdio.h>
#include "drawme.h"

double f(double x){
	if (x >= -0.5 && x <= 0.5) {
		return 1;
	}
	return 0;
};


int main(){

const double Cx = 1;
const double k = 0.5;

	int N, M;
	double x[16000] = {0};
	double y[16000] = {0};
	double previous_y[16000] = {0};
	double d[16000] = {0};
	double y_etalon[16000] = {0};
	double h, t;

	scanf("%d", &N);
	h = 2.0 / (N - 1);				
	t = (k * h) / Cx;

	M = 2.0 / (Cx * t); 			// Количество шагов по времени
	printf("M = %d\n", M);
int i;

//printf("Numbers was     ");
	for (i = 0; i < N; i++) {
 		x[i] = (i * h) - 1;
		y[i] = previous_y[i] = y_etalon[i] = f(x[i]);
	//	printf("%lf ", y[i]);
        }; 

//printf("\nNow numbers are ");
double A, B, C, D, q, b;

int j = 0;

while (j < M) {
	#pragma parallel for
	for (i = 1; i < N; i++) {
		q = (y[i] - previous_y[i-1]) / h;	//y = Axxx + Bxx + Cx + D;
		b = y[i] - q * x[i];
		y[i] = q * (x[i] - Cx * t) + b; 	
	};


        q = (y[0] - previous_y[N-1]) / h;   		//Для 0-го узла отдельно
        y[0] = (h - Cx * t) * q + previous_y[N-1];

	#pragma parallel for
        for (i = 0; i < 16000; i++){
                previous_y[i] = y[i];
        }


//printf("%d ", j);
j++;
}
//Дальше вывод:

        DM_plot_1d_etalon(x, y, y_etalon, N, "Test 1", 0);
        DM_plot_1d_etalon(x, y, y_etalon, N, "Test 1", 1);


	//for (i = 0; i < N; i++) {
	//	printf ("%lf ",y[i]);
	//}
return 0;
}







