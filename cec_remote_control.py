import cec
from pynput.keyboard import Controller

keyboard = Controller()
cec.init()

def on_command(event, key): 
    if key == cec.CEC_KEYCODE_NUMBERS_1:
        keyboard.press('1')
        keyboard.release('1')
    elif key == cec.CEC_KEYCODE_NUMBERS_2:
        keyboard.press('2')
        keyboard.release('2')
    elif key == cec.CEC_KEYCODE_NUMBERS_3:
        keyboard.press('3')
        keyboard.release('3')
    elif key == cec.CEC_KEYCODE_NUMBERS_4:
        keyboard.press('4')
        keyboard.release('4')
    elif key == cec.CEC_KEYCODE_NUMBERS_5:
        keyboard.press('5')
        keyboard.release('5')
    elif key == cec.CEC_KEYCODE_NUMBERS_6:
        keyboard.press('6')
        keyboard.release('6')
    elif key == cec.CEC_KEYCODE_NUMBERS_7:
        keyboard.press('7')
        keyboard.release('7')
    elif key == cec.CEC_KEYCODE_NUMBERS_8:
        keyboard.press('8')
        keyboard.release('8')
    elif key == cec.CEC_KEYCODE_NUMBERS_9:
        keyboard.press('9')
        keyboard.release('9')
    elif key == cec.CEC_KEYCODE_NUMBERS_0:
        keyboard.press('0')
        keyboard.release('0')

cec.add_callback(on_command)
cec.start()
