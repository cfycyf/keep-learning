#include <stdio.h>

/*
 * test buff memmory need initial peer fgets
 * 1 line longer than 2 line
 * e.g. second.txt:
 * first line long
 * sencond
 *
 * result:
 * buff = first line long
 * buff = second
 *	
 *	fgets no need to initial peer get
 */

int main(){
	FILE *fd;
	char buff[256] = {0};

	if((fd=fopen("fgets.txt", "r")) == NULL){
		printf("fd open NULL\n");
		return -1;
	}
	while(fgets(buff, sizeof(buff),fd)){
		printf("buff = %s \n",buff);
	}

	fclose(fd);
	return 0;
}
