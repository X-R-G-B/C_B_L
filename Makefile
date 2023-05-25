TARGET			=		pendu

SRC				=						\
						pendu.cbl		\
						show_state.cbl

COBCFLAGS		=		-O

all: $(TARGET)

$(TARGET): $(OBJ)
	cobc $(COBCFLAGS) -x -o $(TARGET) $(SRC)

clean:
	$(RM) \
		$(SRC:.cbl=.o) \
		$(SRC:.cbl=.c.h) \
		$(SRC:.cbl=.c.l.h) \
		$(SRC:.cbl=.c) \
		$(SRC:.cbl=.i) \
		$(SRC:.cbl=.so)

fclean: clean
	$(RM) $(TARGET)
