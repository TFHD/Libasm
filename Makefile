NAME		:= 	libasm.a

SRC_DIR		:=	srcs/

MANDA_DIR	:=	manda/

BONUS_DIR	:=	bonus/

SRCS		:= 	ft_strcmp.s \
				ft_strlen.s \
				ft_write.s \
				ft_read.s \
				ft_strcpy.s \
				ft_strdup.s
			
SRCSB		:=	ft_list_size_bonus.s \
				ft_list_push_front_bonus.s \
				ft_list_sort.s

BUILD		:=	.build/

OBJS		:=	$(patsubst %.s, $(BUILD)$(MANDA_DIR)%.o, $(SRCS))

OBJSB		:=	${OBJS} $(patsubst %.s, $(BUILD)$(BONUS_DIR)%.o, $(SRCSB))

NASM		:=	nasm

AR			:=	ar -rcs

FLAGS 		:=	-f elf64

TPUT 		= tput -T xterm-256color
_RESET 		:= $(shell $(TPUT) sgr0)
_BOLD 		:= $(shell $(TPUT) bold)
_ITALIC 	:= $(shell $(TPUT) sitm)
_UNDER 		:= $(shell $(TPUT) smul)
_GREEN 		:= $(shell $(TPUT) setaf 2)
_YELLOW 	:= $(shell $(TPUT) setaf 3)
_RED 		:= $(shell $(TPUT) setaf 1)
_GRAY 		:= $(shell $(TPUT) setaf 8)
_PURPLE 	:= $(shell $(TPUT) setaf 5)

OBJS_TOTAL	= $(words $(OBJS))
N_OBJS		:= $(shell find $(DIR) -type f -name $(OBJS) 2>/dev/null | wc -l)
OBJS_TOTAL	:= $(shell echo $$(( $(OBJS_TOTAL) - $(N_OBJS) )))
CURR_OBJ	= 0

all: ${NAME}

${NAME}: ${OBJS}
	@${AR} ${NAME} ${OBJS}
	@printf "$(_BOLD)$(NAME)$(_RESET) compiled $(_GREEN)$(_BOLD)successfully$(_RESET)\n\n"

bonus: ${OBJSB}
	@${AR} ${NAME} ${OBJSB}
	@printf "$(_BOLD)$(NAME)$(_RESET) compiled $(_GREEN)$(_BOLD)successfully$(_RESET)\n\n"

${BUILD}${MANDA_DIR}%.o: ${SRC_DIR}${MANDA_DIR}%.s
	@mkdir -p ${BUILD}${MANDA_DIR}
	@${NASM} ${FLAGS} $< -o $@
	@$(eval CURR_OBJ=$(shell echo $$(( $(CURR_OBJ) + 1 ))))
	@$(eval PERCENT=$(shell echo $$(( $(CURR_OBJ) * 100 / $(OBJS_TOTAL) ))))
	@printf "$(_GREEN)($(_BOLD)%3s%%$(_RESET)$(_GREEN)) $(_RESET)Compiling $(_BOLD)$(_PURPLE)$<$(_RESET)\n" "$(PERCENT)"

	
${BUILD}${BONUS_DIR}%.o: ${SRC_DIR}${BONUS_DIR}%.s
	@mkdir -p ${BUILD}${BONUS_DIR}
	@${NASM} ${FLAGS} $< -o $@
	@$(eval CURR_OBJ=$(shell echo $$(( $(CURR_OBJ) + 1 ))))
	@$(eval PERCENT=$(shell echo $$(( $(CURR_OBJ) * 100 / $(OBJS_TOTAL) ))))
	@printf "$(_GREEN)($(_BOLD)%3s%%$(_RESET)$(_GREEN)) $(_RESET)Compiling $(_BOLD)$(_PURPLE)$<$(_RESET)\n" "$(PERCENT)"

clean:
	@rm -f ${OBJS} ${OBJSB}
	@printf "\n$(_BOLD)All objects are $(_GREEN)cleaned $(_RESET)! 🎉\n\n"	

fclean: clean
	@rm -f ${NAME}
	@printf "Cleaned $(_BOLD)$(NAME)$(_RESET) !\n\n"

test: ${NAME}
	@cc srcs/tests/libasm_test.c libasm.a -o libasm_test

test_bonus: bonus
	@cc srcs/tests/libasm_test_bonus.c libasm.a -o libasm_test_bonus

re: fclean all

.PHONY: clean fclean re all bonus
