
#include "entity.agc"
#include "bullet.agc"


//TODO: Convert to function and get player data type
PlayerInit:
	player as entity
	player.sizeX = 32
	player.sizeY = 32
	player.pos.x = (windowSizeX / 2) + (player.sizeX / 2) //Places player at center of screen
	player.pos.y = 696
	player.spawned = 1
	player.tag = "player"
	player.sprite = CreateSprite(placeHolderBoxSprite)
	player.color = neowhite
	player.angle = 0
	playerID = entities.length + 1
	playerLives = 3
	entities.insert(player)
	
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

PlayerUpdate: //TODO: Convert this to a proper function
	
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

	moveX = 0
	moveSpeed = 600
	if (GetRawKeyPressed(KEY_SPACE) and canShoot = 1 and ammo > 0)
		entities.insert(CreateBullet(entities[playerID], white, placeHolderBulletSprite))
		shotsFired = shotsFired + 1
		ammo = ammo - 1
		canShoot = 0
	endif
	if (GetRawKeyState(KEY_SHIFT) = 1)
		moveSpeed = 900
	endif
	if (GetRawKeyPressed(KEY_CONTROL) and canDash = 1)
		moveSpeed = 10000
		canDash = 0
	endif
	if (GetRawKeyState(KEY_A) = 1)
		moveX = -1
	elseif (GetRawKeyState(KEY_D) = 1)
		moveX = 1
	endif
	if (player.pos.x + (moveX * moveSpeed * GetFrameTime()) < 6) or ((player.pos.x + player.sizeX) + (moveX * moveSpeed * GetFrameTime()) > windowSizeX-6)
		moveX = 0
	endif
	player.pos.x = player.pos.x + (moveX * moveSpeed * GetFrameTime())
	
	SetEntity(playerID, player)
return
