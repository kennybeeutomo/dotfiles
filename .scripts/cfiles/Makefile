NAME = {PROGRAM_NAME}
EXE = $(NAME)
TARGET = ./$(EXE)

DEBUG = on

CC = gcc
CFLAGS = -Wall -std=c17
LDLIBS = 

ifeq ($(DEBUG),on)
	CFLAGS += -g -O0
else
	CFLAGS += -O2
endif

CFILES = $(wildcard *.c)
OBJECTS = $(CFILES:.c=.o)

UP = \e[1A
CHECK = \e[92m✓\e[0m

all: $(OBJECTS)
	@echo "[   ] Linking $^"
	@$(CC) $(CFLAGS) $^ -o $(TARGET)
	@echo -e "$(UP)[ $(CHECK) ] Linking $^"

%.o: %.c %.h
	@echo "[   ] Compiling $^"
	@$(CC) -c $<
	@echo -e "$(UP)[ $(CHECK) ] Compiling $^"

%.o: %.c
	@echo "[   ] Compiling $^"
	@$(CC) -c $<
	@echo -e "$(UP)[ $(CHECK) ] Compiling $^"

clean:
	@echo "[   ] Deleting .o files"
	@rm *.o
	@echo -e "$(UP)[ $(CHECK) ] Deleting .o files"

run:
	@$(TARGET)

test:
	echo 1 | $(EXE)

.PHONY:
	clean run test
