/*
 * API_debounce.c
 *
 *  Created on: 15 sep. 2022
 *      Author: Santiago
 */

/* Includes ------------------------------------------------------------------*/
#include "API_debounce.h"
#include "API_delay.h"
#include "stm32f4xx_hal.h"  		/* <- HAL include */
#include "stm32f4xx_nucleo_144.h" 	/* <- BSP include */
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

typedef enum{
	BUTTON_UP,
	BUTTON_FALLING,
	BUTTON_DOWN,
	BUTTON_RAISING,
} debounceState_t;

/* Private variables ---------------------------------------------------------*/
#define DELAY_TIME 40
delay_t delay;
static debounceState_t state;
static bool_t pressed;

/* Private function prototypes -----------------------------------------------*/

/**
  * @brief  Initialize FSM
  * @param  Void
  * @retval Void
  */
void debounceFSM_init(){
	//Initialize State and Delay
	state = BUTTON_UP;
	delayInit(&delay,DELAY_TIME);
}

/**
  * @brief  Update FSM
  * @param  Void
  * @retval Void
  */
void debounceFSM_update(){
	//Update States
	switch(state){
		case BUTTON_UP:
			if(BSP_PB_GetState(BUTTON_USER)){
				pressed = true;
				delayRead(&delay);
				state = BUTTON_FALLING;
			}
			break;
		case BUTTON_FALLING:
			if(delayRead(&delay))
			{
				if(BSP_PB_GetState(BUTTON_USER)){
					state = BUTTON_DOWN;
					buttonPressed();
				}
			}
			else state = BUTTON_UP;
			break;
		case BUTTON_DOWN:
			if(!BSP_PB_GetState(BUTTON_USER)){
				delayRead(&delay);
				state = BUTTON_RAISING;
			}
			break;
		case BUTTON_RAISING:
			if(delayRead(&delay))
			{
				if(!BSP_PB_GetState(BUTTON_USER)){
					state = BUTTON_UP;
					buttonReleased();
				}
			}
			else state = BUTTON_DOWN;
			break;
		default:
			debounceFSM_init();
			break;
	}
}

bool_t readKey(){
	if(pressed){
		pressed = false;
		return true;
	}
	else return false;
}
