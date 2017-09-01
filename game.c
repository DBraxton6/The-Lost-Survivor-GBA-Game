#include "game.h"
#include "myLib.h"
#include "main.h"

void updatePlayer(PLAYER* p) {
	p->oldCol = p->col;
	p->oldRow = p->row;

        //walks left
		if(BUTTON_HELD(BUTTON_LEFT)) { 
			if(!(p->col == 0)) {
				p->flipped = 1; //turns player sprite to face the other direction
				p->col--;		//moves player sprite left
			}
		}
		//walks right
		if(BUTTON_HELD(BUTTON_RIGHT)) { 
			if(!(p->col == 240-p->width)) {
				p->flipped = 0;	//turns player sprite to face original direction
				p->col++;		//moves player sprite right
			}
		}
		
}

void updateEnemy1(ENEMIES* e, PLAYER* p) {
	e->oldRow = e->row;
	e->oldCol = e->col;
	

	if(e->active) // Check active
	{
		//adding the cd to col to make things move across screen
		e->col += e->cd;

		
		if(e->col + 1 > 241)  // This checks if left edge of enemy is past right of the screen
		{
			//setting enemy to not active and reset col to negative width
			e->active = 0;
			e->col = -24;
			e->dead = 0;
		}
	}
}

void updateEnemy1Flip(ENEMIES* e1f) {
	e1f->oldRow = e1f->row;
	e1f->oldCol = e1f->col;
	

	if(e1f->active) // Check active
	{
		//adding the cd to col to make things move across screen
		e1f->col += e1f->cd;

		
		if(e1f->col + e1f->width + 1 < -1)  // This checks if right edge of enemy is past left of the screen
		{
			//setting enemy to not active and reset col to offscreen right
			e1f->active = 0;
			e1f->col = 241;
		}
	}
}

void updateEnemy2(ENEMIES* e2, PLAYER* p) {
	e2->oldRow = e2->row;
	e2->oldCol = e2->col;
	

	if(e2->active) // Check active
	{
		//addint the cd to col to make things move across screen
		e2->col += e2->cd;

		
		if(e2->col > 241)  // This checks if left edge of enemy is past right of the screen
		{
			//setting enemy to not active and reset row to negative width
			e2->active = 0;
			e2->col = -24;
		}
	}
}

void updateEnemy2Flip(ENEMIES* e2f) {
	e2f->oldRow = e2f->row;
	e2f->oldCol = e2f->col;
	

	if(e2f->active) // Check active
	{
		//adding the cd to col to make things move across screen
		e2f->col += e2f->cd;

		
		if(e2f->col + e2f->width < -1)  // This checks if left edge of enemy is past the left of the screen
		{
			//setting enemy to not active and reset row to offscreen right
			e2f->active = 0;
			e2f->col = 241;
		}
	}
}

void updateEnemy3(ENEMIES* e3, PLAYER* p) {
	e3->oldRow = e3->row;
	e3->oldCol = e3->col;
	

	if(e3->active) // Check active
	{
		//adding the rd to row to make things fall
		e3->row += e3->rd;

		
		if(e3->row + e3->height < 0)  // This checks if bottom of enemy is past bottom of the screen
		{
			//setting enemy to not active and reset row to offscreen bottom
			e3->active = 0;
			e3->row = 161;
		}
	}
}

void updateEnemy4(ENEMIES* e4, PLAYER* p) {
	e4->oldRow = e4->row;
	e4->oldCol = e4->col;
	

	if(e4->active) // Check active
	{
		//adding the rd to row to make things fall
		e4->row += e4->rd;

		
		if(e4->row > 161)  // This checks if top of coconut is past bottom of the screen
		{
			//setting coconut to not active and reset row to offscreen top
			e4->active = 0;
			e4->row = -16;
		}
	}
}

void updateParachute(PARACHUTE* ch, PLAYER* p) {
	ch->oldRow = ch->row;
	ch->oldCol = ch->col;
	

	if(ch->active) // Check active
	{
		//adding the rd to row to make things "fall" up
		ch->row += ch->rd;

		
		if(ch->row + ch->height + 1 < 0)  // This checks if bottom of parachute is past top of the screen
		{
			//setting parachute to not active and reset row to negative height
			ch->active = 0;
			ch->row = -16;
		}
	}
}