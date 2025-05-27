import RPI.GPIO as GPIO #import RPIO.GPIO module
import time #import time module

GREEN = 10 #set gpio 10 for green led
YELLOW = 9 #set gpio 9 for yellow led
RED = 11 #set gpio 11 for red led
SEGMENTS = [26, 19, 13, 6, 5, 21, 20, 12] #set gpios for each segment on seven segment display
DISPLAY = [0xc0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0x82, 0xF8, 0x80, 0x90] #set numbers to be display

#Pin setup:
GPIO.setmod(GPIO.BCM) #set pin numbering system to BCM
GPIO.setwarnings(False) #prevent warnings from being printed
GPIO.setup(GREEN, GPIO.OUT) #set green led as output
GPIO.setup(YELLOW, GPIO.OUT) #set yellow led as output
GPIO.setup(RED, GPIO.OUT) #set red led as output
for pin in SEGMENTS:    
    GPIO.setup(pin, GPIO.OUT) #set each segments on seven segment display as ooutput using for loop

def PORT(pin): #function to control the segments on seven segment display
    for i in range(8): #loop through each of the 8 segments
        if pin & (1 << i): #check if the i-th pin is set
            GPIO.output(SEGMENTS[i], GPIO.HIGH) # turn on the segment
        else:
            GPIO.output(SEGMENTS[i], GPIO.LOW) # turn off the segment
def display_number(num): # function to display a number on seven segment display
    if 0 <= num <= 9: # check if the number is between 0 and 9
        PORT(DISPLAY[num]) #call PORT function with the corresponding value

try:
    while True: #infinite loop to run the traffic light sequence
        GPIO.output(GREEN, GPIO.HIGH) #turn on the green led
        for i in range(9, 0, -1): #count down from 9 to 1
            display_number(i) #display the current number on seven segment display
            time.sleep(1) #wait for 1 seconds
        display_number(0) #display 0 on the seven segments display
        GPIO.output(GREEN, GPIO.LOW) #turn off the green led
        time.sleep(1) #wait for 1 second

        GPIO.output(YELLOW, GPIO.HIGH) #turn on the yellow led
        time.sleep(1) #wait for 1 second
        GPIO.output(YELLOW, GPIO.LOW) #turn off the yellow led
        time.sleep(1) #wait for 1 second

        GPIO.output(RED, GPIO.HIGH) #turn on the red led
        for i in range (9, 0, -1): #count down from 9 to 1
            display_number(i) #display the current number on seven segment display
            time.sleep(1) #wait for 1 second
        display_number(0) #display 0 on the seven segment display
        GPIO.output(RED, GPIO.LOW) #turn off the red eld
        times.sleep(1) #wait for 1 second
except KeyboardInterrupt: #if user click Ctrl+C
    print("Traffic light stop!") #print "Traffic light stop!"
finally:
    GPIO.cleanup() #clean up gpio settings before exiting
