CC = gcc
CFLAGS = -Wall -O2 -Iinclude  -v
CPPFLAGS +=
LDFLAGS += -lheif -lm
BUILD_DIR = build
BIN_DIR = bin

SRC1 = src/img2img.c
OBJ1 = $(SRC1:src/%.c=$(BUILD_DIR)/%.o)

SRC2 = src/img2lcd.c
OBJ2 = $(SRC2:src/%.c=$(BUILD_DIR)/%.o)

SRC3 = src/heic2img.c
OBJ3 = $(SRC3:src/%.c=$(BUILD_DIR)/%.o)

TARGET1 = $(BIN_DIR)/img2img
TARGET2 = $(BIN_DIR)/img2lcd
TARGET3 = $(BIN_DIR)/heic2img



all: $(BUILD_DIR) $(BIN_DIR) $(TARGET1) $(TARGET2) $(TARGET3)


$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(BUILD_DIR)/%.o: src/%.c
	$(CC)  -c $< -o $@ $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET1): $(OBJ1)
	$(CC)  -o $@ $(OBJ1) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET2): $(OBJ2)
	$(CC)  -o $@ $(OBJ2) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)

$(TARGET3): $(OBJ3)
	$(CC)  -o $@ $(OBJ3) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS)


clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(TARGET1) $(TARGET2) $(TARGET3)