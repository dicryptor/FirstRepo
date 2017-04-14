import os, sys
import datetime

COLUMNS = "0"

def main():
    global COLUMNS
    if 'linux' in sys.platform:
        rows, columns = os.popen('stty size', 'r').read().split()
        COLUMNS = columns
        #print(rows, columns)
        #print(sys.platform)

    while True:
        print("\nPress Q to exit program")
        dob = input('What is your date of birth? DD-MM ')
        if 'q' in dob.lower():
            sys.exit(0)
        else:
            dayMonthCheck(dob)

def dayMonthCheck(dob):
    """User input validation"""
    try:
        datetime.datetime.strptime(dob, "%d-%m")
    except ValueError:
        # raise ValueError("Incorrect data format!!!")
        print("Incorrect data format, should be DD-MM")
        return

    ddmm = dob.split("-")
    sign_num = ddmm[1].zfill(2) + ddmm[0].zfill(2)
    #print(int(sign_num))
    zodiac_sign(int(sign_num))

def zodiac_sign(sign_num):
    """Check which zodiac sign"""
    global COLUMNS
    CAPRICORN = 119
    AQUARIUS = 218
    PISCES = 320
    ARIES = 419
    TAURUS = 520
    GEMINI = 620
    CANCER = 722
    LEO = 822
    VIRGO = 922
    LIBRA = 1022
    SCORPIO = 1121
    SAGGITARIUS = 1221

    if sign_num <= CAPRICORN:
        print("You are a CAPRICORN. That is a good sign!")
        sign = "CAPRICORN"
    if sign_num > SAGGITARIUS:
        print("You are a CAPRICORN. That is a good sign!")
        sign = "CAPRICORN"
    elif CAPRICORN < sign_num <= AQUARIUS:
        print("You are a AQUARIUS. That is a good sign!")
        sign = "AQUARIUS"
    elif AQUARIUS < sign_num <= PISCES:
        print("You are a PISCES. That is a good sign!")
        sign = "PISCES"
    elif PISCES < sign_num <= ARIES:
        print("You are a ARIES. That is a good sign!")
        sign = "ARIES"
    elif ARIES < sign_num <= TAURUS:
        print("You are a TAURUS. That is a good sign!")
        sign = "TAURUS"
    elif TAURUS < sign_num <= GEMINI:
        print("You are a GEMINI. That is a good sign!")
        sign = "GEMINI"
    elif GEMINI < sign_num <= CANCER:
        print("You are a CANCER. That is a good sign!")
        sign = "CANCER"
    elif CANCER < sign_num <= LEO:
        print("You are a LEO. That is a good sign!")
        sign = "LEO"
    elif LEO < sign_num <= VIRGO:
        print("You are a VIRGO. That is a good sign!")
        sign = "VIRGO"
    elif VIRGO < sign_num <= LIBRA:
        print("You are a LIBRA. That is a good sign!")
        sign = "LIBRA"
    elif LIBRA < sign_num <= SCORPIO:
        print("You are a SCORPIO. That is a good sign!")
        sign = "SCORPIO"
    elif SCORPIO < sign_num <= SAGGITARIUS:
        print("You are a SAGGITARIUS. That is a good sign!")
        sign = "SAGGITARIUS"

    if int(COLUMNS) > 140:
        ascii_art(sign.lower())



def ascii_art(sign):
    """Print ascii art if terminal window is large enough"""
    art = {}
    art['capricorn'] = """
  .oooooo.         .o.       ooooooooo.   ooooooooo.   ooooo   .oooooo.     .oooooo.   ooooooooo.   ooooo      ooo
 d8P'  `Y8b       .888.      `888   `Y88. `888   `Y88. `888'  d8P'  `Y8b   d8P'  `Y8b  `888   `Y88. `888b.     `8'
888              .8"888.      888   .d88'  888   .d88'  888  888          888      888  888   .d88'  8 `88b.    8
888             .8' `888.     888ooo88P'   888ooo88P'   888  888          888      888  888ooo88P'   8   `88b.  8
888            .88ooo8888.    888          888`88b.     888  888          888      888  888`88b.     8     `88b.8
`88b    ooo   .8'     `888.   888          888  `88b.   888  `88b    ooo  `88b    d88'  888  `88b.   8       `888
 `Y8bood8P'  o88o     o8888o o888o        o888o  o888o o888o  `Y8bood8P'   `Y8bood8P'  o888o  o888o o8o        `8

"""

    art['aquarius'] = """
     .o.         .oooooo.      ooooo     ooo       .o.       ooooooooo.   ooooo ooooo     ooo  .oooooo..o
    .888.       d8P'  `Y8b     `888'     `8'      .888.      `888   `Y88. `888' `888'     `8' d8P'    `Y8
   .8"888.     888      888     888       8      .8"888.      888   .d88'  888   888       8  Y88bo.
  .8' `888.    888      888     888       8     .8' `888.     888ooo88P'   888   888       8   `"Y8888o.
 .88ooo8888.   888      888     888       8    .88ooo8888.    888`88b.     888   888       8       `"Y88b
.8'     `888.  `88b    d88b     `88.    .8'   .8'     `888.   888  `88b.   888   `88.    .8'  oo     .d8P
o88o     o8888o  `Y8bood8P'Ybd'    `YbodP'    o88o     o8888o o888o  o888o o888o    `YbodP'    8""88888P'

"""

    art['aries'] = """
     .o.       ooooooooo.   ooooo oooooooooooo  .oooooo..o
    .888.      `888   `Y88. `888' `888'     `8 d8P'    `Y8
   .8"888.      888   .d88'  888   888         Y88bo.
  .8' `888.     888ooo88P'   888   888oooo8     `"Y8888o.
 .88ooo8888.    888`88b.     888   888    "         `"Y88b
.8'     `888.   888  `88b.   888   888       o oo     .d8P
o88o     o8888o o888o  o888o o888o o888ooooood8 8""88888P'

"""

    art['pisces'] = """
ooooooooo.   ooooo  .oooooo..o   .oooooo.   oooooooooooo  .oooooo..o
`888   `Y88. `888' d8P'    `Y8  d8P'  `Y8b  `888'     `8 d8P'    `Y8
888   .d88'  888  Y88bo.      888           888         Y88bo.
888ooo88P'   888   `"Y8888o.  888           888oooo8     `"Y8888o.
888          888       `"Y88b 888           888    "         `"Y88b
888          888  oo     .d8P `88b    ooo   888       o oo     .d8P
o888o        o888o 8""88888P'   `Y8bood8P'  o888ooooood8 8""88888P'

"""

    art['taurus'] = """
ooooooooooooo       .o.       ooooo     ooo ooooooooo.   ooooo     ooo  .oooooo..o
8'   888   `8      .888.      `888'     `8' `888   `Y88. `888'     `8' d8P'    `Y8
    888          .8"888.      888       8   888   .d88'  888       8  Y88bo.
    888         .8' `888.     888       8   888ooo88P'   888       8   `"Y8888o.
    888        .88ooo8888.    888       8   888`88b.     888       8       `"Y88b
    888       .8'     `888.   `88.    .8'   888  `88b.   `88.    .8'  oo     .d8P
   o888o     o88o     o8888o    `YbodP'    o888o  o888o    `YbodP'    8""88888P'

"""

    art['gemini'] = """
 .oooooo.    oooooooooooo ooo        ooooo ooooo ooooo      ooo ooooo
d8P'  `Y8b   `888'     `8 `88.       .888' `888' `888b.     `8' `888'
888            888          888b     d'888   888   8 `88b.    8   888
888            888oooo8     8 Y88. .P  888   888   8   `88b.  8   888
888     ooooo  888    "     8  `888'   888   888   8     `88b.8   888
`88.    .88'   888       o  8    Y     888   888   8       `888   888
 `Y8bood8P'   o888ooooood8 o8o        o888o o888o o8o        `8  o888o

"""

    art['cancer'] = """
 .oooooo.         .o.       ooooo      ooo   .oooooo.   oooooooooooo ooooooooo.
d8P'  `Y8b       .888.      `888b.     `8'  d8P'  `Y8b  `888'     `8 `888   `Y88.
888              .8"888.      8 `88b.    8  888           888          888   .d88'
888             .8' `888.     8   `88b.  8  888           888oooo8     888ooo88P'
888            .88ooo8888.    8     `88b.8  888           888    "     888`88b.
`88b    ooo   .8'     `888.   8       `888  `88b    ooo   888       o  888  `88b.
 `Y8bood8P'  o88o     o8888o o8o        `8   `Y8bood8P'  o888ooooood8 o888o  o888o

"""

    art['leo'] = """
ooooo        oooooooooooo   .oooooo.
`888'        `888'     `8  d8P'  `Y8b
 888          888         888      888
 888          888oooo8    888      888
 888          888    "    888      888
 888       o  888       o `88b    d88'
o888ooooood8 o888ooooood8  `Y8bood8P'

"""

    art['virgo'] = """
oooooo     oooo ooooo ooooooooo.     .oooooo.      .oooooo.
 `888.     .8'  `888' `888   `Y88.  d8P'  `Y8b    d8P'  `Y8b
  `888.   .8'    888   888   .d88' 888           888      888
   `888. .8'     888   888ooo88P'  888           888      888
    `888.8'      888   888`88b.    888     ooooo 888      888
     `888'       888   888  `88b.  `88.    .88'  `88b    d88'
      `8'       o888o o888o  o888o  `Y8bood8P'    `Y8bood8P'

"""

    art['libra'] = """
ooooo        ooooo oooooooooo.  ooooooooo.         .o.
`888'        `888' `888'   `Y8b `888   `Y88.      .888.
 888          888   888     888  888   .d88'     .8"888.
 888          888   888oooo888'  888ooo88P'     .8' `888.
 888          888   888    `88b  888`88b.      .88ooo8888.
 888       o  888   888    .88P  888  `88b.   .8'     `888.
o888ooooood8 o888o o888bood8P'  o888o  o888o o88o     o8888o

"""

    art['scorpio'] = """
 .oooooo..o   .oooooo.     .oooooo.   ooooooooo.   ooooooooo.   ooooo   .oooooo.
d8P'    `Y8  d8P'  `Y8b   d8P'  `Y8b  `888   `Y88. `888   `Y88. `888'  d8P'  `Y8b
Y88bo.      888          888      888  888   .d88'  888   .d88'  888  888      888
 `"Y8888o.  888          888      888  888ooo88P'   888ooo88P'   888  888      888
     `"Y88b 888          888      888  888`88b.     888          888  888      888
oo     .d8P `88b    ooo  `88b    d88'  888  `88b.   888          888  `88b    d88'
8""88888P'   `Y8bood8P'   `Y8bood8P'  o888o  o888o o888o        o888o  `Y8bood8P'

"""

    art['saggitarius'] = """
 .oooooo..o       .o.         .oooooo.      .oooooo.    ooooo ooooooooooooo       .o.       ooooooooo.   ooooo ooooo     ooo  .oooooo..o
d8P'    `Y8      .888.       d8P'  `Y8b    d8P'  `Y8b   `888' 8'   888   `8      .888.      `888   `Y88. `888' `888'     `8' d8P'    `Y8
Y88bo.          .8"888.     888           888            888       888          .8"888.      888   .d88'  888   888       8  Y88bo.
 `"Y8888o.     .8' `888.    888           888            888       888         .8' `888.     888ooo88P'   888   888       8   `"Y8888o.
     `"Y88b   .88ooo8888.   888     ooooo 888     ooooo  888       888        .88ooo8888.    888`88b.     888   888       8       `"Y88b
oo     .d8P  .8'     `888.  `88.    .88'  `88.    .88'   888       888       .8'     `888.   888  `88b.   888   `88.    .8'  oo     .d8P
8""88888P'  o88o     o8888o  `Y8bood8P'    `Y8bood8P'   o888o     o888o     o88o     o8888o o888o  o888o o888o    `YbodP'    8""88888P'

"""

    print(art.get(sign))




if __name__ == "__main__":
    main()
