#include "../../includes/libasm_bonus.h"
#include <stdio.h>
#include <stdlib.h>

t_list *create_node_size(int size) {
    
    t_list *lists;
    
    if (!size || size < 0)
        return NULL;

    lists = malloc(sizeof(t_list));

    t_list *list_cpy = lists;
    for (int i = 0; i < size - 1; i++) {
        char msg[1] = "a";
        msg[0] += (size - i);
        list_cpy->data = (void *)ft_strdup(msg); 
        list_cpy->next = malloc(sizeof(t_list));
        list_cpy = list_cpy->next;
    }

    list_cpy->next = NULL;
    return lists;

}

void			ft_ptrswp(void **first, void **second)
{
	void		*temporary;

	temporary = *second;
	*second = *first;
	*first = temporary;
}

// void ft_list_sort(t_list **begin_list, int (*cmp)()) {
//     t_list  *list_ptr;
//     t_list  *next_node;
//     void *temp;

//     list_ptr = *begin_list;
//     while (list_ptr->next)
//     {
//         next_node = list_ptr->next;
//         while (next_node->next)
//         {
//             if (cmp(list_ptr->data, next_node->data) > 0)
//             {
//                 temp = list_ptr->data;
//                 list_ptr->data = next_node->data;
//                 next_node->data = temp;
//             }
//             next_node = next_node->next;
//         }
//         list_ptr = list_ptr->next;
//     }
// }


void print_list(t_list **head) {
    t_list *head_cpy = *head;

    while (head_cpy->next != NULL) {
        printf("%s\n", (char *)head_cpy->data);
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
    lists_2->data = "Hello World!";

    ft_list_push_front(&lists_1, lists_2);

    // ========= ft_list_sort =========

    printf("========= ft_list_sort =========\n\n");
    t_list *lists_3 = create_node_size(10);
    print_list(&lists_3);
    printf("\n");

    ft_list_sort(&lists_3, ft_strcmp);

    print_list(&lists_3);
    

    // printf("message : %s\n", (char *)lists_1->data);


}