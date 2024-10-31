CC = gcc
CFLAGS = -Wall -O2 -Iinclude  -v
CPPFLAGS +=
LDFLAGS += -lheif -lm
BUILD_DIR = build
BIN_DIR = bin
DEBUG_DIR = debug
TEST_DIR_BIN = tests/tests/bin
TEST_DIR_BUILD = tests/tests/build
TEST_DIR = tests/tests
SRC1 = src/img2img.c
OBJ1 = $(SRC1:src/%.c=$(BUILD_DIR)/%.o)

SRC2 = src/img2lcd.c
OBJ2 = $(SRC2:src/%.c=$(BUILD_DIR)/%.o)

SRC3 = src/heic2img.c
OBJ3 = $(SRC3:src/%.c=$(BUILD_DIR)/%.o)

TEST1 = tests/tests/test.c
OBJTEST1 = $(TEST1:tests/tests/%.c=$(TEST_DIR_BUILD)/%.o)

TARGET1 = $(BIN_DIR)/img2img
TARGET2 = $(BIN_DIR)/img2lcd
TARGET3 = $(BIN_DIR)/heic2img

TEST_TARGET1 = $(TEST_DIR_BIN)/test

DEBUG1 = $(DEBUG_DIR)/img2img
DEBUG2 = $(DEBUG_DIR)/img2lcd
DEBUG3 = $(DEBUG_DIR)/heic2img

all: $(BUILD_DIR) $(BIN_DIR) $(TARGET1) $(TARGET2) $(TARGET3)
test: $(TEST_DIR_BUILD) $(TEST_DIR_BIN) $(TEST_TARGET1)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(TEST_DIR_BUILD):
	mkdir -p $(TEST_DIR_BUILD)

$(TEST_DIR_BIN):
	mkdir -p $(TEST_DIR_BIN)

$(TEST_DIR_BUILD)/%.o: tests/tests/%.c
	$(CC)  -c $< -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(BUILD_DIR)/%.o: src/%.c
	$(CC)  -c $< -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET1): $(OBJ1)
	$(CC)  -o $@ $(OBJ1) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET2): $(OBJ2)
	$(CC)  -o $@ $(OBJ2) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET3): $(OBJ3)
	$(CC)  -o $@ $(OBJ3) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TEST_TARGET1): $(OBJTEST1)
	$(CC)  -o $@ $(OBJTEST1) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)



clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET1) $(TARGET2) $(TARGET3) $(TEST_DIR_BUILD) $(TEST_DIR_BIN) $(TEST_TARGET1)
