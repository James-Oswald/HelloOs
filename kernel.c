
#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

size_t strLen(char* str){
	size_t len = 0;
	while(str[len])
		len++;
	return len;
}

void print(char* str, uint8_t color){
  uint16_t* buffer = (uint16_t*)0xB8000;
    for(size_t i = 0; i < strLen(str); i++)
        buffer[i] = str[i] | color << 8;
}

void kernelMain(){
  print("Hello World!", 0x0f);
}