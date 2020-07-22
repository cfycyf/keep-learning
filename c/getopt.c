#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

int count = 0;
char values[64] = {0};

static int parse_config_line(char *name, char *value, char *line)
{
	char *p = strchr(line, '=');
	if(!p) return -1;

	*p++ = '\0';
	strcpy(name, line);
	strcpy(value, p);
	if(value[strlen(value) -1] == '\n')
		value[strlen(value) -1] = '\0';

	return 0;
}

/* file format:
 * name = value
 */
void parse_config_file(char *config_file)
{
	FILE *fp;
	char cfg_line[64], cfg_name[16], cfg_value[32];
	
	if((fp=fopen(config_file, "r")) == NULL){
		printf("config file: %s open fialed\n", config_file);
		return;
	}
	
	while(fgets(cfg_line, sizeof(cfg_line), fp)){
		memset(cfg_name, 0, sizeof(cfg_name));
		memset(cfg_value, 0, sizeof(cfg_value));
		if(parse_config_line(cfg_name, cfg_value, cfg_line) == -1){
				printf("config line: %s format error\n", cfg_line);
				continue;
		}
		if(strcmp(cfg_name, "count") == 0){
			count = atoi(cfg_value);
		}else if(strcmp(cfg_name, "values") == 0){
			strncpy(values, cfg_value, sizeof(values));
		}else{
			printf("unknow config setting: %s=%s \n", cfg_name, cfg_value);
		}
	}
	
	printf("count = %d , values = %s \n", count, values);
	fclose(fp);

}

int main(int argc, char **argv)
{
	int debug = 0, opt;
	char opt_config_file[64];

	while((opt=getopt(argc, argv, "f:d")) !=-1){
		switch(opt){
			case 'f':
				strncpy(opt_config_file, optarg, sizeof(opt_config_file));
				break;
			case 'd':
				debug = 1;
				printf("debug enable...\n");
				break;
			default:
				printf("unknow option = %d ...\n", opt);
		}
	}
	parse_config_file(opt_config_file);
	return 0;
}
