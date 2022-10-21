/*
 * API_debounce.h
 *
 *  Created on: 15 sep. 2022
 *      Author: Santiago
 */

#ifndef API_INC_API_DEBOUNCE_H_
#define API_INC_API_DEBOUNCE_H_

/* Includes ------------------------------------------------------------------*/
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

/* Exported typedefine ------------------------------------------------------------*/
typedef bool bool_t;

/* Exported functions ------------------------------------------------------- */
void debounceFSM_init();
void debounceFSM_update();
void buttonPressed();
void buttonReleased();
bool_t readKey();

#endif /* API_INC_API_DEBOUNCE_H_ */
