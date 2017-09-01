# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
# 2 "game.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 40 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);
void initialize();

void waitForVblank();
void flipPage();
# 72 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 82 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 211 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 268 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "game.c" 2
# 1 "main.h" 1







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
# 4 "game.c" 2

void updatePlayer(PLAYER* p) {
 p->oldCol = p->col;
 p->oldRow = p->row;


  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
   if(!(p->col == 0)) {
    p->flipped = 1;
    p->col--;
   }
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
   if(!(p->col == 240-p->width)) {
    p->flipped = 0;
    p->col++;
   }
  }

}

void updateEnemy1(ENEMIES* e, PLAYER* p) {
 e->oldRow = e->row;
 e->oldCol = e->col;


 if(e->active)
 {

  e->col += e->cd;


  if(e->col + 1 > 241)
  {

   e->active = 0;
   e->col = -24;
   e->dead = 0;
  }
 }
}

void updateEnemy1Flip(ENEMIES* e1f) {
 e1f->oldRow = e1f->row;
 e1f->oldCol = e1f->col;


 if(e1f->active)
 {

  e1f->col += e1f->cd;


  if(e1f->col + e1f->width + 1 < -1)
  {

   e1f->active = 0;
   e1f->col = 241;
  }
 }
}

void updateEnemy2(ENEMIES* e2, PLAYER* p) {
 e2->oldRow = e2->row;
 e2->oldCol = e2->col;


 if(e2->active)
 {

  e2->col += e2->cd;


  if(e2->col > 241)
  {

   e2->active = 0;
   e2->col = -24;
  }
 }
}

void updateEnemy2Flip(ENEMIES* e2f) {
 e2f->oldRow = e2f->row;
 e2f->oldCol = e2f->col;


 if(e2f->active)
 {

  e2f->col += e2f->cd;


  if(e2f->col + e2f->width < -1)
  {

   e2f->active = 0;
   e2f->col = 241;
  }
 }
}

void updateEnemy3(ENEMIES* e3, PLAYER* p) {
 e3->oldRow = e3->row;
 e3->oldCol = e3->col;


 if(e3->active)
 {

  e3->row += e3->rd;


  if(e3->row + e3->height < 0)
  {

   e3->active = 0;
   e3->row = 161;
  }
 }
}

void updateEnemy4(ENEMIES* e4, PLAYER* p) {
 e4->oldRow = e4->row;
 e4->oldCol = e4->col;


 if(e4->active)
 {

  e4->row += e4->rd;


  if(e4->row > 161)
  {

   e4->active = 0;
   e4->row = -16;
  }
 }
}

void updateParachute(PARACHUTE* ch, PLAYER* p) {
 ch->oldRow = ch->row;
 ch->oldCol = ch->col;


 if(ch->active)
 {

  ch->row += ch->rd;


  if(ch->row + ch->height + 1 < 0)
  {

   ch->active = 0;
   ch->row = -16;
  }
 }
}
