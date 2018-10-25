#include "libcomponent.h"
#include <stdio.h>

int e_resistance(float orig_resistance, float *res_array)
{
  
	float resistors_array[60] = {1.0, 1.2, 1.5, 1.8, 2.2, 2.7, 3.3, 3.9, 4.7, 5.6, 6.8, 8.2,
	10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82,
	100, 120, 150, 180, 220, 270, 330, 390, 470, 560, 680, 820, 
	1000, 1200, 1500, 1800, 2200,2700, 3300, 3900, 4700, 
	5600, 6800, 8200, 10000, 12000, 15000, 18000, 22000, 27000, 33000, 39000,
	47000, 56000, 68000, 82000};
 
	int count = 0;
	int i;
	int assign = 0;

	//sätter alla platser i res_array till 0
	for(i = 0; i<3; i++)
	{

		res_array[i] = 0;

	}

	// loopar arrayen med resistorer, börjar med högsta.
	for(i=59; i>=0; i--)
	{
		//Jämför värdet för ersättningsresistansen med resistor på angiven plats i array.
		if(resistors_array[i] <= orig_resistance && count < 3)
		{
			//lägger till resistorn i array
			res_array[count] = resistors_array[i];
			count++;

			//sätter det nya värdet för ersättningsresistansen
			orig_resistance -= resistors_array[i];
											
		}	
	}

	
	//for(i=0;i<3;i++)
	  //{
//
	//    printf("%f\n", res_array[i]); //skriver ut de resistorer som lagts till i res_array
	  //}

	return count;

}
