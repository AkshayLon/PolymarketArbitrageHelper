# Compiler configuration
CXX = g++

# Organisational directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include

# File handling variables
SRC = $(SRC_DIR)/main.cpp $(SRC_DIR)/HTTP_Client.cpp
TARGET = $(BUILD_DIR)/run
CXX_FLAGS = -I$(INCLUDE_DIR) 
LDLIBS = -lcurl

# Compile and run executable
all: $(BUILD_DIR) $(TARGET)
	@echo "Executable successfully compiled"

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(SRC)
	@$(CXX) $^ $(CXX_FLAGS) -o $@ $(LDLIBS) 

# Cleanup command
clean:
	@rm -rf $(BUILD_DIR)
	@echo "Cleanup complete"