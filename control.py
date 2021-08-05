import serial
import keyboard
from pynput import keyboard

s = serial.Serial(port='/dev/ttyUSB0', baudrate=115200, bytesize=8)

'''while True:
    if keyboard.is_pressed('w'):
        print("test")
        s.write(b"1")
    if keyboard.is_pressed('a'):
        print("test")
        s.write(b"4")
    if keyboard.is_pressed('d'):
        print("test")
        s.write(b"3")
    if keyboard.is_pressed('s'):
        print("test")
        s.write(b"2")'''

def on_key_press(key):
    print("\npressed key %s" % key)
    input_value = "90"
    s.write(input_value.encode())
    return False

def on_key_release(key):
    print("\nreleased key %s" % key)
    input_value = "-1"
    s.write(input_value.encode())
    return False

while True:

    with keyboard.Listener(on_press = on_key_press) as listener:
        listener.join()
    with keyboard.Listener(on_release = on_key_release) as listener:
        listener.join()
    