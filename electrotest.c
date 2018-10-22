#include <stdio.h>
#include <stdlib.h>
#include "libpower.h"
#include "libresistance.h"
#include "libcomponent.h"

int main() {
  int volt = 0; 
  char koppling; 
  int antalKomponenter = 0;
  float *komponenter; 
  float resistance = 0; 
  int totalResistanser = 0;
  float resistanser[3];  
  
  printf("Ange spänningskälla i V: ");
  scanf("%d", &volt); 
  printf("Ange koppling [S | P]: ");
  scanf(" %c", &koppling); 
  
  printf("Ange antalet komponenter: ");
  scanf("%d", &antalKomponenter); 
  komponenter = malloc(sizeof(float) * antalKomponenter);
  for (int i = 1; i <= antalKomponenter; i++){
    printf("Ange komponent %d i ohm: ", i);
    scanf("%f", komponenter + (i-1));  
  }
  
  resistance = calc_resistance(antalKomponenter, koppling, komponenter); 
  printf("Ersättningsresistans:\n%.1f ohm \n", resistance);
  printf("Effekt:\n%.2f W \n", calc_power_r(volt, resistance));
  totalResistanser = e_resistance(resistance, resistanser); 
  printf("Ersättningsresistanser i E12-serien kopplade i serie: \n");
  
  for (int i = 0; i < sizeof(resistanser)/sizeof(resistanser[0]); i++) {
    printf("%.0f\n", resistanser[i]);
  }
  
   
}
