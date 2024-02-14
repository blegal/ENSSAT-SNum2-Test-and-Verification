CC=g++
LDFLAGS=-lm
EXEC=main
SRC=./src/main.cpp

OBJ= $(SRC:.cpp=.o)

CFLAGS=-O2 -Wall -std=c++11

all: $(EXEC)

main: $(OBJ)
	$(CC) $(CFLAGS) -o ./bin/$@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean:
	find . -name "*.o" -delete
	find ./bin/$(EXEC) -delete

mrproper: clean
	rm $(EXEC)
