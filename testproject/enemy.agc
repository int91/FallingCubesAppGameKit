
EnemyInit:
	enemySpawn# = timer()
	waveTimer# = timer()
	canSpawn = 0
	nextWave = 0
	curWave = 1
	curTime# = 0.4
return

EnemyUpdate:
	/*(curTime#)
	print(curWave)
	print(entities.length)*/
	for q = 1 to entities.length
		if (entities[q].spawned = 1 and entities[q].tag = "enemy")
			entities[q].y = entities[q].y + 10
			SetSpritePosition(entities[q].sprite, entities[q].x, entities[q].y)
			SetSpriteAngle(entities[q].sprite, 180)
			if (GetSpriteCollision(entities[q].sprite, entities[playerID].sprite))
				playerLives = playerLives - 1
				entities[q].spawned = 0
			endif
			if (entities[q].y > windowSizeY)
				entities[q].spawned = 0
				select curWave
					case 1:
						score = score + 10
					endcase
					case 2:
						score = score + 15
					endcase
					case 3:
						score = score + 20
					endcase
					case 4:
						score = score + 25
					endcase
					case 5:
						score = score + 30
					endcase
					case 6:
						score = score + 35
					endcase
					case 7:
						score = score + 40
					endcase
					case 8:
						score = score + 45
					endcase
					case 9:
						score = score + 50
					endcase
					case 10:
						score = score + 100
					endcase
				endselect
			endif
		elseif (entities[q].spawned = 0 and entities[q].tag = "enemy")
			DestroyEnemy(q)
		endif
	next q
	//Wave handler
	if (canSpawn = 0)
		if (timer()-enemySpawn# > curTime#)
			canSpawn = 1
			enemySpawn# = timer()
			CreateEnemy(red, placeHolderBoxSprite)
			canSpawn = 0
		endif
	else
		enemySpawn# = timer()
	endif
	if (nextWave = 0 and curWave > 0)
		if (timer()-waveTimer# > 1 * curWave)
			nextWave = 1
			waveTimer# = timer()
			curWave = curWave + 1
			if (curWave > 6)
				curTime# = curTime# - 0.01
			else
				curTime# = curTime# - 0.05
			endif
			nextWave = 0
		endif
	else
		waveTimer# = timer()
	endif
return

function CreateEnemy(color as Color, sprite)
	enC as entity
	enC.sizeX = 32
	enC.sizeY = 32
	enC.x = round(random(enC.sizeX, 1024 - enC.sizeX))
	enC.y = round(random(-64, 0))
	enC.spawned = 1
	enC.tag = "enemy"
	enC.sprite = CreateSprite(sprite)
	enC.color = color
	entities.insert(enC)
	enC.id = entities.length
	SetSpritePosition(enC.sprite, enC.x, enC.y)
	SetSpriteColor(enC.sprite, enC.color.r, enC.color.g, enC.color.b, 255)
endfunction

function DestroyEnemy(enemyIndex as integer)
	DestroyEntity(enemyIndex)
endfunction
