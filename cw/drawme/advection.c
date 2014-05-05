#include <stdio.h>
#include "drawme.h"

double f(double x, double z){
	if (x >= -0.5 && x <= 0.5 && z>=-0.5 && z <= 0.5) {
		return 1;
	}
	return 0;
};


int main(){

const double Cx = 1;
const double k = 0.5;

	int N, M;

	double x[16000] = {0};
	double y[16000][16000] = {0};
	double z[16000] = {0};

	double previous_y[16000][16000]  = {0};
	double previous_dx[16000] = {0};
        double previous_dz[16000] = {0};


	double dx[16000][16000] = {0};
	double dy[16000][16000] = {0};	

	double y_etalon[16000][16000] = {0};
	double h, t;

	scanf("%d", &N);
	h = 2.0 / N;				
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
		D = y[i];
		C = d[i];
		A = (((previous_d[i-1] - C)/h) + 2 * (previous_y[i-1] - D + C * h)/(h*h))/h;
		B = (previous_y[i-1] - D + C * h)/(h*h) + A*h;

		y[i] = A * (-Cx*t) * (-Cx*t) * (-Cx*t) + B * (-Cx*t) * (-Cx*t) + C * (-Cx*t)  + D;
		d[i] = 3 * A * (-Cx*t) * (-Cx*t) + 2 * B * (-Cx*t) + C;				//y = Axxx + Bxx + Cx + D; 	
	};


   		//Для 0-го узла отдельно
                D = y[0];
                C = d[0];
                A = (((previous_d[N - 1] - C)/h) + 2 * (previous_y[N-1] - D + C * h)/(h*h))/h;
                B = (previous_y[N-1] - D + C * h)/(h*h) + A*h;

                y[0] = A * (-Cx*t) * (-Cx*t) * (-Cx*t) + B * (-Cx*t) * (-Cx*t) + C * (-Cx*t)  + D;
                d[0] = 3 * A * (-Cx*t) * (-Cx*t) + 2 * B * (-Cx*t) + C;   

	#pragma parallel for
        for (i = 0; i < N; i++){
                previous_y[i] = y[i];
		previous_d[i] = d[i];
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







