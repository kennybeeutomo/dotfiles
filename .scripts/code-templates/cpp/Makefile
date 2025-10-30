TARGET = main
INSTALL_DIR = /usr/local/bin

CXXFILES = $(wildcard src/*.cpp)
HEADERS = $(wildcard src/*.hpp)
OBJECTS = $(CXXFILES:.cpp=.o)

DEBUG = on

CXX = g++
CXXFLAGS = -Wall -std=c++11
TESTFLAGS = -Isrc
LDLIBS =

ifeq ($(OS), Windows_NT)

endif

ifeq ($(DEBUG),on)
	CXXFLAGS += -g3 -O0
else
	CXXFLAGS += -O2
endif

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDLIBS)

$(TARGET)-test: $(OBJECTS:src/main.o=test/main.o)
	$(CXX) $(CXXFLAGS) $(TESTFLAGS) $^ -o $@ $(LDLIBS)

test/%.o: test/%.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) $(TESTFLAGS) -c $< -o $@

%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm src/*.o
	rm test/*.o

.PHONY: run
run: $(TARGET)
	./$(TARGET)

.PHONY: test
test: $(TARGET)
	bash test/test.sh
# test: $(TARGET)-test
# 	./$(TARGET)-test

.PHONY: debug
debug:
	gdb -q $(TARGET)

.PHONY: watch
watch:
	fd '\.cpp|\.hpp|Makefile' | entr -cs 'make -s && make -s run'

.PHONY: install
install:
	sudo cp $(TARGET) $(INSTALL_DIR)

.PHONY: uninstall
uninstall:
	sudo rm -i $(INSTALL_DIR)/$(TARGET)
