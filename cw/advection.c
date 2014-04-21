#include <stdio.h>

double f(double x){
	if (x >= -0.5 && x <= 0.5) {
		return 1;
	}
	return 0;
};


int main(){

const double Cx = 1;
const double k = 0.6;

	int N, M;
	double x[16000];
	double y[16000];
	double h, t;

	scanf("%d", N);
	h = 2.0 / N;
	t = (k * h) / Cx;

	M = 2.0 / (Cx * t); 			// Количество шагов по времени

int i;

	for (i = 0; i < N; i++) {
 		x[i] = (i * h) - 1;
		y[i] = f(x[i]);
        }; 

double q, b;

	for (i = 1; i < N; i++) {
		q = (y[i] - y[i - 1]) / h;	//y = qx + b;
		b = y[i] - q * x[i];
		y[i] = q * (x[i] - Cx * t) + b; 	
	} ;

        q = (y[0] - y[N - 1]) / h;   		//Для 0-го узла отдельно
        b = y[0] - q * x[0];
        y[0] = (h - Cx * t) * q + y[N - 1];

//Дальше вывод:

	for (i = 0; i < N; i++) {
		printf ("%d ",y[i]);
	}
return 0;
}







