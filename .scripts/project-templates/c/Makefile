TARGET = {PROGRAM_NAME}
INSTALL_DIR = /usr/local/bin

CFILES = $(wildcard src/*.c)
HEADERS = $(wildcard src/*.h)
OBJECTS = $(CFILES:.c=.o)

DEBUG = on

CC = gcc
CFLAGS = -Wall -std=c99
TESTFLAGS = -Isrc
LDLIBS =

ifeq ($(OS), Windows_NT)

endif

ifeq ($(DEBUG),on)
	CFLAGS += -g3 -O0
else
	CFLAGS += -O2
endif

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDLIBS)

$(TARGET)-test: $(OBJECTS:src/main.o=test/main.o)
	$(CC) $(CFLAGS) $(TESTFLAGS) $^ -o $@ $(LDLIBS)

test/%.o: test/%.c $(HEADERS)
	$(CC) $(CFLAGS) $(TESTFLAGS) -c $< -o $@

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm src/*.o
	rm test/*.o

.PHONY: run
run: $(TARGET)
	./$(TARGET)

.PHONY: test
test: $(TARGET)-test
	./$(TARGET)-test

.PHONY: debug
debug:
	gdb -q $(TARGET)

.PHONY: watch
watch:
	fd '\.c|\.h|Makefile' | entr -cs 'make -s && make -s run'

.PHONY: install
install:
	sudo cp $(TARGET) $(INSTALL_DIR)

.PHONY: uninstall
uninstall:
	sudo rm -i $(INSTALL_DIR)/$(TARGET)
