
#include "buildplaceholder.agc"
#include "entity.agc"
#include "utils.agc"

BuildSystemInit:
	global GridSize = 32
	global buildID = 1

	canBuild = 1
	buildableHovered = 0
	gosub BuildPlaceHolderInit
return

BuildSystemUpdate:
	buildableHovered = 0
	
	for i = 1 to entities.length
		if (entities[i].tag = "buildable")
			if (entities[bphID].x = entities[i].x and entities[bphID].y = entities[i].y)
				canBuild = 0
				buildableHovered = i
			endif
		endif
	next i
	
	if (GetRawMouseRightPressed() and buildableHovered > 0)
		DestroyEntity(buildableHovered)
	endif
	
	if (GetRawMouseLeftPressed() and canBuild = 1)
		CreateEntity(entities[bphID].x, entities[bphID].y, GridSize, GridSize, placeHolderBoxSprite, "buildable", buildID, cyan)
	endif
	
	gosub BuildPlaceHolderUpdate
	canBuild = 1
	print(buildableHovered)
	//print(buildID)
return
