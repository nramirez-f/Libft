SRCS = ft_isalpha.c\
	   ft_isdigit.c\
	   ft_isalnum.c\
	   ft_isascii.c\
	   ft_isprint.c\
	   ft_strlen.c\
	   ft_strchr.c\
	   ft_strrchr.c\
	   ft_strncmp.c\
	   ft_strlcpy.c\
	   ft_strlcat.c\
	   ft_strnstr.c\
	   ft_memset.c\
	   ft_memcmp.c\
	   ft_bzero.c\
	   ft_memcpy.c\
	   ft_memchr.c\
	   ft_memmove.c\
	   ft_toupper.c\
	   ft_tolower.c\
	   ft_atoi.c\
	   ft_calloc.c\
	   ft_strdup.c\
	   ft_substr.c\
	   ft_strjoin.c\
	   ft_strtrim.c\
	   ft_split.c\
	   ft_itoa.c\
	   ft_strmapi.c\
	   ft_striteri.c\
	   ft_putchar_fd.c\
	   ft_putstr_fd.c\
	   ft_putendl_fd.c\
	   ft_putnbr_fd.c\

BONUS_SRCS = ft_lstnew_bonus.c\
			 ft_lstadd_front_bonus.c\
			 ft_lstsize_bonus.c\
			 ft_lstlast_bonus.c\
			 ft_lstadd_back_bonus.c\
			 ft_lstdelone_bonus.c\
			 ft_lstclear_bonus.c\
			 ft_lstiter_bonus.c\
			 ft_lstmap_bonus.c\

OBJS = $(SRCS:.c=.o)

BONUS_OBJS = $(BONUS_SRCS:.c=.o)

NAME = libft.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra 

LIBRARY = libft.h

all : $(NAME)

.c.o: 
	$(CC) $(CFLAGS) -c $< -o $(<:.c=.o)

$(NAME) : $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "$(NAME) created"
	@ranlib $(NAME)
	@echo "$(NAME) indexed"

bonus : all $(BONUS_OBJS)
	@ar q $(NAME) $(BONUS_OBJS)
	@echo "bonus appended to $(NAME)"
	@ranlib $(NAME)
	@echo "$(NAME) indexed"

clean :
	@$(RM) $(OBJS) $(BONUS_OBJS)
	@echo "objects deleted"

fclean : clean
	@$(RM) $(NAME)
	@echo "$(NAME) deleted"

re : fclean all

.PHONY: all clean fclean re
