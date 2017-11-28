#include "resource_table.h"

volatile register unsigned __R30;

void main(void)
{
  while (1) {
    __R30 = __R30 | (1<<1); // Turn on the LED
    __delay_cycles(10000000); // Intrinsic method delay
    __R30 = __R30 & ~(1<<1); // Turn off the LED
    __delay_cycles(10000000); // Intrinsic method delay
  }
}
