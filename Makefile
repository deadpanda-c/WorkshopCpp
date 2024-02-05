CXX	=	g++

SRC	=	$(shell find src -name "*.cpp" ! -name "main.cpp")

MAIN_SRC	=	src/main.cpp

OBJ	=	$(SRC:.cpp=.o)

MAIN_OBJ	=	$(MAIN_SRC:.cpp=.o)

NAME	=	workshop

CXXFLAGS	=	-W -Wall -Wextra -I./include -std=c++20 -g3 -I./include

all:	$(NAME)

$(NAME):	$(OBJ) $(MAIN_OBJ)
	$(CXX) -o $(NAME) $(MAIN_OBJ) $(OBJ) $(CXXFLAGS)

clean:
	rm -f $(OBJ)

fclean:	clean
	rm -f $(NAME)

re:	fclean all
