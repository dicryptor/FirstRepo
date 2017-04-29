#!/bin/bash

COLS=$(tput cols)

# function to check day and month input
daymonth() {
        if ! [[ "${dobcheck[0]}" =~ ^-?[0-9]+$ ]]; then
                echo "Day is not a number"
                return 1
        elif ! [[ "${dobcheck[1]}" =~ ^-?[0-9]+$ ]]; then
                echo "Month is not a number"
                return 1
        fi

        if ! [ "${dobcheck[0]}" -ge 1 -a "${dobcheck[0]}" -le 31 ]; then
                echo "Date is out of range"
                return 1
        fi

        if ! [ "${dobcheck[1]}" -ge 1 -a "${dobcheck[1]}" -le 12 ]; then
                echo "Month is out of range"
                return 1
        fi

        return 0
}

cap_art() {
        cat <<"EOT"
  .oooooo.         .o.       ooooooooo.   ooooooooo.   ooooo   .oooooo.     .oooooo.   ooooooooo.   ooooo      ooo
 d8P'  `Y8b       .888.      `888   `Y88. `888   `Y88. `888'  d8P'  `Y8b   d8P'  `Y8b  `888   `Y88. `888b.     `8'
888              .8"888.      888   .d88'  888   .d88'  888  888          888      888  888   .d88'  8 `88b.    8
888             .8' `888.     888ooo88P'   888ooo88P'   888  888          888      888  888ooo88P'   8   `88b.  8
888            .88ooo8888.    888          888`88b.     888  888          888      888  888`88b.     8     `88b.8
`88b    ooo   .8'     `888.   888          888  `88b.   888  `88b    ooo  `88b    d88'  888  `88b.   8       `888
 `Y8bood8P'  o88o     o8888o o888o        o888o  o888o o888o  `Y8bood8P'   `Y8bood8P'  o888o  o888o o8o        `8
EOT
}

aqua_art() {
        cat <<"EOT"
      .o.         .oooooo.      ooooo     ooo       .o.       ooooooooo.   ooooo ooooo     ooo  .oooooo..o
     .888.       d8P'  `Y8b     `888'     `8'      .888.      `888   `Y88. `888' `888'     `8' d8P'    `Y8
    .8"888.     888      888     888       8      .8"888.      888   .d88'  888   888       8  Y88bo.
   .8' `888.    888      888     888       8     .8' `888.     888ooo88P'   888   888       8   `"Y8888o.
  .88ooo8888.   888      888     888       8    .88ooo8888.    888`88b.     888   888       8       `"Y88b
 .8'     `888.  `88b    d88b     `88.    .8'   .8'     `888.   888  `88b.   888   `88.    .8'  oo     .d8P
o88o     o8888o  `Y8bood8P'Ybd'    `YbodP'    o88o     o8888o o888o  o888o o888o    `YbodP'    8""88888P'
EOT
}

aries_art() {
        cat <<"EOT"
      .o.       ooooooooo.   ooooo oooooooooooo  .oooooo..o
     .888.      `888   `Y88. `888' `888'     `8 d8P'    `Y8
    .8"888.      888   .d88'  888   888         Y88bo.
   .8' `888.     888ooo88P'   888   888oooo8     `"Y8888o.
  .88ooo8888.    888`88b.     888   888    "         `"Y88b
 .8'     `888.   888  `88b.   888   888       o oo     .d8P
o88o     o8888o o888o  o888o o888o o888ooooood8 8""88888P'
EOT
}

pis_art() {
        cat <<"EOT"
ooooooooo.   ooooo  .oooooo..o   .oooooo.   oooooooooooo  .oooooo..o
`888   `Y88. `888' d8P'    `Y8  d8P'  `Y8b  `888'     `8 d8P'    `Y8
 888   .d88'  888  Y88bo.      888           888         Y88bo.
 888ooo88P'   888   `"Y8888o.  888           888oooo8     `"Y8888o.
 888          888       `"Y88b 888           888    "         `"Y88b
 888          888  oo     .d8P `88b    ooo   888       o oo     .d8P
o888o        o888o 8""88888P'   `Y8bood8P'  o888ooooood8 8""88888P'
}

tau_art() {
        cat <<"EOT"
ooooooooooooo       .o.       ooooo     ooo ooooooooo.   ooooo     ooo  .oooooo..o
8'   888   `8      .888.      `888'     `8' `888   `Y88. `888'     `8' d8P'    `Y8
     888          .8"888.      888       8   888   .d88'  888       8  Y88bo.
     888         .8' `888.     888       8   888ooo88P'   888       8   `"Y8888o.
     888        .88ooo8888.    888       8   888`88b.     888       8       `"Y88b
     888       .8'     `888.   `88.    .8'   888  `88b.   `88.    .8'  oo     .d8P
    o888o     o88o     o8888o    `YbodP'    o888o  o888o    `YbodP'    8""88888P'
EOT
}

gem_art() {
        cat <<"EOT"
  .oooooo.    oooooooooooo ooo        ooooo ooooo ooooo      ooo ooooo
 d8P'  `Y8b   `888'     `8 `88.       .888' `888' `888b.     `8' `888'
888            888          888b     d'888   888   8 `88b.    8   888
888            888oooo8     8 Y88. .P  888   888   8   `88b.  8   888
888     ooooo  888    "     8  `888'   888   888   8     `88b.8   888
`88.    .88'   888       o  8    Y     888   888   8       `888   888
 `Y8bood8P'   o888ooooood8 o8o        o888o o888o o8o        `8  o888o
EOT
}

can_art() {
        cat <<"EOT"
  .oooooo.         .o.       ooooo      ooo   .oooooo.   oooooooooooo ooooooooo.
 d8P'  `Y8b       .888.      `888b.     `8'  d8P'  `Y8b  `888'     `8 `888   `Y88.
888              .8"888.      8 `88b.    8  888           888          888   .d88'
888             .8' `888.     8   `88b.  8  888           888oooo8     888ooo88P'
888            .88ooo8888.    8     `88b.8  888           888    "     888`88b.
`88b    ooo   .8'     `888.   8       `888  `88b    ooo   888       o  888  `88b.
 `Y8bood8P'  o88o     o8888o o8o        `8   `Y8bood8P'  o888ooooood8 o888o  o888o
EOT
}

leo_art() {
        cat <<"EOT"
ooooo        oooooooooooo   .oooooo.
`888'        `888'     `8  d8P'  `Y8b
 888          888         888      888
 888          888oooo8    888      888
 888          888    "    888      888
 888       o  888       o `88b    d88'
o888ooooood8 o888ooooood8  `Y8bood8P'
EOT
}

vir_art() {
        cat <<"EOT"
oooooo     oooo ooooo ooooooooo.     .oooooo.      .oooooo.
 `888.     .8'  `888' `888   `Y88.  d8P'  `Y8b    d8P'  `Y8b
  `888.   .8'    888   888   .d88' 888           888      888
   `888. .8'     888   888ooo88P'  888           888      888
    `888.8'      888   888`88b.    888     ooooo 888      888
     `888'       888   888  `88b.  `88.    .88'  `88b    d88'
      `8'       o888o o888o  o888o  `Y8bood8P'    `Y8bood8P'
EOT
}

lib_art() {
        cat <<"EOT"
ooooo        ooooo oooooooooo.  ooooooooo.         .o.
`888'        `888' `888'   `Y8b `888   `Y88.      .888.
 888          888   888     888  888   .d88'     .8"888.
 888          888   888oooo888'  888ooo88P'     .8' `888.
 888          888   888    `88b  888`88b.      .88ooo8888.
 888       o  888   888    .88P  888  `88b.   .8'     `888.
o888ooooood8 o888o o888bood8P'  o888o  o888o o88o     o8888o
EOT
}

scor_art() {
        cat <<"EOT"
 .oooooo..o   .oooooo.     .oooooo.   ooooooooo.   ooooooooo.   ooooo   .oooooo.
d8P'    `Y8  d8P'  `Y8b   d8P'  `Y8b  `888   `Y88. `888   `Y88. `888'  d8P'  `Y8b
Y88bo.      888          888      888  888   .d88'  888   .d88'  888  888      888
 `"Y8888o.  888          888      888  888ooo88P'   888ooo88P'   888  888      888
     `"Y88b 888          888      888  888`88b.     888          888  888      888
oo     .d8P `88b    ooo  `88b    d88'  888  `88b.   888          888  `88b    d88'
8""88888P'   `Y8bood8P'   `Y8bood8P'  o888o  o888o o888o        o888o  `Y8bood8P'
EOT
}

sag_art() {
        cat <<"EOT"
 .oooooo..o       .o.         .oooooo.      .oooooo.    ooooo ooooooooooooo       .o.       ooooooooo.   ooooo ooooo     ooo  .oooooo..o
d8P'    `Y8      .888.       d8P'  `Y8b    d8P'  `Y8b   `888' 8'   888   `8      .888.      `888   `Y88. `888' `888'     `8' d8P'    `Y8
Y88bo.          .8"888.     888           888            888       888          .8"888.      888   .d88'  888   888       8  Y88bo.
 `"Y8888o.     .8' `888.    888           888            888       888         .8' `888.     888ooo88P'   888   888       8   `"Y8888o.
     `"Y88b   .88ooo8888.   888     ooooo 888     ooooo  888       888        .88ooo8888.    888`88b.     888   888       8       `"Y88b
oo     .d8P  .8'     `888.  `88.    .88'  `88.    .88'   888       888       .8'     `888.   888  `88b.   888   `88.    .8'  oo     .d8P
8""88888P'  o88o     o8888o  `Y8bood8P'    `Y8bood8P'   o888o     o888o     o88o     o8888o o888o  o888o o888o    `YbodP'    8""88888P'
EOT
}

sign_check() {
  CAPRICORN=119
  AQUARIUS=218
  PISCES=320
  ARIES=419
  TAURUS=520
  GEMINI=620
  CANCER=722
  LEO=822
  VIRGO=922
  LIBRA=1022
  SCORPIO=1121
  SAGGITARIUS=1221

  if [ $1 -gt $SAGGITARIUS -a $1 -le 1231 ]; then
          echo "You are a CAPRICORN! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  cap_art
          fi
  elif [ $1 -le $CAPRICORN ]; then
          echo "You are a CAPRICORN! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  cap_art
          fi
  elif [ $1 -gt $SCORPIO -a $1 -le $SAGGITARIUS ]; then
          echo "You are a SAGGITARIUS! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  sag_art
          fi
  elif [ $1 -gt $LIBRA -a $1 -le $SCORPIO ]; then
          echo "You are a SCORPIO! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  scor_art
          fi
  elif [ $1 -gt $VIRGO -a $1 -le $LIBRA ]; then
          echo "You are a LIBRA! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  lib_art
          fi
  elif [ $1 -gt $LEO -a $1 -le $VIRGO ]; then
          echo "You are a VIRGO! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  vir_art
          fi
  elif [ $1 -gt $CANCER -a $1 -le $LEO ]; then
          echo "You are a LEO! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  leo_art
          fi
  elif [ $1 -gt $GEMINI -a $1 -le $CANCER ]; then
          echo "You are a CANCER! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  can_art
          fi
  elif [ $1 -gt $TAURUS -a $1 -le $GEMINI ]; then
          echo "You are a GEMINI! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  gem_art
          fi
  elif [ $1 -gt $ARIES -a $1 -le $TAURUS ]; then
          echo "You are a TAURUS! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  tau_art
          fi
  elif [ $1 -gt $PISCES -a $1 -le $ARIES ]; then
          echo "You are a ARIES! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  aries_art
          fi
  elif [ $1 -gt $AQUARIUS -a $1 -le $PISCES ]; then
          echo "You are a PISCES! That's a good sign."
          if [ $COLS -gt 140 ]; then
                  pis_art
          fi
  elif [ $1 -gt $CAPRICORN -a $1 -le $AQUARIUS ]; then
          echo "You are a AQUARIUS! That's a good sign"
          if [ $COLS -gt 140 ]; then
                  aqua_art
          fi
  fi
}

while true; do
  # Get user input
  echo -e "\nPress Q to exit."
  echo -e "What is your date of birth (dd-mm)? "
  read dob
  if [ "${dob,,}" == "q" ]; then
    exit
  fi
  # echo -e "${dob,,}"

  # Separate input to run validation checks
  IFS='-' read -a dobcheck <<< "$dob"

  # call daymonth function
  daymonth

  # if day and month are correct, proceed...
  if [ $? == 0 ]; then
    # day and month formatting
    day=${dobcheck[0]}
    day=$(printf "%02d" $day)
    month=${dobcheck[1]}
    month=$(printf "%02d" $month)
    check_num=$month$day
    check_num=$(echo $check_num | sed 's/^0*//')
    #echo -e "$check_num"

    sign_check $check_num
  fi

done
