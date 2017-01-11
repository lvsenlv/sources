/*************************************************************************
	> File Name: main.c
	> Author: 
	> Mail: 
	> Created Time: 2017年01月11日 星期三 13时56分39秒
 ************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUF_SIZE (100*sizeof(char))

void print_info(int options);
char *convert(long int * ptr, unsigned int output_type, int size);

char *g_info[] = { 
    "Usage: convert_system [input type] [output type] number1 number2",
    "malloc failed",
    "input type: only support 2  8  10  16",
    "output type: only support 2  8  10  16",
};

//int main(int argc, char *argv[])
int main(void)
{
    int argc = 5;
    char *argv[5] = {
        "test",
        "10",
        "2",
        "10",
        "123"
    };
    int i = 0, j = 0;
    unsigned int input_type = 0, output_type = 0;
    long int inputs = 0;
    char *output = NULL;
    long int *ptr = NULL;
    int size = 0;

    if(argc < 4)
    {
        print_info(1);
        return 0;
    }
    
    ptr = (long int *)malloc((argc-3)*sizeof(long int));
    if(!ptr)
    {
        print_info(2);
        return 0;
    }

    input_type = strtol(*(argv+1), NULL, 10);
    output_type = strtol(*(argv+2), NULL, 10);
    if( ! (input_type == 16 || input_type ==2 || input_type == 10 || input_type == 8) )
    {
        print_info(3);
        return 0;
    }
    if( ! (output_type == 10 || output_type == 2 || output_type == 16 || output_type == 8) )
    {
        print_info(4);
        return 0;
    }

    if(input_type == output_type)
    {
        for(i = 3; i < argc; i++)
        {
            printf("%s \n", *(argv+i));
        }
        return 0;
    }

    for(i = 3; i < argc; i++)
    {
        *(ptr+i-3) = strtol(*(argv+i), NULL, input_type);
    }
    if(output_type == 10)
    {
        for(i = 3; i < argc; i++)
        {
            printf("%ld \n",*(ptr+i-3));
        }
        return 0;
    }
    
    output = convert(ptr, output_type, argc-3);
    size = strlen(output)-1;
    for(i = 3; i < argc; i++)
    {
        switch(input_type)
        {
            case 10:
                printf("%s(D) -> ", *(argv+i));
                break;
            default:
                break;
        }
        printf("%s \n", output);
        /*
        j = 0;
        do
        {
            printf("%c", *(output+BUF_SIZE-1-j));
        }while( *(output+BUF_SIZE-1-j++) != '\n' );
        */

    }

    free(ptr);
    free(output);
    ptr = NULL;
    return 0;
}

void print_info(int options)
{
    printf(" \n \
    %s\n \
   \n", *(g_info+options-1));
}

char *convert(long int * ptr, unsigned int output_type, int size)
{
    int i =0, j = 0;
    int result = 0;
    char *temp = NULL;
    temp = (char *)malloc(BUF_SIZE);
    switch(output_type)
    {
        case 2:
            j = 0 ;
            for(i = 0; i < size; i++)
            {
                do
                {
                    *(temp+j++) = (*ptr%2 == 0 )? '0' : '1' ;
                    *ptr = *ptr / 2;
                }while(*ptr != 0);
                *(temp+j++) = ' ';
                ptr++;
            }
            break;
        default:
            break;
    }

    return temp;
}

