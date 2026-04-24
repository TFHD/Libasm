#include "../../includes/libasm_bonus.h"
#include <stdio.h>
#include <stdlib.h>

t_list *create_node_size(int size) {
    
    t_list *lists;
    
    if (!size || size < 0)
        return NULL;

    lists = malloc(sizeof(t_list));

    t_list *list_cpy = lists;
    for (int i = 0; i <= size - 1; i++) {
        char *msg = calloc(100, sizeof(char));
        msg[0] = 'A' + (size - i - 1);
        msg[1] = '\0';
        list_cpy->data = (void *)msg; 
        if (i == size - 1) {
            list_cpy->next = NULL;
            break;
        }
        list_cpy->next = malloc(sizeof(t_list));
        list_cpy = list_cpy->next;
    }
    return lists;

}

void free_lists(t_list *list) {

    if (list) free_lists(list->next); 
    else return;

    free(list->data);
    list->data = NULL;
    free(list);
}

void print_list(t_list **head) {
    t_list *head_cpy = *head;

    if (head_cpy == NULL) return;

    while (head_cpy) {
        printf("%s\n", head_cpy->data);
        if (head_cpy->next == NULL) break;
        head_cpy = head_cpy->next;
    }
}


int main() {

    // ========= ft_list_size =========

    printf("========= ft_list_size =========\n\n");

    t_list *lists = create_node_size(42);

    int size = ft_list_size(lists);
    printf("list size : %d\n", size);
    // ========= ft_list_push_front =========

    printf("========= ft_list_push_front =========\n\n");

    t_list *lists_1 = create_node_size(1);
    t_list *lists_2 = create_node_size(1);
    ft_strcpy(lists_2->data, "Hello World !");
    
    print_list(&lists_1);
    ft_list_push_front(&lists_1, lists_2);
    printf("+------+\n");
    print_list(&lists_1);

    // ========= ft_list_sort =========

    printf("========= ft_list_sort =========\n\n");
    t_list *lists_3 = create_node_size(40);
    print_list(&lists_3);
    printf("\n");

    ft_list_sort(&lists_3, ft_strcmp);

    print_list(&lists_3);

    free_lists(lists);
    free_lists(lists_1);
    free_lists(lists_3);
}