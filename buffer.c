/* header files declaration which contain C functions and macro definitions */
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>

/* define immutable macro definition to used globally throughout the program */
#define BUF_SIZE 500
#define OUTPUT_MODE 0700

/* Start of program main function, takes argc and argv as parametres
   Value returned from main function becomes the exit status of the process
   compiler will add an implicit return 0; at the end of the function if one is not defined */
int main(int argc, char *argv[])
{
    int in_fd, out_fd; /* Variable declaration and data type, integer */
    int rd_size = 1, wr_size; /* Variable declaration and initialization */
    char buf[BUF_SIZE]; /* Create a character array of size BUF_SIZE(500) */
    int total_count, buf_filled = 0;

    if (argc != 3) /* if argument count is less than 3*/
        exit(1); /* Exit program with error code 1 */

    in_fd = open(argv[1], O_RDONLY); /* Initialise second argument to variable. Open file with read only permissions */
    if (in_fd < 0) /* Check if file open was successful */
        exit(2); /* Exit program with error code 2 */

    out_fd = creat(argv[2], OUTPUT_MODE); /* Initialise third argument to variable. Create file with 0700 permission. */
    if (out_fd < 0) /* Check if file creation was successful */
        exit(3); /* Exit program with error code 3 */

    while (rd_size > 0) { /* while there is stuff to read from input file do...*/
        rd_size = read(in_fd, buf, BUF_SIZE); /* read data from file, store in buf array, read up to BUF_SIZE bytes before truncating */
        total_count += rd_size;
        if (rd_size == 500)
            printf("Buffer is filled")
        if (rd_size < 0) /* if there is nothing to read */
            exit(4); /* Exit program with error code 4 */

        wr_size = write(out_fd, buf, BUF_SIZE); /* write data to output file, buffer to read from, number of bytes to write */
        if (wr_size <= 0) { /* Check if there is anything more to write to file*/
            close(in_fd); /* if nothing, close out the read in file */
            close(out_fd); /* if nothing, close out the write out file */
            exit(5); /* Exit program with error code 5 */
        }
    }
    printf("Total count is %d\n", total_count);
}