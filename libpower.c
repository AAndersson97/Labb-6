#include <stdio.h>
#include "libpower.h"

float calc_power_r(float volt, float resistance)
{	
	if (resistance == 0)
	{
		printf("Resistance = 0.\n");
		return -1;
	}
	return (volt*volt)/resistance;
}

float calc_power_i(float volt, float current)
{
	return volt*current;
}
