#define STM32L451xx 1 // change to your specific microcontroller
#include "stm32l4xx.h"

int main(void){
	RCC->AHB2ENR|=0x00000002; // enable clock for gpiob

	GPIOB->MODER &= ~0x00000002;
	GPIOB->MODER |= 0x00000001; // set pb0 as output pin
	GPIOB->OTYPER &= ~0x00000001; // set every pin to push pull on gpiob
	GPIOB->OSPEEDR |= 0x00000003; // set every pin to highest speed on gpiob
	GPIOB->PUPDR &= ~0x00000003; // set every pin to no pull up or pull down in gpiob

	// never ending while loop
	while(1){
        GPIOB->ODR |= 0x00000001; // set PB0 to high
        for(long i=0; i<1000000; i++){__NOP();} // wait about 1 second
        GPIOB->ODR &= ~0x00000001; // set PB0 to low
        for(long i=0; i<1000000; i++){__NOP();} // wait about 1 second
	}
	
	return 0;
}
