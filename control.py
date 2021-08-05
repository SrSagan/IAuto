import serial
from pynput import keyboard

s = serial.Serial(port='/dev/ttyUSB0', baudrate=115200, bytesize=8)

def on_key_press(key):
    print(str(key))
    if key.char == ('w'):
        input_value = "90!90"
    elif key.char == ('s'):
        input_value = "-90!-90"
    elif key.char == ('a'):
        input_value = "-90!90"
    elif key.char == ('d'):
        input_value = "90!-90"
    print(input_value)
    s.write(input_value.encode())
    return False

def on_key_release(key):
    print("\nreleased key %s" % key)
    input_value = "0!0"
    s.write(input_value.encode())
    return False

while True:

    with keyboard.Listener(on_press = on_key_press) as listener:
        listener.join()
    with keyboard.Listener(on_release = on_key_release) as listener:
        listener.join()
    