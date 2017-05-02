/*************************************************************************
	> File Name: main.c
	> Author: 
	> Mail: 
	> Created Time: 2017年04月25日 星期二 14时58分11秒
 ************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define IMG_NUM                             48
#define BUF_SIZE                            64
#define HEAD_INFO_SIZE                      54
#define IMG_SRC_PATH                        "./pictures/dynamic"
#define IMG_TARGET_PATH                     "./pictures/new_dynamic"

uint8_t g_end_flag = 1;

int main(void)
{

    uint32_t row_start = 290; //1656
    uint32_t row_end = 1946;

    if(row_end <= row_start)
    {
        printf("[%s][%d] \n", __func__, __LINE__);
        return -1;
    }

    uint32_t cur_img = 0;
    uint8_t img_name[IMG_NUM][BUF_SIZE];
    for(cur_img = 0; cur_img < IMG_NUM; cur_img++)
    {
        snprintf(img_name[cur_img], BUF_SIZE, 
            "IMG_%d.bmp", 1725+cur_img);
        //printf("%s \n", img_name[cur_img]);
    }

    uint8_t buf[BUF_SIZE];
    FILE *fp = NULL, *new_fp = NULL;
    uint8_t *head_ptr = NULL;
    int32_t ret = 0;
    uint32_t width = 0, height = 0, bit_count = 0;
    uint32_t real_width = 0;
    uint32_t copy_size = 0;
    uint8_t *data_ptr = NULL;
    uint32_t tmp = 0;
    uint32_t copy_height = row_end - row_start;
    
    for(cur_img = 0; cur_img < IMG_NUM; cur_img++)
    {
        g_end_flag = 1;
        snprintf(buf, BUF_SIZE, "%s/%s", IMG_SRC_PATH, img_name[cur_img]);
        
        fp = fopen(buf, "r");
        if(!fp)
        {
            printf("[%s][%d]: %s \n", __func__, __LINE__, buf);
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            break;
        }

        head_ptr = (uint8_t *)malloc(HEAD_INFO_SIZE);
        if(!head_ptr)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            fclose(fp);
            break;
        }
        
        ret = fread(head_ptr, sizeof(uint8_t), HEAD_INFO_SIZE, fp);
        if(ret != HEAD_INFO_SIZE)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            fclose(fp);
            break;
        }

        if(head_ptr[0] != 'B' || head_ptr[1] != 'M')
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            fclose(fp);
            break;
        }

        width = 0;
        width |= head_ptr[21];
        width <<= 8;
        width |= head_ptr[20];
        width <<= 8;
        width |= head_ptr[19];
        width <<= 8;
        width |= head_ptr[18];

        height = 0;
        height |= head_ptr[25];
        height <<= 8;
        height |= head_ptr[24];
        height <<= 8;
        height |= head_ptr[23];
        height <<= 8;
        height |= head_ptr[22];

        bit_count = 0;
        bit_count |= head_ptr[29];
        bit_count <<= 8;
        bit_count |= head_ptr[28];

        if(row_end > height)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            fclose(fp);
            break;
        }

        real_width = ((width*bit_count + 31)/32 * 4);
        
        ret = fseek(fp, (height-row_end)*real_width, SEEK_CUR);
        if(ret)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            fclose(fp);
            break;
        }

        copy_size = copy_height * real_width;
        data_ptr = (uint8_t *)malloc(copy_size);
        if(!data_ptr)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            fclose(fp);
            break;
        }

        ret = fread(data_ptr, sizeof(uint8_t), copy_size, fp);
        if(ret != copy_size)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            free(data_ptr);
            fclose(fp);
            break;
        }

        fclose(fp);
        fp = NULL;

        snprintf(buf, BUF_SIZE, "%s/new_%s", IMG_TARGET_PATH, img_name[cur_img]);

        new_fp = fopen(buf, "w+");
        if(!new_fp)
        {
            printf("[%s][%d]: %s \n", __func__, __LINE__, buf);
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            free(data_ptr);
            break;
        }

        tmp = copy_height;
        head_ptr[22] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[23] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[24] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[25] = (uint8_t)(tmp & 0xFF);

        tmp = real_width*copy_height + HEAD_INFO_SIZE;
        head_ptr[2] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[3] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[4] = (uint8_t)(tmp & 0xFF);
        tmp >>= 8;
        head_ptr[5] = (uint8_t)(tmp & 0xFF);

        tmp = real_width*copy_height;
        head_ptr[34] = tmp & 0xFF;
        tmp >>= 8;
        head_ptr[35] = tmp & 0xFF;
        tmp >>= 8;
        head_ptr[36] = tmp & 0xFF;
        tmp >>= 8;
        head_ptr[37] = tmp & 0xFF;

        ret = fwrite(head_ptr, sizeof(uint8_t), HEAD_INFO_SIZE, new_fp);
        if(ret != HEAD_INFO_SIZE)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            free(data_ptr);
            fclose(new_fp);
            break;
        }

        ret = fwrite(data_ptr, sizeof(uint8_t), copy_size, new_fp);
        if(ret != copy_size)
        {
            printf("[%s][%d]: %d \n", __func__, __LINE__, cur_img);
            free(head_ptr);
            free(data_ptr);
            fclose(new_fp);
            break;
        }        

        free(head_ptr);
        free(data_ptr);
        fclose(new_fp);
        head_ptr = NULL;
        data_ptr = NULL;
        new_fp = NULL;

        g_end_flag = 0;
    }

    if(g_end_flag)
        printf("success \n");
    
    return 0;    
}

