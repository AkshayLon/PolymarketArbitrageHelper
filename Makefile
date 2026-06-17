# Compiler configuration
CXX = g++

# File handling variables
SRC = main.cpp
TARGET = run

# Compile and run executable
all: $(TARGET)
	@echo "Executable successfully compiled"

$(TARGET): $(SRC)
	@$(CXX) $^ -o $@

# Cleanup command
clean:
	@rm -f *.o
	@rm -f $(TARGET)
	@echo "Cleanup complete"

