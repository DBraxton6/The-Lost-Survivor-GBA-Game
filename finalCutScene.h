
//{{BLOCK(finalCutScene)

//======================================================================
//
//	finalCutScene, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 342 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10944 + 2048 = 13504
//
//	Time-stamp: 2017-04-11, 20:44:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FINALCUTSCENE_H
#define GRIT_FINALCUTSCENE_H

#define finalCutSceneTilesLen 10944
extern const unsigned short finalCutSceneTiles[5472];

#define finalCutSceneMapLen 2048
extern const unsigned short finalCutSceneMap[1024];

#define finalCutScenePalLen 512
extern const unsigned short finalCutScenePal[256];

#endif // GRIT_FINALCUTSCENE_H

//}}BLOCK(finalCutScene)
