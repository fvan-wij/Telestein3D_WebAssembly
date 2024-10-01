NAME	:= telestein3d.js
CC		:= emcc
CFLAGS	:= -O3
LIBMLX	:= ./lib/MLX42
LIBFT	:= ./lib/libft
MAUDIO	:= ./lib/miniaudio

LINUXFLAGS = -s USE_GLFW=3 -s USE_WEBGL2=1 -s FULL_ES3=1 -s WASM=1 -s NO_EXIT_RUNTIME=1 -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap"]' --preload-file ./data -sALLOW_MEMORY_GROWTH -s TOTAL_STACK=8388608

HEADERS	:= -I ./inc -I $(LIBMLX)/include/MLX42 -I $(LIBFT) -I $(MAUDIO)
LIBS	:= $(LIBMLX)/build/libmlx42.a $(LIBFT)/libft.a
SRCS	:= \
		   main.c 				\
		   animation.c			\
		   cbd_main.c			\
		   cbd_render.c			\
		   cbd_loop.c			\
		   beheading.c			\
		   error/error.c 		\
		   entity.c				\
		   player.c				\
		   init/cbd_init.c		\
		   audio/game_audio.c	\
		   audio/menu_audio.c	\
		   audio/cbd_audio.c 	\
		   audio/miniaudio.c 	\
		   parser/parser.c 		\
		   parser/init.c 		\
		   parser/get_data.c 	\
		   parser/get_data_bonus.c\
		   parser/bools.c		\
		   parser/getters.c		\
		   parser/validate_data.c \
		   menu/menu_navigation.c\
		   menu/menu_setters.c	\
		   menu/menu_loadmap.c	\
		   raycaster/raycaster.c\
		   vec/vec.c			\
		   render/draw.c		\
		   render/line.c		\
		   render/shape.c		\
		   render/color.c		\
		   render/post_processing.c \
		   render/entity.c		\
		   render/dithering.c	\
		   render/walls.c		\
		   render/particles.c	\
		   render/gui.c			\
		   utility/printing.c	\
		   utility/cleanup.c	\
		   input/input.c		\
		   input/combat.c		\
		   input/player_movement.c		\
		   input/player_animation.c		\
		   input/particle_movement.c		\
		   input/cursor_hook.c		\
		   input/mouse_input.c		\
		   input/mouse_hook.c		\

SRCDIR	:= ./src
OBJDIR	:= ./obj
OBJS	:= $(addprefix $(OBJDIR)/,$(SRCS:.c=.o))
SRCS	:= $(addprefix $(SRCDIR)/,$(SRCS))

all:
	$(MAKE) libft libmlx $(NAME)

libmlx:
	@cp -f ./data/default.frag ./lib/MLX42/shaders/default.frag

libft:
	@make -s $(LIBFT_DEBUG) -C $(LIBFT)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) $(HEADERS) -o $@ -c $<  && printf "[emcc]\033[0;32m\033[1m Building: $(notdir $<) \033[0m\n"

$(NAME): $(OBJS)
	@$(CC) $(OBJS) $(LIBS) $(LINUXFLAGS) $(HEADERS) -o $(NAME)
	@printf "[Telestein3D_WebAssembly]\033[0;32m\033[1m Compiled succesfully ✅\033[0m\n"

clean:
	@rm -rf $(OBJDIR)
	@make -s -C $(LIBFT) clean
	@echo $(Yellow) Removed .o files $(Text_Off)

fclean: clean
	@rm -rf $(NAME)
	@rm -rf telestein3d.js
	@rm -rf telestein3d.wasm
	@rm -rf telestein3d.data
	@make -s -C $(LIBFT) fclean
	@echo $(Yellow) Removed .wasm, .data, .js $(Text_Off)

re: clean all

.PHONY: all, clean, fclean, re, libmlx

# Colors #############################################
Black		= "\033[0;30m"		# Black
Red			= "\033[0;31m"		# Red
Green		= "\033[0;32m"		# Green
Yellow		= "\033[0;33m"		# Yellow
Blue		= "\033[0;34m"		# Blue
Purple		= "\033[0;35m"		# Purple
Cyan		= "\033[0;36m"		# Cyan
White		= "\033[0;37m"		# White
Text_Off	= "\033[0m"			# Text Style Off
Bold		= "\033[1m"			# Text Style Bold
######################################################
