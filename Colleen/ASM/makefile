NAME = Colleen

CC = nasm

UNAME_S = $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    CFLAGS = -f elf64

	E = -e

	# Colored Text
	_BLACK			= \e[0;30m
	_RED 			= \e[0;31m
	_GREEN			= \e[0;32m
	_BROWN			= \e[0;33m
	_BLUE			= \e[0;34m
	_PURPLE			= \e[0;35m
	_CYAN			= \e[0;36m
	_LIGHT_GRAY		= \e[0;37m
	_DARK_GRAY		= \e[1;30m
	_LIGHT_RED		= \e[1;31m
	_LIGHT_GREEN	= \e[1;32m
	_YELLOW			= \e[1;33m
	_LIGHT_BLUE		= \e[1;34m
	_LIGHT_PURPLE	= \e[1;35m
	_LIGHT_CYAN		= \e[1;36m
	_WHITE			= \e[1;37m
	_NC 			= \e[0m

	# Color reset
	_COLOR_RESET	= \e[0m

	SRC = Colleen_linux.s
endif
ifeq ($(UNAME_S),Darwin)
    CFLAGS = -f macho64

	E = ""

	# Colored Text
	_BLACK			= \033[0;30m
	_RED 			= \033[0;31m
	_GREEN			= \033[0;32m
	_BROWN			= \033[0;33m
	_BLUE			= \033[0;34m
	_PURPLE			= \033[0;35m
	_CYAN			= \033[0;36m
	_LIGHT_GRAY		= \033[0;37m
	_DARK_GRAY		= \033[1;30m
	_LIGHT_RED		= \033[1;31m
	_LIGHT_GREEN	= \033[1;32m
	_YELLOW			= \033[1;33m
	_LIGHT_BLUE		= \033[1;34m
	_LIGHT_PURPLE	= \033[1;35m
	_LIGHT_CYAN		= \033[1;36m
	_WHITE			= \033[1;37m
	_NC 			= \033[0m

	# Color reset
	_COLOR_RESET	= \033[0m

	SRC = Colleen_macos.s
endif

OUT = $(patsubst %.s, %.o, $(SRC))

all: $(NAME)

$(NAME): $(OUT)
	@echo $(E) "$(_PURPLE)Linking $(NAME)$(_COLOR_RESET)"
	@gcc $(OUT) -o $(NAME) -g
	@echo $(E) "$(_GREEN)DONE$(_COLOR_RESET)"

verify: $(NAME)
	@ ./$(NAME) > out_$(NAME)
	@ if diff $(SRC) out_$(NAME) > /dev/null; then \
		echo $(E) "$(_GREEN)$(NAME) is a Quine!$(_COLOR_RESET)"; \
	else \
		echo $(E) "$(_RED)$(NAME) is not a Quine!$(_COLOR_RESET)"; \
	fi

$(OUT): $(SRC)
	@echo $(E) "$(_CYAN)Compiling $(basename $(notdir $(SRC))) $(_COLOR_RESET)"
	@$(CC) $(CFLAGS) $< -o $@

re: fclean
	@make $(NAME)

fclean: clean
	@echo $(E) "$(_RED)Cleaning compiled binary files$(_COLOR_RESET)"
	@rm -rf $(NAME)
	@rm -rf out_$(NAME)

clean:
	@echo $(E) "$(_RED)Cleaning object files$(_COLOR_RESET)"
	@rm -rf $(OUT)
