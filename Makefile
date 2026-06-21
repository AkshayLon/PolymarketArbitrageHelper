# Compiler configuration
CXX = g++

# Organisational directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include

# File handling variables
SRC = $(SRC_DIR)/main.cpp
TARGET = $(BUILD_DIR)/run
CXX_FLAGS = -I$(INCLUDE_DIR)

# Compile and run executable
all: $(TARGET)
	@echo "Executable successfully compiled"

$(TARGET): $(SRC)
	@$(CXX) $^ $(CXX_FLAGS) -o $@

# Cleanup command
clean:
	@rm -f *.o
	@rm -f $(TARGET)
	@echo "Cleanup complete"

