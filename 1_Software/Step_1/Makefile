CC=gcc
EXEC=main
SRC=./src/main.c

CFLAGS=-O2 -Wall -std=c++11
LDFLAGS=-lm

OBJ= $(SRC:.c=.o)

all: $(EXEC)

main: $(OBJ)
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean:
	find . -name "*.o"         -delete
	find . -name ./bin/$(EXEC) -delete
