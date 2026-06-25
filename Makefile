# Compiler configuration
CXX = g++

# Organisational directories
SRC_DIR = src
BUILD_DIR = build
INCLUDE_DIR = include

# Curl directories
CURL_DIR = external/curl
CURL_PREFIX = $(BUILD_DIR)/curl
TEMP_CURL_BUILD = $(BUILD_DIR)/curl_build

# File handling variables
SRC = $(SRC_DIR)/main.cpp
TARGET = $(BUILD_DIR)/run
CXX_FLAGS = -I$(INCLUDE_DIR) -I$(CURL_PREFIX)/include
LDFLAGS = -L$(CURL_PREFIX)/lib
LDLIBS = -lcurl

# Compile and run executable
all: curl $(TARGET)
	@echo "Executable successfully compiled"

$(TARGET): $(SRC)
	@$(CXX) $^ $(CXX_FLAGS) $(LDFLAGS) $(LDLIBS) -o $@

curl:
	cmake -G "MinGW Makefiles" -S $(CURL_DIR) -B $(TEMP_CURL_BUILD) \
	-DCMAKE_INSTALL_PREFIX=$(CURDIR)/$(CURL_PREFIX) \
	-DCURL_USE_LIBPSL=OFF \
	-DCURL_USE_LIBIDN2=OFF \
	-DCURL_USE_BROTLI=OFF \
	-DCURL_USE_NGHTTP2=OFF \
	-DBUILD_CURL_EXE=OFF \
	-DBUILD_SHARED_LIBS=OFF
	cmake --build $(TEMP_CURL_BUILD)
	cmake --install $(TEMP_CURL_BUILD)

# Cleanup command
clean:
	@rm -rf $(BUILD_DIR)
	@echo "Cleanup complete"

.PHONY: all clean curl