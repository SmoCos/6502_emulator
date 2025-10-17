include .env
include ${P_Media}/colours.sh

NAME	= embedded
CC		= c++
CFLAGS	= -Wall -Wextra -Werror -g3


SRC = 



all: ${NAME}

clean:


fclean:

re: fclean all

.PHONY: all clean fclean re


NAME = BestWorstGame
VALGRIND = memorytester
CC = cc
CFLAGS = -Wall -Wextra -Werror -g3 #-O2
CFLAGS += -fno-omit-frame-pointer
SANITIZE_FLAGS = -fsanitize=address -fsanitize=undefined #-fno-sanitize-recover=all
DUNITY_FLAGS = -DUNITY_INCLUDE_DOUBLE -DUNITY_DOUBLE_PRECISION=1e-12

MLX_PATH = ./LIB/minilibx-linux/
MLX_NAME = libmlx.a
MLX = $(MLX_PATH)$(MLX_NAME)
MLX_FLAGS = -L$(MLX_PATH) -lmlx -L/usr/lib/X11 -lXext -lX11

LIBFT_PATH = ./LIB/LIBFT/
LIBFT_NAME = libft
LIBFT = $(LIBFT_PATH)$(LIBFT_NAME)

MUK_LIB_PATH = ./LIB/muk_lib/
MUK_LIB_NAME = muk_lib
MUK_LIB = $(MUK_LIB_PATH)$(MUK_LIB_NAME)

INCLUDES =	-I/usr/include \
			-I$(MLX_PATH) \
			-I$(LIBFT_PATH) \
			-I$(MUK_LIB_PATH) \
			-I./INC

SRC_MAIN =	./SRC/main.c

SRC_PATH = ./
SRC = \
		SRC/cleanup.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_add.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_contains.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_dup.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_free.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_init.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_len.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_minus.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_partial_free.c \
		SRC/FT_STR_ARR_UTILS/ft_str_arr_printf.c \
		SRC/FT_STR_ARR_UTILS/ft_strcmp.c \
		SRC/PARSE_CUB/parse_main.c \
		SRC/PARSE_CUB/parse_first_six_lines.c \
		SRC/PARSE_CUB/parse_first_six_lines_utils.c \
		SRC/PARSE_CUB/init_textures.c \
		SRC/PARSE_CUB/validate_map_lines.c \
		SRC/PARSE_CUB/validate_player.c \
		SRC/PARSE_CUB/open_cub_file.c \
		SRC/PARSE_CUB/parse_main_utils.c \
		SRC/PARSE_CUB/parse_floor_enclosed.c \
		SRC/INITIALIZE/validate_input.c \
		SRC/INITIALIZE/init_structures.c \
		SRC/MLX_and_INPUT/key_input.c \
		SRC/MLX_and_INPUT/moveeeee.c \
		SRC/MLX_and_INPUT/move_utils.c \
		SRC/MLX_and_INPUT/turrrrrn.c \
		SRC/MLX_and_INPUT/process_keys.c \
		SRC/RENDER/render_loop.c \
		SRC/RENDER/blit_utils.c \
		SRC/RENDER/render_timing.c \
		SRC/RENDER/ray_casting.c \
		SRC/RENDER/ray_casting_utils.c \
		SRC/RENDER/paint_wall.c \
		SRC/debug_prints.c \

SRCS = $(addprefix $(SRC_PATH), $(SRC))

OBJ_PATH = ./OBJ/
OBJS = $(SRC:.c=.o)
OBJECTS = $(addprefix $(OBJ_PATH), $(OBJS))


all: $(NAME)
	@./$(NAME) $(MAP_NAME)



$(OBJ_PATH)%.o: $(SRC_PATH)%.c | $(OBJ_PATH)
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(OBJ_PATH):
	@mkdir -p $(OBJ_PATH)

$(MLX):
	@make -sC $(MLX_PATH) -w

$(LIBFT):
	@make -C $(LIBFT_PATH) all

$(MUK_LIB):
	@make -C $(MUK_LIB_PATH) all

$(NAME): $(OBJECTS) $(MLX) $(LIBFT) $(MUK_LIB) $(SRC_MAIN)
	@$(CC) $(CFLAGS) $(SANITIZE_FLAGS) $(INCLUDES) -o $(NAME) $(SRC_MAIN) $(OBJECTS) $(LIBFT) $(MUK_LIB) $(MLX_FLAGS) -lm

$(VALGRIND): $(SRC_MAIN) $(OBJECTS) $(LIBFT) $(MUK_LIB) $(MLX)
	@$(CC) $(CFLAGS) $(INCLUDES) -o $(VALGRIND) $(SRC_MAIN) $(OBJECTS) $(LIBFT) $(MUK_LIB) $(MLX_FLAGS) -lm

clean:
	@rm -rf $(OBJ_PATH)
	@make clean -C $(MLX_PATH)
	@make clean -C $(LIBFT_PATH)
	@make clean -C $(MUK_LIB_PATH)

fclean: clean
	@rm -f $(NAME)
	@rm -f $(VALGRIND)
	@make fclean -C $(LIBFT_PATH)
	@make fclean -C $(MUK_LIB_PATH)
	@rm -f valgrind-out.txt

re: fclean all

valgrind: $(VALGRIND)
	@valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./$(VALGRIND) $(MAP_NAME)

.PHONY: all clean fclean re test memory aaaa
