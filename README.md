--- The Code ---

The main.c file is where majority of the game processing is occuring. It #include
all of the other files which contain code for scrolling backgrounds, sound, customized
sprites, game "screens" (splash, instructions, level 1, win/lose, etc.), and collisions.


To run the game, you must install "VisualBoyAdvance" (download file is provided).
The game file is "DaishaBraxton - LostSurvivor.gba" which can be run using 
VisualBoyAdvance. After opening the game in VBA, to see/edit game controls navigate 
to "Options" --> "Joypad" --> "Configure" --> "1"

--- The Lost Survivor ---

    This is a game where the player has to fight off 
    enemies (monkeys and eventually other wild animals) 
    in order to survive being stranded on an island/jungle.

    Currently, I have 3 rounds of gameplay:

    Round 1: You must dodge the obstacles (3 hits and you'll lose).
    To move on to the next level you must collect a prachute for safe
    landing.

    Round 2: You must defeat enemies in a single punch as they attack you. 
    Enemies attack from both sides of the screen. You must defeat 5 enemies to 
    move on. You can take only 3 hits from enemies until you lose.

    Round 3: Has the same gameplay as round 2, except you must
    also dodge falling coconuts that are being "thrown" down from above
    from unseen enemies. Defeat 10 enemies to win the game. 

    *** CHEAT - Pressing button B will give you "unlimited" health ***

    There are three looping sounds: during splash screen, round 1, round 2, and 3.
    There are also 2 "shot" sounds. One occurs during button A press (punching) 
    and the other occurs when the players is hit by an enemy/obstalce. All round's 
    have scrolling backgrounds.

    Bugs: Player can walk through enemies without decreasing health. Coconuts and 
    parachutes are square pixels when entering/leaving screen
