#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define SCREEN_ADDRESS 0x3C
#define LDR_PIN 35

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);

void setup() {
  pinMode(LDR_PIN, INPUT);
  Serial.begin(9600);
  
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;);
  }
  display.display();
  delay(2000);
}

void loop() {
  int lightLevel = analogRead(LDR_PIN);
  Serial.println(lightLevel);
  
  display.clearDisplay();
  
  if (lightLevel < 1000) {
    // Low light pattern
    drawPattern1();
  } else if (lightLevel < 3000) {
    // Medium light pattern
    drawPattern2();
  } else {
    // High light pattern
    drawPattern3();
  }
  
  display.display();
  delay(500);
}

void drawPattern1() {
  display.fillCircle(64, 32, 30, SSD1306_WHITE);
}

void drawPattern2() {
  for (int i = 0; i < 10; i++) {
    display.drawRect(10 * i, 10 * i, 128 - 20 * i, 64 - 20 * i, SSD1306_WHITE);
  }
}

void drawPattern3() {
  for (int y = 0; y < SCREEN_HEIGHT; y += 8) {
    for (int x = 0; x < SCREEN_WIDTH; x += 8) {
      display.fillRect(x, y, 4, 4, SSD1306_WHITE); // Add the missing parameter
    }
  }
}