import RPI.GPIO as GPIO
import TIME

GREEN = 10
YELLOW = 9
RED = 11
SEGMENTS = [26, 19, 13, 6, 5, 21, 20, 12]
DISPLAY = [0xc0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0x82, 0xF8, 0x80, 0x90]

#Pin setup:
GPIO.setmod(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(GREEN, GPIO.OUT)
GPIO.setup(YELLOW, GPIO.OUT)
GPIO.setup(RED, GPIO.OUT)
for pin in SEGMENTS:
    GPIO.setup(pin, GPIO.OUT)

def PORT(pin):
    for i in range(8):
        if pin & (1 << i):
            GPIO.output(SEGMENTS[i], GPIO.HIGH)
        else:
            GPIO.output(SEGMENTS[i], GPIO.LOW)
def display_number(num):
    if 0 <= num <= 9:
        PORT(DISPLAY[num])

try:
    while True:
        GPIO.output(GREEN, GPIO.HIGH)
        for i in range(9, 0, -1):
            display_number(i)
            time.sleep(1)
        display_number(0)
        GPIO.output(GREEN, GPIO.LOW)
        time.sleep(1)

        GPIO.output(YELLOW, GPIO.HIGH)
        time.sleep(1)
        GPIO.output(YELLOW, GPIO.LOW)
        time.sleep(1)

        GPIO.output(RED, GPIO.HIGH)
        for i in range (9, 0, -1):
            display_number(i)
            time.sleep(1)
        display_number(0)
        GPIO.output(RED, GPIO.LOW)
        times.sleep(1)
except KeyboardInterrupt:
    print("Traffic light stop!")
finally:
    GPIO.cleanup()
