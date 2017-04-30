#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <string.h>

#define BUF_SIZE 500

int main(int argc, char *argv[]) {
    FILE *fp1, *fp2;
    char buf1[BUF_SIZE], buf2[BUF_SIZE];
    int cmp;

    if (argc < 3) {
        printf("Please provide two files\n");
        return 1;
    }
    else
        while (--argc > 0) {
            if ((fp1 = fopen(argv[1], "r")) == NULL) {
                printf("Can't open %s\n", argv[1]);
                return 1;
            }

            if ((fp2 = fopen(argv[2], "r")) == NULL) {
                printf("Can't open %s\n", argv[2]);
                return 1;
            }
        }
    while(!feof(fp1) && !feof(fp2)){
        fgets(buf1, BUF_SIZE, fp1);
        fgets(buf2, BUF_SIZE, fp2);
        if (strcmp(buf1, buf2) != 0){
            printf("file '%s' and file '%s' don't match\n", argv[1], argv[2]);
            break;
        }

    }
    fclose(fp1);
    fclose(fp2);
    return 0;
}