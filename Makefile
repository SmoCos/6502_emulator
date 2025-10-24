


# include .env
# include ${P_Media}/colours.sh

# NAME	= minicomputer
# CC		= c++
# CFLAGS	= -Wall -Wextra -Werror -g3
# SANITIZE_FLAGS = -fsanitize=address -fsanitize=undefined

# VALGRIND = memorytest

# SRC_MAIN =	./main.cpp

# # LIBFT_PATH = ./LIB/LIBFT/
# # LIBFT_NAME = libft
# # LIBFT = $(LIBFT_PATH)$(LIBFT_NAME)

# # INCLUDES =	-I/usr/include \
# # 			-I$(LIBFT_PATH) \
# # 			-I./INC


# SRC_PATH = ./
# SRC = \
# 	Hardware/Srcs/MOS6502


# SRCS = $(addprefix $(SRC_PATH), $(SRC))

# OBJ_PATH = ./OBJ/
# OBJS = $(SRC:.cpp=.o)
# OBJECTS = $(addprefix $(OBJ_PATH), $(OBJS))


# all: $(NAME)

# $(OBJ_PATH)%.o: $(SRC_PATH)%.cpp | $(OBJ_PATH)
# 	@mkdir -p $(dir $@)
# 	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# $(OBJ_PATH):
# 	@mkdir -p $(OBJ_PATH)

# # $(LIBFT):
# # 	@make -C $(LIBFT_PATH) all

# $(NAME): $(OBJECTS) $(SRC_MAIN) #$(LIBFT)
# 	@$(CC) $(CFLAGS) $(SANITIZE_FLAGS) $(INCLUDES) -o $(NAME) $(SRC_MAIN) $(OBJECTS)
# #$(LIBFT)

# $(VALGRIND): $(SRC_MAIN) $(OBJECTS) #$(LIBFT)
# 	@$(CC) $(CFLAGS) $(INCLUDES) -o $(VALGRIND) $(SRC_MAIN) $(OBJECTS)
# #$(LIBFT)

# clean:
# 	@rm -rf $(OBJ_PATH)
# # 	@make clean -C
# #$(LIBFT_PATH)


# fclean: clean
# 	@rm -f $(NAME)
# # 	@rm -f $(VALGRIND)
# # 	@make fclean -C $(LIBFT_PATH)
# # 	@rm -f valgrind-out.txt


# valgrind: $(VALGRIND)
# 	@valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt ./$(VALGRIND)

# re: fclean all

# .PHONY: all clean fclean re
