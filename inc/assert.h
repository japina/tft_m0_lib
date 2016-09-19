#ifndef __ASSERT_H
#define __ASSERT_H

#include "stm32f0xx.h"
#define assert_param(expr) ((expr) ? (void)0 : assert_failed((uint8_t *)__FILE__, __LINE__))
void assert_failed(uint8_t* file, uint32_t line);

#endif