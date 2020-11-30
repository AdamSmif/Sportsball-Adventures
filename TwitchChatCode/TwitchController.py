#Required Libraries
import socket
import threading
import userinfo
import time
import twitchlogo
#Recogmended Libraries
import random
import pynput
import pyautogui
import keyboard
import mouse
import pydirectinput

global special_char
global capital_char
global command_cooldown
command_cooldown = []
special_char = ['!','@',"#","$","%","^","&","*","(",")","?",]
capital_char = ['A',"B",'C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']

message = ' '
user = ' '

def program():
    twitchlogo.print_twitch_logo()
    SERVER = "irc.twitch.tv"
    PORT = 6667


    PASS = userinfo.PASS


    BOT = userinfo.BOT


    CHANNEL = userinfo.CHANNEL


    OWNER = userinfo.OWNER


    irc = socket.socket()

    irc.connect((SERVER, PORT))
    irc.send((	"PASS " + PASS + "\n" +
                "NICK " + BOT + "\n" +
                "JOIN #" + CHANNEL + "\n").encode())


    
    #Example of Twitch Bot Commands Setup
    
    def gamecontrol():
        global message
        global user


        def PressAndHoldKey(key, seconds):
            keyboard.press(key)
            time.sleep(seconds)
            keyboard.release(key)

        def PressAndHold2Key(key1,key2,seconds): #If You Need More Keys Just continue The pattern, create another def add key3
            keyboard.press(key1)
            keyboard.press(key2)
            time.sleep(seconds)
            keyboard.release(key1)
            keyboard.release(key2)

        def HoldKey(key):
            keyboard.press(key)

        def ReleaseKey(key):
            keyboard.release(key)

        def MouseClick(key,seconds):#key means left or right for this one
            mouse.press(button = key)
            #Mouse has a timer otherwise left click may not get registered. In some games it can be 0.1 seconds
            time.sleep(seconds)
            mouse.release(button = key)

        def MouseTurn(x,y,seconds):
            pyautogui.moveRel(x,y,seconds)
            return
            
        
        #Chance That Twitch Command Will Run Needs two number x = smaller number y = larger number
        def ActionChance(x,y):
            chance = random.randint(x,y)
            return chance



        while True:
### Player 1: Main Player
            #if message.lower() == 'right' or message.lower() == 'd':
                #PressAndHoldKey('d',2)
                #return

            if message.lower() == 'jump' or message.lower() == 'w':
                if ActionChance(1,10) % 2 == 0:
                    break
                PressAndHoldKey('w',5)
                return

            #if message.lower() == 'left' or message.lower() == 'a':
                #PressAndHoldKey('a',2)
                #return

            #if message.lower() == 'throw' or message.lower() == 'f':
                #PressAndHoldKey('f',2)
                #return

### Player 2: Golfball
            if message.lower() == 'golf left' or message.lower() == 'left arrow':
                PressAndHoldKey('LEFT_ARROW',1)
                return

            if message.lower() == 'golf up' or message.lower() == 'up arrow':
                PressAndHoldKey('UP_ARROW',1)
                return

            if message.lower() == 'golf right' or message.lower() == 'right arrow':
                PressAndHoldKey('RIGHT_ARROW',1)
                return

            if message.lower() == 'golf down' or message.lower() == 'down arrow':
                PressAndHoldKey('DOWN_ARROW',1)
                return

            #light movement
            if message.lower() == 'light golf left' or message.lower() == 'light left arrow':
                PressAndHoldKey('LEFT_ARROW',.5)
                return

            if message.lower() == 'light golf up' or message.lower() == 'light light up arrow':
                PressAndHoldKey('UP_ARROW',.5)
                return

            if message.lower() == 'light golf right' or message.lower() == 'light right arrow':
                PressAndHoldKey('RIGHT_ARROW',.5)
                return

            if message.lower() == 'light golf down' or message.lower() == 'light down arrow':
                PressAndHoldKey('DOWN_ARROW',.5)
                return

### Player 3: Baseball Bat
            if message.lower() == 'bat left' or message.lower() == 'j':
                PressAndHoldKey('j',1)
                return

            if message.lower() == 'bat up' or message.lower() == 'i':
                PressAndHoldKey('i',1)
                return

            if message.lower() == 'bat right' or message.lower() == 'l':
                PressAndHoldKey('l',1)
                return
            if message.lower() == 'bat down' or message.lower() == 'k':
                PressAndHoldKey('k',1)
                return

            #light movement
            if message.lower() == 'light bat left' or message.lower() == 'light j':
                PressAndHoldKey('j',.5)
                return

            if message.lower() == 'light bat up' or message.lower() == 'light i':
                PressAndHoldKey('i',.5)
                return

            if message.lower() == 'light bat right' or message.lower() == 'light l':
                PressAndHoldKey('l',.5)
                return

            if message.lower() == 'light bat down' or message.lower() == 'light k':
                PressAndHoldKey('k',.5)
                return

### Player 4: Football
            if message.lower() == 'football left' or message.lower() == 'e':
                PressAndHoldKey('e',1)
                return

            if message.lower() == 'football up' or message.lower() == '4':
                PressAndHoldKey('4',1)
                return

            if message.lower() == 'football right' or message.lower() == 't':
                PressAndHoldKey('t',1)
                return

            if message.lower() == 'football down' or message.lower() == 'z':
                PressAndHoldKey('z',1)
                return

            #light movement
            if message.lower() == 'light football left' or message.lower() == ' light e':
                PressAndHoldKey('e',.5)
                return

            if message.lower() == 'light football up' or message.lower() == 'light 4':
                PressAndHoldKey('4',.5)
                return

            if message.lower() == 'light football right' or message.lower() == 'light t':
                PressAndHoldKey('t',.5)
                return

            if message.lower() == 'light football down' or message.lower() == 'light z':
                PressAndHoldKey('z',.5)
                return

### Player 5: Tennis
            if message.lower() == 'tennis left' or message.lower() == 'c':
                PressAndHoldKey('c',1)
                return

            if message.lower() == 'tennis up' or message.lower() == 'g':
                PressAndHoldKey('g',1)
                return

            if message.lower() == 'tennis right' or message.lower() == 'b':
                PressAndHoldKey('b',1)
                return

            if message.lower() == 'tennis down' or message.lower() == 'v':
                PressAndHoldKey('v',1)
                return

            #light movement
            if message.lower() == 'light tennis left' or message.lower() == 'light c':
                PressAndHoldKey('c',.5)
                return

            if message.lower() == 'light tennis up' or message.lower() == 'light g':
                PressAndHoldKey('g',.5)
                return

            if message.lower() == 'light tennis right' or message.lower() == 'light b':
                PressAndHoldKey('b',.5)
                return

            if message.lower() == 'light tennis down' or message.lower() == 'light v':
                PressAndHoldKey('v',.5)
                return

### Player 6: Paddle
            if message.lower() == 'paddle left' or message.lower() == ',':
                PressAndHoldKey(',',1)
                return

            if message.lower() == 'paddle up' or message.lower() == ';':
                PressAndHoldKey(';',1)
                return

            if message.lower() == 'paddle right' or message.lower() == '/':
                PressAndHoldKey('/',1)
                return

            if message.lower() == 'paddle down' or message.lower() == '.':
                PressAndHoldKey('.',1)
                return
            #light movement
            if message.lower() == 'light paddle left' or message.lower() == 'light ,':
                PressAndHoldKey(',',.5)
                return

            if message.lower() == 'light paddle up' or message.lower() == 'light ;':
                PressAndHoldKey(';',.5)
                return

            if message.lower() == 'light paddle right' or message.lower() == 'light /':
                PressAndHoldKey('/',.5)
                return

            if message.lower() == 'light paddle down' or message.lower() == 'light .':
                PressAndHoldKey('.',.5)
                return
### Player 7: Net
            if message.lower() == 'net left' or message.lower() == 'O':
                PressAndHoldKey('O',1)
                return

            if message.lower() == 'net up' or message.lower() == '0':
                PressAndHoldKey('0',1)
                return

            if message.lower() == 'net right' or message.lower() == '[':
                PressAndHoldKey('[',1)
                return

            if message.lower() == 'net down' or message.lower() == 'p':
                PressAndHoldKey('p',1)
                return

            if message.lower() == 'net left' or message.lower() == 'O':
                PressAndHoldKey('O',1)
                return

            #light movement

            if message.lower() == 'light net up' or message.lower() == 'light 0':
                PressAndHoldKey('0',.5)
                return

            if message.lower() == 'light net right' or message.lower() == 'light [':
                PressAndHoldKey('[',.5)
                return

            if message.lower() == 'light net down' or message.lower() == 'light p':
                PressAndHoldKey('p',.5)
                return

            if message.lower() == 'light net left' or message.lower() == 'light O':
                PressAndHoldKey('O',.5)
                return

### Player 8: Rollerblade
            if message.lower() == 'rollerblade left' or message.lower() == 'y':
                PressAndHoldKey('y',1)
                return

            if message.lower() == 'rollerblade up' or message.lower() == '7':
                PressAndHoldKey('7',1)
                return

            if message.lower() == 'rollerblade right' or message.lower() == 'u':
                PressAndHoldKey('u',1)
                return
            if message.lower() == 'rollerblade down' or message.lower() == 'h':
                PressAndHoldKey('h',1)
                return
            
            #light movement

            if message.lower() == 'light rollerblade left' or message.lower() == 'light y':
                PressAndHoldKey('y',1)
                return

            if message.lower() == 'light rollerblade up' or message.lower() == 'light 7':
                PressAndHoldKey('7',1)
                return

            if message.lower() == 'light rollerblade right' or message.lower() == 'light u':
                PressAndHoldKey('u',1)
                return
            if message.lower() == 'light rollerblade down' or message.lower() == 'light h':
                PressAndHoldKey('h',1)
                return
#********************************************************************

    #Connects You to Twitch Servers and starts other groups (i.e Controller and Commands)
    #You Should Not Need to Change Anything in the Twitch Section
    def twitch():
        
        global user
        global message

        def joinchat():
            Loading = True
            while Loading:
                readbuffer_join = irc.recv(1024)
                readbuffer_join = readbuffer_join.decode()                
                for line in readbuffer_join.split("\n")[0:-1]:                    
                    Loading = loadingComplete(line)
        def loadingComplete(line):
            if("End of /NAMES list" in line):
                #sendMessage(irc, "Hello World!")
                return False
            else:
                return True
        global sendMessage
        def sendMessage(irc, message):
            messageTemp = "PRIVMSG #" + CHANNEL + " :" + message
            irc.send((messageTemp + "\n").encode())
        def getUser(line):
            global user
            colons = line.count(":")
            colonless = colons-1
            separate = line.split(":", colons)
            user = separate[colonless].split("!", 1)[0]
            return user
        def getMessage(line):
            global message
            try:
                colons = line.count(":")
                message = (line.split(":", colons))[colons]
            except:
                message = ""
            return message
        def console(line):
            if "PRIVMSG" in line:
                return False
            else:
                return True
        while True:
            try:
                readbuffer = irc.recv(1024).decode()
            except:
                readbuffer = ""
            for line in readbuffer.split("\r\n"):
                if line == "":
                    continue
                if "PING :tmi.twitch.tv" in line:
                    
                    msgg = "PONG :tmi.twitch.tv\r\n".encode()
                    irc.send(msgg)
                    continue
                else:
                    
                    global user
                    
                    user = getUser(line)
                    message = getMessage(line)
                    print(user + " : " + message)
                    t2 = threading.Thread(target = gamecontrol)
                    t2. start()       
        joinchat()
    t1 = threading.Thread(target = twitch)
    t1.start()
