CC		= gcc
CFLAGS 	= -Wall -Wextra
SRC 	= $(wildcard src/*.c)
OBJ 	= $(patsubst src/%.c, obj/%.o, $(SRC))
TARGET 	= clox

.PHONY: clean all

$(shell mkdir -p obj)

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^

obj/%.o:src/%.c
	$(CC) $(CFLAGS) -I inc/ -c -o $@ $<

clean:
	rm -rf obj/ $(TARGET)
