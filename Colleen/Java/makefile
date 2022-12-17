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

# Inverted, i.e. colored backgrounds
_IGREY			= \x1b[40m
_IRED			= \x1b[41m
_IGREEN			= \x1b[42m
_IYELLOW		= \x1b[43m
_IBLUE			= \x1b[44m
_IPURPLE		= \x1b[45
_ICYAN			= \x1b[46m
_IWHITE			= \x1b[47m

# Color reset
_COLOR_RESET	= \e[0m

NAME = Colleen.jar

SRC = Colleen.java
OUT = $(patsubst %.java, %.class, $(SRC))

CC = javac
CFLAGS = 

all: $(NAME)

$(NAME): $(OUT)
	@echo -e "$(_PURPLE)Linking $(NAME)$(_COLOR_RESET)"
	@jar cfm $(NAME) manifest.mf $(OUT)
	@echo -e "$(_GREEN)DONE$(_COLOR_RESET)"

verify: $(NAME)
	@java -jar $(NAME) > out_$(NAME)
	@if diff $(SRC) out_$(NAME) > /dev/null; then \
		echo -e "$(_GREEN)$(NAME) is a Quine!$(_COLOR_RESET)"; \
	else \
		echo -e "$(_RED)$(NAME) is not a Quine!$(_COLOR_RESET)"; \
	fi


$(OUT): $(SRC)
	@echo -e "$(_CYAN)Compiling $(basename $(notdir $(SRC))) $(_COLOR_RESET)"
	@$(CC) $(CFLAGS) $<

re: fclean
	@make $(NAME)

fclean: clean
	@echo -e "$(_RED)Cleaning compiled binary files$(_COLOR_RESET)"
	@rm -rf $(NAME)
	@rm -rf out_$(NAME)

clean:
	@echo -e "$(_RED)Cleaning object files$(_COLOR_RESET)"
	@rm -rf $(OUT)
