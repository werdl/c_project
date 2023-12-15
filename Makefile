# Compiler and flags
CC = gcc
CFLAGS = -g -Wall -Werror -pedantic
INCLUDES = -I include

# Directories
SRC = src
BIN = bin

# Source and object files
SRCS = $(wildcard $(SRC)/*.c)
OBJS = $(patsubst $(SRC)/%.c, $(BIN)/%.o, $(SRCS))

# Target executable
TARGET = myprogram

# Default target
all: $(TARGET)

# Linking
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# Compilation
$(BIN)/%.o: $(SRC)/%.c | $(BIN)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

# Create the bin directory if it doesn't exist
$(BIN):
	mkdir -p $(BIN)

# Clean up
clean:
	rm -rf $(BIN) $(TARGET) 