# Compiler variables
CC=g++
LEX=flex
YACC=bison

# Directories
SRC_DIR=src
BUILD_DIR=build
TEST_DIR=tests

# File names
LEX_FILE=$(SRC_DIR)/lexer.lex
YACC_FILE=$(SRC_DIR)/parser.ypp
LEX_OUTPUT=$(BUILD_DIR)/lex.yy.cc
YACC_OUTPUT=$(BUILD_DIR)/parser.tab.cpp $(BUILD_DIR)/parser.tab.hpp
OUTPUT_FILES=$(BUILD_DIR)/lex.yy.cc $(BUILD_DIR)/parser.tab.cpp
EXECUTABLE=$(BUILD_DIR)/lughati-parser

# Flags
CFLAGS=-Wall -Wextra
LDFLAGS=

all: clean build run

# IF OUTPUT_FILE is not set, then print to stdout else print to OUTPUT_FILE
run: $(EXECUTABLE)
	$(if $(OUTPUT_FILE), ./$(EXECUTABLE) $(INPUT_FILE) > $(OUTPUT_FILE), ./$(EXECUTABLE) $(INPUT_FILE))


# Targets
build: $(EXECUTABLE)

$(EXECUTABLE): $(OUTPUT_FILES)
	$(CC) $(LDFLAGS) $^ -o $@

$(LEX_OUTPUT): $(LEX_FILE) $(YACC_OUTPUT)
	$(LEX) -+ -o $@ $(LEX_FILE)

# Generate parser.tab.c and parser.tab.h
$(YACC_OUTPUT): $(YACC_FILE)
	$(YACC) -d $(YACC_FILE) -o $@


run_test: $(EXECUTABLE)
	./$(EXECUTABLE) $(TEST_DIR)/$(TEST_NAME)/input.txt > $(TEST_DIR)/$(TEST_NAME)/output.txt
	diff $(TEST_DIR)/$(TEST_NAME)/expected_output.txt $(TEST_DIR)/$(TEST_NAME)/output.txt || echo "Test failed" && echo "Test passed"

TEST_NAMES=$(shell ls $(TEST_DIR))
run_tests: $(EXECUTABLE)
	$(foreach test_name, $(TEST_NAMES), $(MAKE) run_test TEST_NAME=$(test_name);)

clean:
	rm -f $(EXECUTABLE) $(OBJ_FILES) $(LEX_OUTPUT) $(YACC_OUTPUT)

.PHONY: all test clean
