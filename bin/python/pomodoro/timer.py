import os
import time
import signal
from varibles import *
from pygame import mixer

mixer.init()
list_of_subjects = []

def assert_input(inp : str, defalt_positive : bool = True) -> bool:
    inp = inp.lower()
    if defalt_positive:
        if (inp == "" or inp == "yes" or inp == "y"):
            return True
        return False
    else: 
        if (inp == "yes" or inp == "y"):
            return True
        return False

def alarm():
    os.system("clear")
    os.system("snap run spt playback --toggle > /dev/null")
    # mixer.music.load(alarm_path)
    # mixer.music.play()
    # time.sleep(5)
    # mixer.music.stop()
    return


def music(playlist: str):
    os.system("clear")
    os.system("snap run spt play --name '" + playlist 
                + "' --playlist --random > /dev/null")
        
    inp = input("Start timer ? [Y/n] : ")
    if (not assert_input(inp)):
        sigint_uni()
    return


def show_time(art : str, timer):
    for i in range(seconds):
        os.system("clear")
        os.system("figlet -f big -W " + art.upper())
        print("Time " + str(timer) + ":" + str(i))
        time.sleep(1)

     
def timer_art(art, time_for_timer):
    if (time_for_timer == work_time):    
        music(work_playlist)
    else:
        music(break_playlist)

    for i in range(time_for_timer):
        show_time(art, i)
    alarm()
    return


def uni():
    cnt = 0
    while True:
        for i in range(2):
            timer_art(list_of_subjects[cnt], work_time)
            if (i != 1):
                cnt = (cnt + 1) % len(list_of_subjects)
                timer_art(rest_art, small_break)
            else:
                timer_art(rest_art, big_break)   


def default():
    while True:
        for i in range(2):
            timer_art(work_art, work_time)
            if (i != 1):
                timer_art(rest_art, small_break)    
            else :
                timer_art(rest_art, big_break)    


def sigint_uni(signo = "", frame = ""):
    mixer.stop()
    os.system("clear")
    os.system("figlet -f big -W " + exit_art.upper())
    os.system("kill -9 $(pidof spotify)")
    time.sleep(2)
    os.system("clear")
    exit()



if __name__ == '__main__':
    signal.signal(signal.SIGINT, sigint_uni)
    os.system("spotify &")
    
    os.system("clear")
    type_of_pomodoro = input("Univerisity ? [y/N] ")

    if (assert_input(type_of_pomodoro, False)):
        nr_of_subjects = int(input("Number of objects: "))
        for i in range(nr_of_subjects):
            list_of_subjects.append(input(str(i + 1) + " : "))
        uni()
    else :
        default()
    
