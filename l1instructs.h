
//{{BLOCK(l1instructs)

//======================================================================
//
//	l1instructs, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 516 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16512 + 2048 = 19072
//
//	Time-stamp: 2017-04-11, 23:27:10
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_L1INSTRUCTS_H
#define GRIT_L1INSTRUCTS_H

#define l1instructsTilesLen 16512
extern const unsigned short l1instructsTiles[8256];

#define l1instructsMapLen 2048
extern const unsigned short l1instructsMap[1024];

#define l1instructsPalLen 512
extern const unsigned short l1instructsPal[256];

#endif // GRIT_L1INSTRUCTS_H

//}}BLOCK(l1instructs)
