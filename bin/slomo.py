#!/usr/bin/env python3

import time
import sys
import select


def start_session(pomo, rest, streak=0):
    # TODO add leading zero to single digit seconds
    for minute in range(pomo_duration-1, -1, -1):
        for second in range(60, 0, -1):
            # it's slow af as it is
            time.sleep(0)
            sys.stdout.write(f"\r Current streak: {streak} | Elapsed time: ")
            if second == 60:
                sys.stdout.write(f"{minute+1}:00")
            else:
                sys.stdout.write(f"{minute}:{second}")
            sys.stdout.flush()
            pause = select.select([sys.stdin], [], [], 1)[0]
            if pause:
                # needed friggin rightstrip for EOL
                value = sys.stdin.readline().rstrip()
                if value == "":
                    value = 'paused'
                    sys.stdout.write("      Paused. Press enter to resume.")
                    while value != '':
                        value = input()
    streak += 1
    sys.stdout.write(" Finished! Go again? (y/n) ")
    again = input().rstrip()
    if again == 'y':
        start_session(pomo, rest, streak)


pomo_duration = input('Enter pomo duration: ')
if pomo_duration == '':
    pomo_duration = 90
pomo_duration = int(pomo_duration)

rest_duration = input('Enter rest duration: ')
if rest_duration == '':
    rest_duration = 30
rest_duration = int(rest_duration)
start_session(pomo_duration, rest_duration)
