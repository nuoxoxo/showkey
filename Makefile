CC	:= 	cc
RM	:=	/bin/rm -f
FSA	:=	-fsanitize=address
FLG	:=	-Wall -Wextra -Werror
#FLG	:=	-Wall -Wextra -Werror $(FSA)

#OGL	:=	-framework OpenGL -framework AppKit		# toggle on for macos
#MLX	:=	./mlx/libmlx.a -lXext -lX11 -lm -lz $(OGL)	# toggle on for macos
MLX	:=	./mlx/libmlx.a -lXext -lX11 -lm -lz		# switch on for linux

#SRC	=	main.c
#SRC	=	main2.c
#SRC	=	event.c
SRC	=	showkey.c
#SRC	=	showkey_macos.c		# toggle off for Linux

BUD	=	$(SRC:.c=.o)
NAME	=	$(SRC:.c=)

%.o	:	%.c
		$(CC) $(FLG) -c $< -o $@

all	:	$(NAME)

$(NAME)	:	$(BUD)
		$(CC) $(FG) $(BUD) -o $(NAME) $(MLX)

clean	:
		$(RM) *.o

fclean	:	clean
		$(RM) $(NAME)

re	:	fclean all

.PHONY	:	all clean fclean re
