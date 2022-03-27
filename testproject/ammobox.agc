
function CreateCrate(color as Color, sprite)
	ac as entity
	ac.sizeX = 8
	ac.sizeY = 16
	ac.pos.x = round(random(ac.sizeX, 1024 - ac.sizeX))
	ac.pos.y = round(random(-56, 0))
	ac.spawned = 1
	ac.tag = "ammopickup"
	ac.sprite = CreateSprite(sprite)
	ac.color = color
	ac.id = entities.length + 1
	SetSpritePosition(ac.sprite, ac.pos.x, ac.pos.y)
	SetSpriteColor(ac.sprite, ac.color.r, ac.color.g, ac.color.b, 255)
endfunction ac

AmmoboxInit:
spawnBoxTime# = round(random(5, 25))
spawnBoxTimer# = timer()
canSpawnBox = 1

AmmoboxUpdate:
	if (canSpawnBox = 0)
		if (timer()-spawnBoxTimer# > spawnBoxTime#)
			canSpawnBox = 1
			spawnBoxTimer# = timer()
		else
			//print(timer()-shootTimer#)
		endif
	else
		spawnBoxTimer# = timer()
		entities.insert(CreateCrate(white, placeHolderAmmoBoxSprite))
		spawnBoxTime# = round(random(5, 25))
		canSpawnBox = 0
	endif
	if (GetRawKeyPressed(KEY_3))
		entities.insert(CreateCrate(white, placeHolderAmmoBoxSprite))
	endif
	for q = 0 to entities.length
		if (entities[q].spawned = 1 and entities[q].tag = "ammopickup")
			entities[q].pos.y = entities[q].pos.y + (600 * GetFrameTime())
			if (GetSpriteCollision(entities[q].sprite, entities[playerID].sprite))
				entities[q].spawned = 0
				ammo = ammo + 3
				score = score + 10
			endif
			if (entities[q].pos.y > windowSizeY)
				entities[q].spawned = 0
			endif
		elseif (entities[q].spawned = 0 and entities[q].tag = "ammopickup")
			DestroyBox(q)
		endif
	next q
return

function DestroyBox(boxIndex as integer)
	DestroyEntity(boxIndex)
endfunction
