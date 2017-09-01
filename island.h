
//{{BLOCK(island)

//======================================================================
//
//	island, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 455 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14560 + 2048 = 17120
//
//	Time-stamp: 2017-04-10, 17:48:46
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ISLAND_H
#define GRIT_ISLAND_H

#define islandTilesLen 14560
extern const unsigned short islandTiles[7280];

#define islandMapLen 2048
extern const unsigned short islandMap[1024];

#define islandPalLen 512
extern const unsigned short islandPal[256];

#endif // GRIT_ISLAND_H

//}}BLOCK(island)
