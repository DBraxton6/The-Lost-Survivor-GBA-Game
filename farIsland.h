
//{{BLOCK(farIsland)

//======================================================================
//
//	farIsland, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 321 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 10272 + 4096 = 14880
//
//	Time-stamp: 2017-04-10, 17:56:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FARISLAND_H
#define GRIT_FARISLAND_H

#define farIslandTilesLen 10272
extern const unsigned short farIslandTiles[5136];

#define farIslandMapLen 4096
extern const unsigned short farIslandMap[2048];

#define farIslandPalLen 512
extern const unsigned short farIslandPal[256];

#endif // GRIT_FARISLAND_H

//}}BLOCK(farIsland)
