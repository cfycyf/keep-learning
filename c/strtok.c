#include<stdio.h>
#include <string.h>

int main(){
	
	char buff[] = "aa bb cc dd";
	char *p;
	// p just a point to buff
	p = strtok(buff, " ");
	while(p){
		printf("p = %s\n", p);
		p =strtok(NULL, " ");
	}
	return 0;
}
