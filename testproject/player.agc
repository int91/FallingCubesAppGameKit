
#include "entity.agc"
#include "bullet.agc"

PlayerInit:
	player as entity
	player.sizeX = 32
	player.sizeY = 32
	player.x = (windowSizeX / 2) + (player.sizeX / 2) //Places player at center of screen
	player.y = 696
	player.spawned = 1
	player.tag = "player"
	player.sprite = CreateSprite(placeHolderBoxSprite)
	player.color = neowhite
	entities.insert(player)
	playerID = entities.length
	playerLives = 3
	
	
	canDash = 1
	canShoot = 1
	
	//Timers and Cooldowns
	dashCoolDown# = 3
	dashTimer# = timer()
	shootCoolDown# = 0.25
	shootTimer# = timer()
	timeSurvived# = timer()
	
	ammo = 3
	shotsFired = 0
	shotsHit = 0
	score = 0
return


PlayerUpdate:
	//print(score)
	moveX = 0
	moveY = 0
	moveSpeed = 7
	timeSurvived# = timer()
	if (canDash = 0)
		if (timer()-dashTimer# > dashCoolDown#)
			canDash = 1
			dashTimer# = timer()
		else
			//print(timer()-dashTimer#)
		endif
	else
		dashTimer# = timer()
	endif
	if (canShoot = 0)
		if (timer()-shootTimer# > shootCoolDown#)
			canShoot = 1
			shootTimer# = timer()
		else
			//print(timer()-shootTimer#)
		endif
	else
		shootTimer# = timer()
	endif

	/*if (GetRawKeyState(KEY_W) = 1)
		moveY = -1
	endif
	if (GetRawKeyState(KEY_S) = 1)
		moveY = 1
	endif*/
	if (GetRawKeyState(KEY_A) = 1)
		moveX = -1
	endif
	if (GetRawKeyState(KEY_D) = 1)
		moveX = 1
	endif
	if (GetRawKeyState(KEY_SHIFT) = 1)
		moveSpeed = 13
	endif
	if (GetRawKeyPressed(KEY_CONTROL) and canDash = 1)
		moveSpeed = 100
		canDash = 0
	endif
	if (GetRawKeyPressed(KEY_SPACE) and canShoot = 1 and ammo > 0)
		entities.insert(CreateBullet(entities[playerID], white, placeHolderBulletSprite))
		shotsFired = shotsFired + 1
		ammo = ammo - 1
		canShoot = 0
	endif
	entities[playerID].x = entities[playerID].x + (moveX * moveSpeed)
	entities[playerID].y = entities[playerID].y + (moveY * moveSpeed)
return
