#include <stdio.h>

int main(int argc, char const *argv[])
{
	
	int array[] = {-1, 4, 3, 0, -5, 6, 7, 8, 9, 10, 11, 12};
	int sum = 0;

	for(int i = 0 ; i < 12; i++){
		if(array[i] < 0) sum += -1 * array[i];
		else sum += array[i];
	}
	printf("%d\n", sum);

	return 0;
}