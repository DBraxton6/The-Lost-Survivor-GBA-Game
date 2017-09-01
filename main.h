#define NUMENEMIES 5
#define NUMCHUTES 3
#define MAXSTAMINA 100


//Prototypes
	//game stuff
int main();
void hideSprites();
void init1();
void init2();
void init3();
void update1();
void update2();
void update3();
void updateOAM1();
void updateOAM2();
void updateOAM3();
void spawnEnemy1();
void spawnEnemy1Flip();
void spawnEnemy2();
void spawnEnemy2Flip();
void spawnEnemy3();
void spawnEnemy4();
void spawnParachute();
void enemy1PlayerCollisionCheck();
void enemy1FlipPlayerCollisionCheck();
void enemy2PlayerCollisionCheck();
void enemy2FlipPlayerCollisionCheck();
void enemy3PlayerCollisionCheck();
void enemy4PlayerCollisionCheck();
void parachutePlayerCollisionCheck();
	//game states
void goToSplash();
void goToL1Instructs();
void goToLevel1();
void goToL2Instructs();
void goToLevel2();
void goToL3Instructs();
void goToLevel3();
void goToPause1();
void goToPause2();
void goToPause3();
void goToWin();
void goToLose1();
void goToLose2();
void goToLose3();
void updateSplash();
void updateL1Instructs();
void updateLevel1();
void updateL2Instructs();
void updateLevel2();
void updateL3Instructs();
void updateLevel3();
void updatePause1();
void updatePause2();
void updatePause3();
void updateWin();
void updateLose1();
void updateLose2();
void updateLose3();
void updateFinalCutScene();
	//sound stuff
void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void pauseSound();
void unpauseSound();
void unmuteSound();
void stopSound();
void setupInterrupts();
void interruptHandler();

typedef struct {
	int row, oldRow;
	int col, oldCol;
	int height; 
	int width;
	int rd;
	int cd;
	int punching;
	int flipped;
	int stamina;
}PLAYER;

typedef struct {
	int row, oldRow;
	int col, oldCol;
	int height; 
	int width;
	int rd;
	int cd;
	int active;
	int dead;
	int colliding;
}ENEMIES;

typedef struct {
	int row, oldRow;
	int col, oldCol;
	int height; 
	int width;
	int rd;
	int cd;
	int active;
}PARACHUTE;

typedef struct {
	int row, col;
}GAMEBARS;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;