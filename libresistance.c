#include <stdio.h>
#include "libresistance.h"

float calc_resistance(int count, char conn, float *array) {
	float totalResistance = 0.0; 
	if (sizeof(array) == 0 || count < 1 || ((conn != 'P' && conn != 'p') && (conn != 'S' && conn != 's'))) {
		return -1; 	
	}
		
	if (conn == 'P' || conn == 'p') {
		for (int counter = 0; counter < count; counter++) {
			if (array[counter] == 0) {
				return 0;			
			} 
		totalResistance += 1/array[counter]; 
		
		}
	totalResistance = 1/totalResistance;
	}

	else {
		for (int counter = 0; counter < count; counter++) {
			totalResistance += array[counter]; 
		}
	}

	return totalResistance; 
}
