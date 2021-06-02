
#include "entity.agc"

phO as entity

BuildPlaceHolderInit:
	phO.x = 64
	phO.y = 64
	phO.sizeX = 28
	phO.sizeY = 28
	phO.spawned = 1
	phO.tag = "buildcursor"
	phO.id = 5
	phO.color = green
	phO.sprite = CreateSprite(placeHolderOutlineSprite)
	entities.insert(phO)
	bphID = entities.length
return

BuildPlaceHolderUpdate:
	entities[bphID].x = SnapToGrid(m.x, GridSize)
	entities[bphID].y = SnapToGrid(m.y, GridSize)
	
	if (canBuild = 1)
		entities[bphID].color = green
	else
		entities[bphID].color = red
		endif
return
