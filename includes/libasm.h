#ifndef LIBASM_H
# define LIBASM_H

# include <stddef.h>

size_t      ft_strlen(char *s);
int         ft_strcmp(char *s1, char *s2);
size_t     ft_write(int fd, void *buf, size_t count);
size_t     ft_read(int fd, void *buf, size_t count);
char        *ft_strcpy(char *dst, const char *src);
char        *ft_strdup(const char *s);

#endif