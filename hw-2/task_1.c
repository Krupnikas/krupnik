#include <stdio.h>
#include <math.h>

int main(){
	double i;
	scanf("%lf", &i);
	if (i >= 0) {
		printf("%lf", pow(2.0, i));
	} else {
		printf("%lf", pow(i, 2.0));
	};
return 0;
}

