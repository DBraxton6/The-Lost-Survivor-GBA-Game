/*****************************************
    Daisha Braxton - Final Porject - 4/24/2017
    			--- The Lost Survivor ---

    This is a game where the player has to fight off 
    enemies (monkeys and eventually other wild animals) 
    in order to survive being stranded on an island/jungle.

    Currently, I have 3 rounds of gameplay:
    Round 1: You must dodge the obstacle (3 hits and you die),
    and to move on to the next level you have to "collide" with
    a prachute.

    Round 2: Enemies will try to "attack" you and you
    can punch to kill them. Enemies attack from
    both sides of the screen. You must kill 5 enemies to move on and
    can now take 3 hits from enemies until you lose.

    Round 3: Has the same gameplay as round 2, except you must
    also dodge falling coconuts that are being "thrown" down from above
    from unseen enemies. Kill 10 enemies to win the game. 

    *** CHEAT - Pressing button B will give you "unlimited" health ***

    There are three looping sounds: during splash screen, round 1
    and the same sound is used for round 2 and 3.
    There are also 2 "shot" sounds. One occurs during button A
    press (punching) and the other occurs when the players is hit
    by an enemy/obstalce. All round's background's scroll.

    Bugs: Player can walk through enemies
    without decreasing health. Coconuts and parachutes are squares 
    when entering/leaving screen
    ******************************************/
#include <stdlib.h>
#include "main.h"
#include "myLib.h"
#include "game.h"
#include "sprite.h"
#include "splash.h"
#include "l1instructs.h"
#include "level1_bg.h"    
#include "level2_bg.h"
#include "level3_bg.h"
#include "pause.h"
#include "win.h"
#include "lose1.h"
#include "lose2_3.h"
#include "finalCutScene.h"
#include "titleSong.h"
#include "gameSound.h"
#include "gameSound0.h"
#include "oofSound.h"
#include "punching.h"
#include "farIsland.h"
#include "palmTrees.h"
#include "titleScreen.h"

unsigned int buttons;
unsigned int oldButtons;

unsigned short scanLineCounter;
char fpsbuffer[30];

int hOff;
int vOff;

OBJ_ATTR shadowOAM[128];

SOUND soundA;
SOUND soundB;

#define ROWMASK 0XFF
#define COLMASK 0XFF

PLAYER player; //player

/*****************************************************ARRAYS************************************************************/
/***************************************************AND INFO**************************************************************/
GAMEBARS health;

GAMEBARS stamina;

GAMEBARS enemDead;

ENEMIES enemies1[NUMENEMIES]; //brown monkeys pooling from left
int enemy1Count;
int timeToNxtEnemy1;	//how often enemy1 should spawn
int enemy1Timer;

ENEMIES enemies1Flip[NUMENEMIES]; //brown monkeys pooling from right
int enemy1FlipCount;
int timeToNxtEnemy1Flip;
int enemy1FlipTimer;

ENEMIES enemies2[NUMENEMIES]; //white monkeys pooling from left
int enemy2Count;
int timeToNxtEnemy2;
int enemy2Timer;	

ENEMIES enemies2Flip[NUMENEMIES]; //white monkeys pooling from right
int enemy2FlipCount;
int timeToNxtEnemy2Flip;
int enemy2FlipTimer;

ENEMIES enemies3[NUMENEMIES]; //debris pooling from bottom
int enemy3Count;
int timeToNxtEnemy3;
int enemy3Timer;

ENEMIES enemies4[NUMENEMIES]; //coconuts pooling from top
int enemy4Count;
int timeToNxtEnemy4;
int enemy4Timer;

PARACHUTE parachute[NUMCHUTES]; //parachutes pooling from bottom
int parachuteCount;
int timeToNxtChute;
int parachuteTimer;


/******************************************************END****************************************************************/
/*****************************************************ARRAYS***********************************************************/

void (*state)();
int playerHealth;	//keeping track of the player's health
int enemiesDead;	//keeping track of the # of enemies attacked and killed
int deadPuff;

int main() {

	hideSprites();
	goToSplash();

	//setting up interrupts and sounds
	setupSounds();
	setupInterrupts();

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		//state switching
		state();

		waitForVblank();
		}
	}

	void goToSplash() {
		state = updateSplash;

		//background stuff for start/splash screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, titleScreenTiles, &CHARBLOCKBASE[0], titleScreenTilesLen / 2 );
	    DMANow(3, titleScreenMap, &SCREENBLOCKBASE[30], titleScreenMapLen / 2);
	    DMANow(3, titleScreenPal, PALETTE, 256);

	    //splash/instructions looping sound
	    playSoundA(titleSong,TITLESONGLEN,TITLESONGFREQ, 1);
	}

	void updateSplash() {
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToL1Instructs(); //takes you to first instructions state
		}

		if(BUTTON_PRESSED(BUTTON_START)) {
			goToLevel1();	//takes you to level 1 game state
			playSoundA(gameSound0,GAMESOUND0LEN,GAMESOUND0FREQ, 1); //game looping sound
			hideSprites();
			init1();		//initialize level 1
		}
	}

/*************************************************INSTRUCTIONS************************************************************/
/****************************************************STATES***************************************************************/
	void goToL1Instructs() {
		state = updateL1Instructs;
		//background stuff for instructions screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, l1instructsTiles, &CHARBLOCKBASE[0], l1instructsTilesLen / 2 );
	    DMANow(3, l1instructsMap, &SCREENBLOCKBASE[30], l1instructsMapLen / 2);
	    DMANow(3, l1instructsPal, PALETTE, 256);
	}

	void updateL1Instructs() {
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToSplash();	//takes you back to splash state
		}

		if(BUTTON_PRESSED(BUTTON_START)) {
			goToLevel1();	//takes you to level 1 game state
			playSoundA(gameSound0,GAMESOUND0LEN,GAMESOUND0FREQ, 1); //game looping sound
			hideSprites();
			init1();		//initialize level 1
		}
	}

		void goToL2Instructs() {
		state = updateL2Instructs;
		//background stuff for instructions screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, level2_bgTiles, &CHARBLOCKBASE[0], level2_bgTilesLen / 2 );
	    DMANow(3, level2_bgMap, &SCREENBLOCKBASE[30], level2_bgMapLen / 2);
	    DMANow(3, level2_bgPal, PALETTE, 256);
	    stopSound();
	}

	void updateL2Instructs() {
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToSplash();	//takes you back to splash state
		}

		if(BUTTON_PRESSED(BUTTON_START)) {
			goToLevel2();	//takes you to level 2 game state
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init2();		//initialize level 2
		}
	}

		void goToL3Instructs() {
		state = updateL3Instructs;
		//background stuff for instructions screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, level3_bgTiles, &CHARBLOCKBASE[0], level3_bgTilesLen / 2 );
	    DMANow(3, level3_bgMap, &SCREENBLOCKBASE[30], level3_bgMapLen / 2);
	    DMANow(3, level3_bgPal, PALETTE, 256);
	    stopSound();
	}

	void updateL3Instructs() {
		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToSplash();	//takes you back to splash state
		}

		if(BUTTON_PRESSED(BUTTON_START)) {
			goToLevel3();	//takes you to game state
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init3();		//initialize level 3
		}
	}

/***************************************************END of****************************************************************/
/************************************************INSTRUCTIONS*************************************************************/

/****************************************************GAME*****************************************************************/
/***************************************************STATES****************************************************************/

		void goToLevel1() {
		state = updateLevel1;

		//background stuff for level 1 game state
		REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);

		//loading pallette for the tiles
	    loadPalette(level1_bgPal);

		//loading tiles into the appropriate charblock and screenblock
		DMANow(3, level1_bgTiles, &CHARBLOCKBASE[0], level1_bgTilesLen /2);
		DMANow(3, level1_bgMap, &SCREENBLOCKBASE[30], level1_bgMapLen /2);

	    //loading the sprite sheet
	    DMANow(3, spriteTiles, &CHARBLOCKBASE[4], spriteTilesLen / 2 );
	    DMANow(3, spritePal, SPRITE_PALETTE, 256);
	}

	void updateLevel1() {
	waitForVblank();
	update1();
		
		if(BUTTON_PRESSED(BUTTON_START)) {
			pauseSound();	//pauses sound
			goToPause1(); 	//pauses gameplay
		}

		if(BUTTON_PRESSED(BUTTON_B)) {	//"unlimited health"
			playerHealth = 1000000;
		}
	
		//controls speed of bg
        REG_BG0VOFS = vOff++ * 2;	//scrolls background "visually" downward
        updateOAM1();
        DMANow(3, shadowOAM, OAM, (128*4));
}

	void goToLevel2() {
		state = updateLevel2;

		//background stuff for level 2 game state
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
		REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);
		REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29); 

		//loading pallette for the tiles
	    loadPalette(farIslandPal);

		//loading tiles into the appropriate charblock and screenblock
		DMANow(3, farIslandTiles, &CHARBLOCKBASE[0], farIslandTilesLen /2);
		DMANow(3, farIslandMap, &SCREENBLOCKBASE[30], farIslandMapLen /2);
		DMANow(3, palmTreesTiles, &CHARBLOCKBASE[1], palmTreesTilesLen /2);
		DMANow(3, palmTreesMap, &SCREENBLOCKBASE[29], palmTreesMapLen /2);

	    //loading the sprite sheet
	    DMANow(3, spriteTiles, &CHARBLOCKBASE[4], spriteTilesLen / 2 );
	    DMANow(3, spritePal, SPRITE_PALETTE, 256);
	}

	void updateLevel2() {
	waitForVblank();
	update2();

		
		if(BUTTON_HELD(BUTTON_LEFT))
		{
			hOff--;	//scroll background left
		}
		if(BUTTON_HELD(BUTTON_RIGHT))
		{
			hOff++; //scroll background right 
		}
		
		if(BUTTON_PRESSED(BUTTON_START)) {
			pauseSound();	//pauses sound
			goToPause2(); 	//pauses gameplay
		}

		if(BUTTON_PRESSED(BUTTON_B)) {	//"unlimited health"
			playerHealth = 1000000;
		}

		if(BUTTON_HELD(BUTTON_A)) {
			//punching "shot" sound
			playSoundB(punching, PUNCHINGLEN, PUNCHINGFREQ, 0);

			//when stamina is greater than 0, allows sprite to change to punching, and decreases stamina
			if(player.stamina > 0) {
				player.punching = 1;
				player.stamina--;
			} else {
				//when stamina gets to 0, change sprite to not punching
				player.punching = 0;
			}
		} 

		else {
			//detects when A is no longer pressed, and increases stamina
			player.punching = 0;
			if(player.stamina < MAXSTAMINA) {
				player.stamina++;
			}
		}
		//controls speed of bg
        REG_BG0HOFS = hOff/2; //halfed makes background scroll slower
		REG_BG1HOFS = hOff/3;
        updateOAM2();
        DMANow(3, shadowOAM, OAM, (128*4));
	}

	void goToLevel3() {
		state = updateLevel3;

		//background stuff for level 3 game state
		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
		REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);
		REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
	

		//loading pallette for the tiles
	    loadPalette(farIslandPal);

		//loading tiles into the appropriate charblock and screenblock
		DMANow(3, farIslandTiles, &CHARBLOCKBASE[0], farIslandTilesLen /2);
		DMANow(3, farIslandMap, &SCREENBLOCKBASE[30], farIslandMapLen /2);
		DMANow(3, palmTreesTiles, &CHARBLOCKBASE[1], palmTreesTilesLen /2);
		DMANow(3, palmTreesMap, &SCREENBLOCKBASE[29], palmTreesMapLen /2);

	    //loading the sprite sheet
	    DMANow(3, spriteTiles, &CHARBLOCKBASE[4], spriteTilesLen / 2 );
	    DMANow(3, spritePal, SPRITE_PALETTE, 256);
	}

	void updateLevel3() {
	waitForVblank();
	update3();
		
		if(BUTTON_HELD(BUTTON_LEFT))
		{
			hOff--;	//scroll background left
		}
		if(BUTTON_HELD(BUTTON_RIGHT))
		{
			hOff++; //scroll background right 
		}

		if(BUTTON_PRESSED(BUTTON_START)) {
			pauseSound();	//pauses sound
			goToPause3(); 	//pauses gameplay
		}

		if(BUTTON_PRESSED(BUTTON_B)) {	//"unlimited health"
			playerHealth = 1000000;
		}

		if(BUTTON_HELD(BUTTON_A)) {
			//punching "shot" sound
			playSoundB(punching, PUNCHINGLEN, PUNCHINGFREQ, 0);

			//when stamina is greater than 0, changes sprite to punching, and decreases stamina
			if(player.stamina > 0) {
				player.punching = 1;
				player.stamina--;
			} else {
				//when stamina gets to 0, change sprite to not punching
				player.punching = 0;
			}
		} 

		else {
			//detects when A is no longer pressed, and increases stamina
			player.punching = 0;
			if(player.stamina < MAXSTAMINA) {
				player.stamina++;
			}
		}

		//controls speed of bg
        REG_BG0HOFS = hOff/2; //halfed makes background scroll slower
		REG_BG1HOFS = hOff/2;
        updateOAM3();
        DMANow(3, shadowOAM, OAM, (128*4));
}

/******************************************************END of*************************************************************/
/***************************************************GAME STATES***********************************************************/

/******************************************************PAUSE*************************************************************/
/*****************************************************STATES***********************************************************/
	void goToPause1() {
		state = updatePause1;
		//background stuff for pause screen
		vOff = 0;	//prevents screen from scrolling while game state is scrolling
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);
		DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen / 2 );
	    DMANow(3, pauseMap, &SCREENBLOCKBASE[30], pauseMapLen / 2);
	    DMANow(3, pausePal, PALETTE, 256);
	}

	void updatePause1() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			unpauseSound();
			goToLevel1(); //resumes game at level 1
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel1();
			playSoundA(gameSound0,GAMESOUND0LEN,GAMESOUND0FREQ, 1); //game looping sound
			hideSprites();
			init1();		//restarts level 1
		}
	}

	void goToPause2() {
		state = updatePause2;
		//background stuff for pause screen
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		hOff = 0;	//prevents pause screen from scrolling while game state is scrolling
		REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);
		DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen / 2 );
	    DMANow(3, pauseMap, &SCREENBLOCKBASE[30], pauseMapLen / 2);
	    DMANow(3, pausePal, PALETTE, 256);
	}

	void updatePause2() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			unpauseSound();
			goToLevel2(); //resumes game at level 2
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel2();
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init2();		//restarts level 2
		}
	}

	void goToPause3() {
		state = updatePause3;
		//background stuff for pause screen
		hOff = 0;	//prevents pause screen from scrolling while game state is scrolling
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE1 | CBB(0) | SBB(30);
		DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen / 2 );
	    DMANow(3, pauseMap, &SCREENBLOCKBASE[30], pauseMapLen / 2);
	    DMANow(3, pausePal, PALETTE, 256);
	}

	void updatePause3() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			unpauseSound();
			goToLevel3(); //resumes game at level 3
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel3();	//takes you to game state
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init3();		//restarts level 3
		}
	}
/******************************************************END of**************************************************************/
/***************************************************PAUSE STATES***********************************************************/
	void goToWin() {
		state = updateWin;
		//background stuff for win screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, winTiles, &CHARBLOCKBASE[0], winTilesLen / 2 );
	    DMANow(3, winMap, &SCREENBLOCKBASE[30], winMapLen / 2);
	    DMANow(3, winPal, PALETTE, 256);
	}

	void updateWin() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			goToSplash();	//goes to splash screen
		}

	}

	void goToLose1() {
		state = updateLose1;
		//background stuff for lose screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, lose1Tiles, &CHARBLOCKBASE[0], lose1TilesLen / 2 );
	    DMANow(3, lose1Map, &SCREENBLOCKBASE[30], lose1MapLen / 2);
	    DMANow(3, lose1Pal, PALETTE, 256);
	    stopSound();
	}

	void updateLose1() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			goToSplash();	//goes to splash screen
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel1();	
			playSoundA(gameSound0,GAMESOUND0LEN,GAMESOUND0FREQ, 1); //game looping sound
			hideSprites();
			init1();		//restarts level 1
		}
	}

	void goToLose2() {
		state = updateLose2;
		//background stuff for lose screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, lose2_3Tiles, &CHARBLOCKBASE[0], lose2_3TilesLen / 2 );
	    DMANow(3, lose2_3Map, &SCREENBLOCKBASE[30], lose2_3MapLen / 2);
	    DMANow(3, lose2_3Pal, PALETTE, 256);
	    stopSound();
	}

	void updateLose2() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			goToSplash();	//goes to splash screen
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel2();
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init2();		//restarts level 2
		}
	}

	void goToLose3() {
		state = updateLose3;
		//background stuff for lose screen
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, lose2_3Tiles, &CHARBLOCKBASE[0], lose2_3TilesLen / 2 );
	    DMANow(3, lose2_3Map, &SCREENBLOCKBASE[30], lose2_3MapLen / 2);
	    DMANow(3, lose2_3Pal, PALETTE, 256);
	    stopSound();
	}

	void updateLose3() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			goToSplash();	//goes to splash screen
		}

		if(BUTTON_PRESSED(BUTTON_SELECT)) {
			goToLevel3();
			playSoundA(gameSound,GAMESOUNDLEN,GAMESOUNDFREQ, 1); //game looping sound
			hideSprites();
			init3();		//restarts level 3
		}
	}


	void goToFinalCutScene() {
		state = updateFinalCutScene;
		//background stuff for final cut scene
		hOff = 0;
		vOff = 0;
		REG_DISPCTL = MODE0 | BG0_ENABLE;
		REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
		DMANow(3, finalCutSceneTiles, &CHARBLOCKBASE[0], finalCutSceneTilesLen / 2 );
	    DMANow(3, finalCutSceneMap, &SCREENBLOCKBASE[30], finalCutSceneMapLen / 2);
	    DMANow(3, finalCutScenePal, PALETTE, 256);
	    stopSound();
	}

	void updateFinalCutScene() {
		if(BUTTON_PRESSED(BUTTON_START)) {
			goToWin();	//goes to splash screen
		}
	}
/*******************************************************GAME**************************************************************/
/***************************************************INITIALIZING**********************************************************/

	void init1() {
		//initializing player variables
		playerHealth = 3;
		player.row = 20;
		player.col = 120;
		player.width = 15;
	    player.height = 31;

	    //initializing health bar
	    health.row = 3;
	    health.col = 160;

	    //initializing debris variables
	    ENEMIES enemy3; 	//enemy 3 is flying debris in level 1
	    enemy3.row = 0;
	    enemy3.col = 0;
	    enemy3.oldRow = 0;
	    enemy3.oldCol = 0;
	    enemy3.width = 23;
	    enemy3.height = 23;
	    enemy3.rd = -1;
	    enemy3.cd = 0;
	    enemy3.active = 0;	//enemies begin unactive
	    enemy3Count = (sizeof(enemies3)/sizeof(enemies3[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy3Count; i++) {
	    	enemies3[i] = enemy3;
	    }

	    enemy3Timer = 0;


	    //initializing parachute variables
	    PARACHUTE chute;
	    chute.row = 0;
	    chute.col = 0;
	    chute.oldRow = 0;
	    chute.oldCol = 0;
	    chute.width = 16;
	    chute.height = 16;
	    chute.rd = -1;
	    chute.cd = 0;
	    chute.active = 0;	//parachutes begin unactive
	    parachuteCount = (sizeof(parachute)/sizeof(parachute[0]));	//dividing the size of the parachute array by one parachute

	    for(int i = 0; i < parachuteCount; i++) {
	    	parachute[i] = chute;
	    }

	    parachuteTimer = 0;

	}


	void init2() {
		//initializing player variables
		playerHealth = 3;
		player.row = 123;
		player.col = 120;
		player.width = 15;
	    player.height = 31;
	    player.punching = 0;
	    player.flipped = 0;		//start the player facing right
	    player.stamina = MAXSTAMINA;

	    //initializing health bar
	    health.row = 3;
	    health.col = 160;

	    //initializing stamina bar
	    stamina.row = 3;
	    stamina.col = 200;

	    //intializing enemies dead counter sprites
	    enemDead.row = 3;
	    enemDead.col = 40;

	    //initializing enemy1 variables
	    enemiesDead = 0;
	    ENEMIES enemy1;		//enemy 1 is brown monkies pooling from left in level 2
	    enemy1.row = 147;
	    enemy1.col = 0;
	    enemy1.oldRow = 0;
	    enemy1.oldCol = 0;
	    enemy1.width = 23;
	    enemy1.height = 23;
	    enemy1.cd = 1;
	  	enemy1.dead = -1;
	  	enemy1.colliding = 0;
	    enemy1.active = 0;	//enemies begin unactive
	    enemy1Count = (sizeof(enemies1)/sizeof(enemies1[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy1Count; i++) {
	    	enemies1[i] = enemy1;
	    }
	    enemy1Timer = 0;

		ENEMIES enemy1Flip; //enemy 1 flipped is brown monkies pooling from right in level 2
	    enemy1Flip.row = 150;
	    enemy1Flip.col = 0;
	    enemy1Flip.oldRow = 0;
	    enemy1Flip.oldCol = 0;
	    enemy1Flip.width = 23;
	    enemy1Flip.height = 23;
	    enemy1Flip.cd = -1;
	    enemy1Flip.colliding = 0;
	    enemy1Flip.active = 0;	//enemies begin unactive
	    enemy1FlipCount = (sizeof(enemies1Flip)/sizeof(enemies1Flip[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy1FlipCount; i++) {
	    	enemies1Flip[i] = enemy1Flip;
	    }
	    enemy1FlipTimer = 0;


	    if(enemiesDead == 5) {
			goToL3Instructs();
		}
	}

		


	void init3() {
		playerHealth = 3;
		//initializing player variables
		player.row = 123;
		player.col = 120;
		player.width = 15;
	    player.height = 31;
	    player.punching = 0;
	    player.flipped = 0;		//start the player facing right
	    player.stamina = MAXSTAMINA;

	    //initializing health bar
	    health.row = 3;
	    health.col = 160;

	    //initializing stamina bar
	    stamina.row = 3;
	    stamina.col = 200;

	    //intializing enemies dead counter sprites
	    enemDead.row = 3;
	    enemDead.col = 40;

	    //initializing enemy1 variables
	    enemiesDead = 0;
	    ENEMIES enemy2;			//enemy 2 is white monkies pooling from left in level 3
	    enemy2.row = 147;
	    enemy2.col = 0;
	    enemy2.oldRow = 0;
	    enemy2.oldCol = 0;
	    enemy2.width = 23;
	    enemy2.height = 23;
	    enemy2.cd = 1;
	    enemy2.colliding = 0;
	    enemy2.active = 0;	//enemies begin unactive
	    enemy2Count = (sizeof(enemies2)/sizeof(enemies2[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy2Count; i++) {
	    	enemies2[i] = enemy2;
	    }

	    enemy2Timer = 0;


	    ENEMIES enemy2Flip;		//enemy 2 flipped is white monkies pooling from right in level 3
	    enemy2Flip.row = 150;
	    enemy2Flip.col = 0;
	    enemy2Flip.oldRow = 0;
	    enemy2Flip.oldCol = 0;
	    enemy2Flip.width = 23;
	    enemy2Flip.height = 23;
	    enemy2Flip.cd = 1;
	    enemy2Flip.colliding = 0;
	    enemy2Flip.active = 0;	//enemies begin unactive
	    enemy2FlipCount = (sizeof(enemies2Flip)/sizeof(enemies2Flip[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy2FlipCount; i++) {
	    	enemies2Flip[i] = enemy2Flip;
	    }

	    enemy2FlipTimer = 0;


	    ENEMIES enemy4;		//enemy 4 is coconuts pooling from top in level 3
	    enemy4.row = 1;
	    enemy4.col = 0;
	    enemy4.oldRow = 0;
	    enemy4.oldCol = 0;
	    enemy4.width = 16;
	    enemy4.height = 16;
	    enemy4.rd = 1;
	    enemy4.cd = 0;
	    enemy4.colliding = 0;
	    enemy4.active = 0;	//enemies begin unactive
	    enemy4Count = (sizeof(enemies4)/sizeof(enemies4[0]));	//dividing the size of the enemy array by one enemy

	    for(int i = 0; i < enemy4Count; i++) {
	    	enemies4[i] = enemy4;
	    }

	    enemy4Timer = 0;

	}

/******************************************************END of*************************************************************/
/***************************************************INITIALIZING**********************************************************/
	
	void hideSprites() {
		//looping through shadowOAM sprites in order to hide them
		for(int i = 0; i < 128; i++) {
			shadowOAM[i].attr0 = ATTR0_HIDE;
		}
	}

/*****************************************************GAME******************************************************************/
/***************************************************UPDATES*****************************************************************/
	void update1() {
		updatePlayer(&player);


		//debris pooling
		if(!(++enemy3Timer % timeToNxtEnemy3)) {
			for(int i = 0; i < enemy3Count; i++) {
				ENEMIES * e3 = &enemies3[i];
				if(!e3->active) {
					e3->active = 1;
					e3->row = 161;
					e3->col = rand()%(240);
					e3->rd = -2;

					timeToNxtEnemy3 = rand() % 25 + 100;
					break;
				}
			}
		}

		for(int i = 0; i < enemy3Count; i++) {
			updateEnemy3(&enemies3[i]);
			enemy3PlayerCollisionCheck(&enemies3[i], &player);
		}


		//parachute pooling
		if(!(++parachuteTimer % timeToNxtChute)) {
			for(int i = 0; i < parachuteCount; i++) {
				PARACHUTE * ch = &parachute[i];
				if(!ch->active) {
					ch->active = 1;
					ch->row = 161;
					ch->col = rand()%(240);
					ch->rd = -2;

					timeToNxtChute = 300;
					break;
				}
			}
		}

		for(int i = 0; i < parachuteCount; i++) {
			updateParachute(&parachute[i]);
			parachutePlayerCollisionCheck(&parachute[i], &player);
		}
	}

	void update2() {
		updatePlayer(&player);

		/*enemy1 pooling from left*/
		if(!(++enemy1Timer % timeToNxtEnemy1)) {
			for(int i = 0; i < enemy1Count; i++) {
				ENEMIES * e = &enemies1[i];
				if(!e->active) {
					e->active = 1;
					e->row = 125;
					e->col = -24;
					e->cd = 1;
					e->dead = -1;

					timeToNxtEnemy1 = 150;
					break;
				}
			}
		}

		for(int i = 0; i < enemy1Count; i++) {
			updateEnemy1(&enemies1[i]);
			enemy1PlayerCollisionCheck(&enemies1[i], &player);
		}


		/*enemy1 flipped pooling from right*/
		if(!(++enemy1FlipTimer % timeToNxtEnemy1Flip)) {
			for(int i = 0; i < enemy1FlipCount; i++) {
				ENEMIES * e1f = &enemies1Flip[i];
				if(!e1f->active) {
					e1f->active = 1;
					e1f->row = 125;
					e1f->col = 241;
					e1f->cd = -1;

					timeToNxtEnemy1Flip = 200;
					break;
				}
			}
		}

		for(int i = 0; i < enemy1FlipCount; i++) {
			updateEnemy1Flip(&enemies1Flip[i]);
			enemy1FlipPlayerCollisionCheck(&enemies1Flip[i], &player);
		}
	}

	void update3() {
		updatePlayer(&player);

		/*enemy2 pooling from left*/
		if(!(++enemy2Timer % timeToNxtEnemy2)) {
			for(int i = 0; i < enemy2Count; i++) {
				ENEMIES * e2 = &enemies2[i];
				if(!e2->active) {
					e2->active = 1;
					e2->row = 125;
					e2->col = -24;
					e2->cd = 1;

					timeToNxtEnemy2 = 150;
					break;
				}
			}
		}

		for(int i = 0; i < enemy2Count; i++) {
			updateEnemy2(&enemies2[i]);
			enemy2PlayerCollisionCheck(&enemies2[i], &player);
		}


		/*enemy2 flipped pooling from right*/
		if(!(++enemy2FlipTimer % timeToNxtEnemy2Flip)) {
			for(int i = 0; i < enemy2FlipCount; i++) {
				ENEMIES * e2f = &enemies2Flip[i];
				if(!e2f->active) {
					e2f->active = 1;
					e2f->row = 125;
					e2f->col = 241;
					e2f->cd = -1;

					timeToNxtEnemy2Flip = 200;
					break;
				}
			}
		}

		for(int i = 0; i < enemy2FlipCount; i++) {
			updateEnemy2Flip(&enemies2Flip[i]);
			enemy2FlipPlayerCollisionCheck(&enemies2Flip[i], &player);
		}


		/*enemy4 (coconuts) pooling from top*/
		if(!(++enemy4Timer % timeToNxtEnemy4)) {
			for(int i = 0; i < enemy4Count; i++) {
				ENEMIES * e4 = &enemies4[i];
				if(!e4->active) {
					e4->active = 1;
					e4->row = -e4->height;
					e4->col = rand() % (240);
					e4->rd = 1.5;

					timeToNxtEnemy4 = 250;
					break;
				}
			}
		}

		for(int i = 0; i < enemy4Count; i++) {
			updateEnemy4(&enemies4[i]);
			enemy4PlayerCollisionCheck(&enemies4[i], &player);
		}
	}
/******************************************************END of*************************************************************/
/***************************************************GAME UPDATES**********************************************************/
	
/******************************************************UPDATE*************************************************************/
/*******************************************************OAM***************************************************************/
	void updateOAM1() {

		//player shadowOAM stuff
		shadowOAM[0].attr0 = player.row | ATTR0_TALL;

		//if the player is not punching and not flipped, use the default player sprite
		if(player.flipped == 0) {
			shadowOAM[0].attr1 = ATTR1_SIZE32| ATTR1_VFLIP | player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 22);
		} 
		//if the player is not punching and is flipped, flip the default player sprite horizontally
		else if(player.flipped == 1) {
			shadowOAM[0].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | ATTR1_VFLIP| player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 22);
		} 

		spawnEnemy3();

		spawnParachute();
		
		if(playerHealth == 3) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE16 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 24);
		} else if(playerHealth == 2) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 28);
		} else if(playerHealth == 1) {
			shadowOAM[12].attr0 = health.row | ATTR0_SQUARE;
			shadowOAM[12].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 31);
		} else if(playerHealth == 1000000) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE64 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(1, 24);
		}
	}


	void updateOAM2() {

		//player shadowOAM stuff
		shadowOAM[0].attr0 = player.row | ATTR0_TALL;

		//if the player is not punching and not flipped, use the default player sprite
		if(player.punching == 0 && player.flipped == 0) {
			shadowOAM[0].attr1 = ATTR1_SIZE32| player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 0);
		} 
		//if the player is not punching and is flipped, flip the default player sprite horizontally
		else if(player.punching == 0 && player.flipped == 1) {
			shadowOAM[0].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 0);
		} 
		//if the player is punching but not flipped, use the default punching player sprite
		else if(player.punching == 1 && player.flipped == 0) {
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 2);
		} 
		//if the player is punching and is flipped, flip the punching player sprite horizontally
		else if(player.punching == 1 && player.flipped == 1) {
			shadowOAM[0].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 2);
		}

		//enemies OAM - looping through spawn enemy
		
		spawnEnemy1();
		spawnEnemy1Flip();
	

		//player health OAM
		if(playerHealth == 3) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE16 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 24);
		} else if(playerHealth == 2) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 28);
		} else if(playerHealth == 1) {
			shadowOAM[12].attr0 = health.row | ATTR0_SQUARE;
			shadowOAM[12].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(0, 31);
		} else if(playerHealth == 1000000) {
			shadowOAM[12].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[12].attr1 = ATTR1_SIZE64 | health.col;
			shadowOAM[12].attr2 = SPRITEOFFSET16(1, 24);
		}

		//stamina OAM
		if(player.stamina == MAXSTAMINA) {
			shadowOAM[13].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[13].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[13].attr2 = SPRITEOFFSET16(8, 0);
		} else if(player.stamina == 75) {
			shadowOAM[13].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[13].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[13].attr2 = SPRITEOFFSET16(9, 0);
		} else if(player.stamina == 50) {
			shadowOAM[13].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[13].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[13].attr2 = SPRITEOFFSET16(10, 0);
		} else if(player.stamina == 25) {
			shadowOAM[13].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[13].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[13].attr2 = SPRITEOFFSET16(11, 0);
		} else if(player.stamina == 0) {
			shadowOAM[13].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[13].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[13].attr2 = SPRITEOFFSET16(8, 4);
		}

		//enemies dead counter OAM
		if(enemiesDead == 0) {
			shadowOAM[14].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[14].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[14].attr2 = SPRITEOFFSET16(8, 12);
		} else if(enemiesDead == 1) {
			shadowOAM[14].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[14].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[14].attr2 = SPRITEOFFSET16(8, 13);
		} else if(enemiesDead == 2) {
			shadowOAM[14].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[14].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[14].attr2 = SPRITEOFFSET16(8, 14);
		} else if(enemiesDead == 3) {
			shadowOAM[14].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[14].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[14].attr2 = SPRITEOFFSET16(8, 15);
		} else if(enemiesDead == 4) {
			shadowOAM[14].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[14].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[14].attr2 = SPRITEOFFSET16(8, 16);
		}
	}

	void updateOAM3() {

		//player shadowOAM stuff
		shadowOAM[0].attr0 = player.row | ATTR0_TALL;

		//if the player is not punching and not flipped, use the default player sprite
		if(player.punching == 0 && player.flipped == 0) {
			shadowOAM[0].attr1 = ATTR1_SIZE32| player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 0);
		} 
		//if the player is not punching and is flipped, flip the default player sprite horizontally
		else if(player.punching == 0 && player.flipped == 1) {
			shadowOAM[0].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 0);
		} 
		//if the player is punching but not flipped, use the default punching player sprite
		else if(player.punching == 1 && player.flipped == 0) {
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 2);
		} 
		//if the player is punching and is flipped, flip the punching player sprite horizontally
		else if(player.punching == 1 && player.flipped == 1) {
			shadowOAM[0].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | player.col;
			shadowOAM[0].attr2 = SPRITEOFFSET16(0, 2);
		}

		
			spawnEnemy2();
			spawnEnemy2Flip();
			spawnEnemy4();
		

		//player health OAM
		if(playerHealth == 3) {
			shadowOAM[16].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[16].attr1 = ATTR1_SIZE16 | health.col;
			shadowOAM[16].attr2 = SPRITEOFFSET16(0, 24);
		} else if(playerHealth == 2) {
			shadowOAM[16].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[16].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[16].attr2 = SPRITEOFFSET16(0, 28);
		} else if(playerHealth == 1) {
			shadowOAM[16].attr0 = health.row | ATTR0_SQUARE;
			shadowOAM[16].attr1 = ATTR1_SIZE8 | health.col;
			shadowOAM[16].attr2 = SPRITEOFFSET16(0, 31);
		} else if(playerHealth == 1000000) {
			shadowOAM[16].attr0 = health.row | ATTR0_WIDE;
			shadowOAM[16].attr1 = ATTR1_SIZE64 | health.col;
			shadowOAM[16].attr2 = SPRITEOFFSET16(1, 24);
		}


		//stamina OAM
		if(player.stamina == MAXSTAMINA) {
			shadowOAM[17].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[17].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[17].attr2 = SPRITEOFFSET16(8, 0);
		} else if(player.stamina == 75) {
			shadowOAM[17].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[17].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[17].attr2 = SPRITEOFFSET16(9, 0);
		} else if(player.stamina == 50) {
			shadowOAM[17].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[17].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[17].attr2 = SPRITEOFFSET16(10, 0);
		} else if(player.stamina == 25) {
			shadowOAM[17].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[17].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[17].attr2 = SPRITEOFFSET16(11, 0);
		} else if(player.stamina == 0) {
			shadowOAM[17].attr0 = stamina.row | ATTR0_WIDE;
			shadowOAM[17].attr1 = ATTR1_SIZE16 | stamina.col;
			shadowOAM[17].attr2 = SPRITEOFFSET16(8, 4);
		}


		//enemies dead counter OAM
		if(enemiesDead == 0) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 12);
		} else if(enemiesDead == 1) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 13);
		} else if(enemiesDead == 2) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 14);
		} else if(enemiesDead == 3) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 15);
		} else if(enemiesDead == 4) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 16);
		} else if(enemiesDead == 5) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 17);
		} else if(enemiesDead == 6) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 18);
		} else if(enemiesDead == 7) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 19);
		} else if(enemiesDead == 8) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 20);
		} else if(enemiesDead == 9) {
			shadowOAM[18].attr0 = enemDead.row | ATTR0_SQUARE;
			shadowOAM[18].attr1 = ATTR1_SIZE8 | enemDead.col;
			shadowOAM[18].attr2 = SPRITEOFFSET16(8, 21);
		}
	}

/******************************************************END of*************************************************************/
/***************************************************UPDATE OAM***********************************************************/


/*******************************************************SPAWN**************************************************************/
/***************************************************ENEMIES/CHUTE**********************************************************/	
	//spawning brown monkies facing right
	void spawnEnemy1() {
		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies1[i].active) {
				shadowOAM[1+i].attr0 = (enemies1[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | (enemies1[i].col & COLMASK);
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 4);
			} else if (enemies1[i].dead > 0) {
				shadowOAM[1+i].attr0 = (enemies1[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = ATTR1_SIZE32 | (enemies1[i].col & COLMASK);
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(8, 8);
				enemies1[i].dead--;
			} else if(enemies1[i].dead == 0) {
				enemies1[i].active = 0;
				shadowOAM[1+i].attr0 = ATTR0_HIDE;
			}
		}
	}

	//spawning brown monkies facing left
	void spawnEnemy1Flip() {

		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies1Flip[i].active) {
				shadowOAM[6+i].attr0 = (enemies1Flip[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[6+i].attr1 = ATTR1_SIZE32 | (enemies1Flip[i].col & COLMASK);
				shadowOAM[6+i].attr2 = SPRITEOFFSET16(0, 4);
			} else if (enemies1Flip[i].dead > 0) {
				shadowOAM[6+i].attr0 = (enemies1Flip[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[6+i].attr1 = ATTR1_SIZE32 | (enemies1Flip[i].col & COLMASK);
				shadowOAM[6+i].attr2 = SPRITEOFFSET16(8, 8);
				enemies1Flip[i].dead--;
			} else if(enemies1Flip[i].dead == 0) {
				enemies1Flip[i].active = 0;
				shadowOAM[6+i].attr0 = ATTR0_HIDE;
			}

		}
	}

	//spawning white monkies facing right
	void spawnEnemy2() {

		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies2[i].active) {
				shadowOAM[1+i].attr0 = (enemies2[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = ATTR1_SIZE32 | ATTR1_HFLIP | (enemies2[i].col & COLMASK);
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 8);
			} else if (enemies2[i].dead > 0) {
				shadowOAM[1+i].attr0 = (enemies2[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = ATTR1_SIZE32 | (enemies2[i].col & COLMASK);
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(8, 8);
				enemies2[i].dead--;
			} else if(enemies2[i].dead == 0) {
				enemies2[i].active = 0;
				shadowOAM[1+i].attr0 = ATTR0_HIDE;
			}
		}
	}

	//spawning white monkies facing left
	void spawnEnemy2Flip() {

		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies2Flip[i].active) {
				shadowOAM[6+i].attr0 = (enemies2Flip[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[6+i].attr1 = ATTR1_SIZE32 | (enemies2Flip[i].col & COLMASK);
				shadowOAM[6+i].attr2 = SPRITEOFFSET16(0, 8);
			} else if (enemies2Flip[i].dead > 0) {
				shadowOAM[6+i].attr0 = (enemies2Flip[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[6+i].attr1 = ATTR1_SIZE32 | (enemies2Flip[i].col & COLMASK);
				shadowOAM[6+i].attr2 = SPRITEOFFSET16(8, 8);
				enemies2Flip[i].dead--;
			} else if(enemies2Flip[i].dead == 0) {
				enemies2Flip[i].active = 0;
				shadowOAM[6+i].attr0 = ATTR0_HIDE;
			}
		}
	}

	//spawning debris
	void spawnEnemy3() {

		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies3[i].active) {
				shadowOAM[1+i].attr0 = enemies3[i].row | ATTR0_SQUARE;
				shadowOAM[1+i].attr1 = ATTR1_SIZE32 | enemies3[i].col;
				shadowOAM[1+i].attr2 = SPRITEOFFSET16(0, 16);
			}
		}
	}

	//spawning coconuts
	void spawnEnemy4() {

		for (int i = 0; i < NUMENEMIES; i++) {
			if(enemies4[i].active) {
				shadowOAM[11+i].attr0 = (enemies4[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[11+i].attr1 = ATTR1_SIZE16 | enemies4[i].col;
				shadowOAM[11+i].attr2 = SPRITEOFFSET16(0, 20);
			}
		}
	}

	void spawnParachute() {

		for (int i = 0; i < NUMCHUTES; i++) {
			if(parachute[i].active) {
				shadowOAM[11+i].attr0 = (parachute[i].row & ROWMASK) | ATTR0_SQUARE;
				shadowOAM[11+i].attr1 = ATTR1_SIZE16 | parachute[i].col;
				shadowOAM[11+i].attr2 = SPRITEOFFSET16(2, 20);
			}
		}
	}

/*******************************************************END of************************************************************/
/******************************************************SPAWNING**********************************************************/

/*****************************************************COLLISION**********************************************************/
/*******************************************************CHECKS***********************************************************/
	void enemy1PlayerCollisionCheck(ENEMIES * e, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->punching == 0 && p->flipped == 0) {
			if((e->active) && (e->col + e->width >= p->col) && (e->col <= p->col + p->width)) {
				if(e->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e->colliding = 1;
					e->cd = 2;
					playerHealth--;
				}
			} else {
				e->colliding = 0;
			}
		} 
		//if player is not punching but is facing left (is flipped)
		if(p->punching == 0 && p->flipped == 1) {
			if((e->active) && (e->col + e->width >= p->col) && (e->col <= p->col + p->width)) {
				if(e->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e->colliding = 1;
					e->cd = 2;
					playerHealth--;
				}
			} else {
				e->colliding = 0;
			}
		}
		//if player is punching, but facing right (not flipped)
		if(p->punching == 1 && p->flipped == 0) {
			if((e->active) && (e->col + e->width >= p->col) && (e->col <= p->col + p->width)) {
				if(e->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e->colliding = 1;
					e->cd = 2;
					playerHealth--;
				}
			} else {
				e->colliding = 0;
			}
		}


		//if player is punching and facing left
		if (p->punching == 1 && p->flipped == 1) {
			if((e->active) && (e->col + e->width >= p->col) && (e->col <= p->col + p->width)) { //make into range
				if(e->colliding == 0) {
				e->dead = 20;
				enemiesDead++;	
				e->active = 0;
				e->colliding = 1;
				//enemies1[i].col = 241;
				}
			} else {
				e->colliding = 0;
			}	
		}

		if(playerHealth == 0) {
			goToLose2();
		}

		if(enemiesDead == 5) {
			goToL3Instructs();
		}
	}


	void enemy1FlipPlayerCollisionCheck(ENEMIES * e1f, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->punching == 0 && p->flipped == 0) {
			if((e1f->active) && (e1f->col == p->col + p->width)) {
				if(e1f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e1f->colliding = 1;
					e1f->cd = -2;
					playerHealth--;
				}
			} else {
				e1f->colliding = 0;
			}
		} 
		//if player is not punching but is facing left (is flipped)
		if(p->punching == 0 && p->flipped == 1) {
			if((e1f->active) && (e1f->col == p->col + p->width)) {
				if(e1f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e1f->colliding = 1;
					e1f->cd = -2;
					playerHealth--;
				}
			} else {
				e1f->colliding = 0;
			}
		}
		//if player is punching, but facing right (not flipped)
		if(p->punching == 1 && p->flipped == 1) {
			if((e1f->active) && (e1f->col == p->col + p->width)) {
				if(e1f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e1f->colliding = 1;
					e1f->cd = -2;
					playerHealth--;
				}
			} else {
				e1f->colliding = 0;
			}
		}
		//if player is punching and facing left
		if (p->punching == 1 && p->flipped == 0) {
				if((e1f->active) && (e1f->col == p->col + p->width)) {
					if(e1f->colliding == 0) {
						e1f->dead = 20;
						enemiesDead++;	
						e1f->active = 0;
						e1f->colliding = 1;
						//enemies1[i].col = 241;
					}	
				} else {
					e1f->colliding = 0;
			}		
		}

		if(playerHealth == 0) {
			goToLose2();
		}

		if(enemiesDead == 5) {
			goToL3Instructs();
		}
	}

	void enemy2PlayerCollisionCheck(ENEMIES * e2, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->punching == 0 && p->flipped == 0) {
			if((e2->active) && (e2->col + e2->width >= p->col) && (e2->col <= p->col + p->width)) {
				if(e2->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2->colliding = 1;
					e2->cd = 2;
					playerHealth--;
				}
			} else {
				e2->colliding = 0;
			}
		} 
		//if player is not punching but is facing left (is flipped)
		if(p->punching == 0 && p->flipped == 1) {
			if((e2->active) && (e2->col + e2->width >= p->col) && (e2->col <= p->col + p->width)) {
				if(e2->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2->colliding = 1;
					e2->cd = 2;
					playerHealth--;
				}
			} else {
				e2->colliding = 0;
			}
		}
		//if player is punching, but facing right (not flipped)
		if(p->punching == 1 && p->flipped == 0) {
			if((e2->active) && (e2->col + e2->width >= p->col) && (e2->col <= p->col + p->width)) {
				if(e2->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2->colliding = 1;
					e2->cd = 2;
					playerHealth--;
				}
			} else {
				e2->colliding = 0;
			}
		}


		//if player is punching and facing left
		if (p->punching == 1 && p->flipped == 1) {
			if((e2->active) && (e2->col + e2->width >= p->col) && (e2->col <= p->col + p->width)) { //make into range
				if(e2->colliding == 0) {
				e2->dead = 20;
				enemiesDead++;	
				e2->active = 0;
				e2->colliding = 1;
				//enemies1[i].col = 241;
				}
			} else {
				e2->colliding = 0;
			}	
		}

		if(playerHealth == 0) {
			goToLose3();
		}

		if(enemiesDead == 10) {
			goToFinalCutScene();
		}
	}


	void enemy2FlipPlayerCollisionCheck(ENEMIES * e2f, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->punching == 0 && p->flipped == 0) {
			if((e2f->active) && (e2f->col == p->col + p->width)) {
				if(e2f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2f->colliding = 1;
					e2f->cd = -2;
					playerHealth--;
				}
			} else {
				e2f->colliding = 0;
			}
		} 
		//if player is not punching but is facing left (is flipped)
		if(p->punching == 0 && p->flipped == 1) {
			if((e2f->active) && (e2f->col == p->col + p->width)) {
				if(e2f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2f->colliding = 1;
					e2f->cd = -2;
					playerHealth--;
				}
			} else {
				e2f->colliding = 0;
			}
		}
		//if player is punching, but facing right (not flipped)
		if(p->punching == 1 && p->flipped == 1) {
			if((e2f->active) && (e2f->col == p->col + p->width)) {
				if(e2f->colliding == 0) {
					playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
					e2f->colliding = 1;
					e2f->cd = -2;
					playerHealth--;
				}
			} else {
				e2f->colliding = 0;
			}
		}
		//if player is punching and facing left
		if (p->punching == 1 && p->flipped == 0) {
				if((e2f->active) && (e2f->col == p->col + p->width)) {
					if(e2f->colliding == 0) {
						e2f->dead = 20;
						enemiesDead++;	
						e2f->active = 0;
						e2f->colliding = 1;
						//enemies1[i].col = 241;
					}	
				} else {
					e2f->colliding = 0;
			}		
		}

		if(playerHealth == 0) {
			goToLose3();
		}

		if(enemiesDead == 10) {
			goToFinalCutScene();
		}
	}

	void enemy3PlayerCollisionCheck(ENEMIES * e3, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->flipped == 0) {
			if((e3->col + e3->width == p->col)
				&& (e3->row + e3->height >= p->row)
				&& (e3->row <= p->row + p->height)) { //left collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
			if((e3->col == p->col + p->width)
				&& (e3->row + e3->height >= p->row)
				&& (e3->row <= p->row + p->height)) { //right collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
			if((e3->row == p->row + p->height)
				&& (e3->col + e3->width >= p->col)
				&& (e3->col <= p->col + p->width)) { //bottom collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
		} 

		if(p->flipped == 1) {
			if((e3->col + e3->width == p->col)
				&& (e3->row + e3->height >= p->row)
				&& (e3->row <= p->row + p->height)) { //left collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
			if((e3->col == p->col + p->width)
				&& (e3->row + e3->height >= p->row)
				&& (e3->row <= p->row + p->height)) { //right collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
			if((e3->row == p->row + p->height)
				&& (e3->col + e3->width >= p->col)
				&& (e3->col <= p->col + p->width)) { //bottom collision
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
		}	

		if(playerHealth == 0) {
			goToLose1();
		}
	}


	//coconuts
	void enemy4PlayerCollisionCheck(ENEMIES * e4, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->punching == 0 && p->flipped == 0) {
			if((e4->active) && (e4->col + e4-> width >= p->col)
				&&(e4->col <= p->col + p->width)
				&&(e4->row + e4->height == p->row)) {
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
		} 
		//if player is not punching but is facing left (is flipped)
		if(p->punching == 0 && p->flipped == 1) {
			if((e4->active) && (e4->col + e4-> width >= p->col)
				&&(e4->col <= p->col + p->width)
				&&(e4->row + e4->height == p->row)) {
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
		}
		//if player is punching, but facing right (not flipped)
		if(p->punching == 1 && p->flipped == 1) {
			if((e4->active) && (e4->col + e4-> width >= p->col)
				&&(e4->col <= p->col + p->width)
				&&(e4->row + e4->height == p->row)) {
				playSoundB(oofSound, OOFSOUNDLEN, OOFSOUNDFREQ, 0);
				playerHealth--;
			}
		}

		if(playerHealth == 0) {
			goToLose3();
		}
	}


	void parachutePlayerCollisionCheck(PARACHUTE * ch, PLAYER * p) {
		//if player is in static state (not flipped or punching)
		if(p->flipped == 0) {
			if((ch->col + ch->width == p->col)
				&& (ch->row + ch->height >= p->row)
				&& (ch->row <= p->row + p->height)) { //left collision
				goToL2Instructs();
			}

			if((ch->col == p->col + p->width)
				&& (ch->row + ch->height >= p->row)
				&& (ch->row <= p->row + p->height)) { //right collision
				goToL2Instructs();
			}

			if((ch->row == p->row + p->height)
				&& (ch->col + ch->width >= p->col)
				&& (ch->col <= p->col + p->width)) { //bottom collision
				goToL2Instructs();
			}
		} 

		if(p->flipped == 1) {
			if((ch->col + ch->width == p->col)
				&& (ch->row + ch->height >= p->row)
				&& (ch->row <= p->row + p->height)) { //left collision
				goToL2Instructs();
			}

			if((ch->col == p->col + p->width)
				&& (ch->row + ch->height >= p->row)
				&& (ch->row <= p->row + p->height)) { //right collision
				goToL2Instructs();
			}

			if((ch->row == p->row + p->height)
				&& (ch->col + ch->width >= p->col)
				&& (ch->col <= p->col + p->width)) { //bottom collision
				goToL2Instructs();
			}
		}	
	}

/*******************************************************END of*************************************************************/
/******************************************************COLLISIONS**********************************************************/

/******************************************************Sound***************************************************************/
/******************************************************Stuff***************************************************************/
	void setupSounds() {
	    REG_SOUNDCNT_X = SND_ENABLED;

		REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
	                     DSA_OUTPUT_RATIO_100 | 
	                     DSA_OUTPUT_TO_BOTH | 
	                     DSA_TIMER0 | 
	                     DSA_FIFO_RESET |
	                     DSB_OUTPUT_RATIO_100 | 
	                     DSB_OUTPUT_TO_BOTH | 
	                     DSB_TIMER1 | 
	                     DSB_FIFO_RESET;

		REG_SOUNDCNT_L = 0;
	}

	void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
	        dma[1].cnt = 0;
		
	        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
		
	        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
		
	        REG_TM0CNT = 0;
		
	        REG_TM0D = -ticks;
	        REG_TM0CNT = TIMER_ON;
		
	        // assigning appropriate struct values (excluding priority)
		    soundA.data = sound;
		    soundA.length = length;
		    soundA.frequency = frequency;
		    soundA.isPlaying = 1;
		    soundA.loops = loops;
		    soundA.duration =  (VBLANK_FREQ*length)/frequency;
		    soundA.vbCount = 0;

	        
	}


	void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

	        dma[2].cnt = 0;

	        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

	        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

	        REG_TM1CNT = 0;
		
	        REG_TM1D = -ticks;
	        REG_TM1CNT = TIMER_ON;
		
	        soundB.data = sound;
		    soundB.length = length;
		    soundB.frequency = frequency;
		    soundB.isPlaying = 1;
		    soundB.loops = loops;
		    soundB.duration = (VBLANK_FREQ*length)/frequency;
		    soundB.vbCount = 0;
	        
	}

	void pauseSound() {

		//turn the timers off
		REG_TM0CNT = 0;
		REG_TM1CNT = 0;
		//turn the sound off
		soundA.isPlaying = 0;
		soundB.isPlaying = 0;
		
	}

	void unpauseSound() {
		/*turn the timers back on in order to resume sound
		where it left off*/
		REG_TM0CNT = TIMER_ON;
		REG_TM1CNT = TIMER_ON;
		//turn sound on
		soundA.isPlaying = 1;
		soundB.isPlaying = 1;
		
	}

	void stopSound() {
	    //turn of the dma's
	    dma[1].cnt = 0;
	    dma[2].cnt = 0;
	    //turn off the timers
	    REG_TM0CNT = 0;
		REG_TM1CNT = 0;
		//turn off the sound
		soundA.isPlaying = 0;
		soundB.isPlaying = 0;
		
	}

	void setupInterrupts()
	{
		REG_IME = 0;
		
		REG_INTERRUPT = (unsigned int)interruptHandler;
		
		REG_IE |= INT_VBLANK;
		REG_DISPSTAT |= INT_VBLANK_ENABLE;
		REG_IME = 1;
	}

	void interruptHandler() {
		REG_IME = 0;
		if(REG_IF & INT_VBLANK) {
			//determining if a sound if finished or not
			if(soundA.isPlaying) {							//is soundA playing?
				soundA.vbCount++;							//increase the vbCount for soundA
				if(soundA.vbCount > soundA.duration) {
					if(soundA.loops) {
						playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
					} else {								//if you dont want the sound to loop
						dma[1].cnt = 0;						//dma is turned off; timer is still running
						soundA.isPlaying = 0;
						REG_TM0CNT = 0;						//controls timer 0; 
					}
				}
			}

			if(soundB.isPlaying) {							//is soundB playing?
				soundB.vbCount++;							//increase the vbCount for soundA
				if(soundB.vbCount > soundB.duration) {
					if(soundB.loops) {
						playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
					} else {								//if you dont want the sound to loop
						dma[2].cnt = 0;						//dma is turned off; timer is still running
						soundB.isPlaying = 0;
						REG_TM1CNT = 0;						//controls timer 1; 
					}
				}
			}
			
			REG_IF = INT_VBLANK; 
		}

		REG_IME = 1;
	}

