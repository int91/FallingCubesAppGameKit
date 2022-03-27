
#include "utils.agc"
#include "entity.agc"
#include "player.agc"
#include "enemy.agc"
#include "bullet.agc"
#include "ammobox.agc"

SceneManagerInit:
	SceneID = 0
	ScenesInit = 0
	gosub CheckScene
return

SceneManagerUpdate:

	if (ScenesInit = 0)
		gosub CheckScene
	endif
	if (SceneID = 0 and ScenesInit = 1)
		DebugHandler()
		if (GetRawKeyPressed(KEY_SPACE))
			SceneID = 1
			ScenesInit = 0
			DeleteText(0)
			DeleteText(1)
		endif
	endif
	if (SceneID = 1 and ScenesInit = 1)
		DebugHandler()
		gosub PlayerUpdate
		gosub EnemyUpdate
		gosub BulletUpdate
		gosub AmmoboxUpdate
		gosub DrawEntities
		gosub IngameGuiUpdate
		if (playerLives < 1)
			for i = 0 to entities.length 
				DestroyEntity(i)
			next i
			if entities.length = 0
				ClearGameGui()
				SceneID = 2
				ScenesInit = 0
			endif
		endif
	endif
	if (SceneID = 2 and ScenesInit = 1)
		DebugHandler()
		if (GetRawKeyPressed(KEY_SPACE))
			SceneID = 0
			ScenesInit = 0
			for i = 10 to 15
				DeleteText(i)
			next i
		endif
	endif
return

MainMenuInit:
	CreateText(0, "Falling Cubes")
	CreateText(1, "Press [Space] To Start")
	SetTextSize(1, 36)
	SetTextSize(0, 72)
	SetTextAlignment(0, 1)
	SetTextAlignment(1, 1)
	SetTextPosition(1, 512, 70)
	SetTextPosition(0, 512, 10)
return

LostScreenInit:
	CreateText(10, "GAMEOVER")
	CreateText(11, "Score: " + str(score))
	CreateText(12, "Time Survived: " + str(timeSurvived#, 2))
	CreateText(13, "Shots Fired: " + str(shotsFired))
	CreateText(14, "Shots Hit: " + str(shotsHit))
	CreateText(15, "Press [Space] To Restart")
	
	SetTextSize(10, 72)
	SetTextSize(11, 36)
	SetTextSize(12, 36)
	SetTextSize(13, 36)
	SetTextSize(14, 36)
	SetTextSize(15, 28)
	
	SetTextAlignment(10, 1)
	SetTextAlignment(11, 1)
	SetTextAlignment(12, 1)
	SetTextAlignment(13, 1)
	SetTextAlignment(14, 1)
	SetTextAlignment(15, 1)
	
	SetTextPosition(10, 512, 10)
	SetTextPosition(11, 512, 70)
	SetTextPosition(12, 512, 100)
	SetTextPosition(13, 512, 130)
	SetTextPosition(14, 512, 160)
	SetTextPosition(15, 512, 194)
return

IngameGuiInit:
	CreateText(16, "Lives: " + str(playerLives))
	CreateText(17, "Ammo: " + str(ammo))
	SetTextSize(16, 36)
	SetTextSize(17, 36)
	
	SetTextAlignment(16, 0)
	SetTextAlignment(17, 0)
	
	SetTextPosition(16, 10, 10)
	SetTextPosition(17, 10, 40)
return
IngameGuiUpdate:
	SetTextString(16, "Lives: " + str(playerLives))
	SetTextString(17, "Ammo: " + str(ammo))
return

function ClearGameGui()
	DeleteText(16)
	DeleteText(17)
endfunction

CheckScene:
	if (SceneID = 0)
		gosub MainMenuInit
	endif
	if (SceneID = 1)
		gosub EntityInit
		gosub PlayerInit
		gosub EnemyInit
		gosub AmmoboxInit
		gosub IngameGuiInit
	endif
	if (SceneID = 2)
		gosub LostScreenInit
	endif
	ScenesInit = 1
return
