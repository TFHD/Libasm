#include <stdio.h>
#include "../../includes/libasm.h"
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <strings.h>

void do_strcmp(char *msg, char *msg1) {
    printf(
        "ft_strcmp(\"%s\", \"%s\") : %d\n",
        msg,
        msg1,
        ft_strcmp(msg, msg1)
    );
}

int main() {

    char *message = "Hello World!";
    char *message2 = "Hello Wierdo!";
    int errno_save = 0;
    
    // ========= ft_strlen =========
    
    printf("========= ft_strlen =========\n\n");
    
    printf("Message: %s\nft_strlen : %zu\n", message, ft_strlen(message));
    
    // ========= ft_write =========
    
    printf("\n========= ft_write =========\n\n");
    
    errno = 0;
    ft_write(1, "Message: ", 9);
    ft_write(1, message, ft_strlen(message));
    errno_save = errno;
    printf("\nerrno : %d\n\n", errno_save);

    errno = 0;
    ft_write(1, "Message:\n", 9);
    ft_write(-1, message, ft_strlen(message));
    errno_save = errno;
    printf("errno : %d\n", errno_save);

    // ========= ft_strcmp =========

    printf("\n========= ft_strcmp =========\n\n");

    do_strcmp(message, message2);
    do_strcmp(message, message);
    do_strcmp(message2, message);

    // ========= ft_read =========

    printf("\n========= ft_read =========\n\n");

    int fd = open("Makefile", O_RDONLY);
    static char buffer[100] = {0};

    errno = 0;
    ft_read(fd, buffer, 100);
    errno_save = errno;
    printf("buffer :\n%s", buffer);
    printf("\nerrno : %d\n\n", errno_save);
    close(fd);

    errno = 0;
    bzero(buffer, 100);
    ft_read(-1, buffer, 100);
    errno_save = errno;
    printf("buffer :\n%s", buffer);
    printf("errno : %d\n", errno_save);

    // ========= ft_strcpy =========

    printf("\n========= ft_strcpy =========\n\n");

    char message_dst[13];

    ft_strcpy(message_dst, message);
    printf("message : %s\n", message_dst);

    // ========= ft_strdup =========

    printf("\n========= ft_strdup =========\n\n");

    char *msg_cpy = ft_strdup("\x30");

    printf("message copy: %s\n", msg_cpy);
    free(msg_cpy);

    return 0;
}