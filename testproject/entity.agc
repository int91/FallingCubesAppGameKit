
type entity
		x as integer
		y as integer
		sizeX as integer
		sizeY as integer
		spawned as integer
		tag as string
		id as integer
		sprite as integer
		color as Color
endtype


EntityInit:
	#constant maxEntities = 10000
	global entities as entity[0]
	/*for i = 1 to entities.length
		DestroyEntity(i)
	next i*/
return

function DrawEntity(x, y, sprite, color as Color, fill)
	SetSpritePosition(sprite, x, y)
	SetSpriteColor(sprite, color.r, color.g, color.b, 255)
	//DrawBox(x, y, x + 32, y + 32, color, color, color, color, fill)
endfunction

DrawEntities:
	for i = 1 to entities.length
		if (entities[i].spawned = 1)
			SetSpritePosition(entities[i].sprite, entities[i].x, entities[i].y)
			SetSpriteColor(entities[i].sprite, entities[i].color.r, entities[i].color.g, entities[i].color.b, 255)
			//DrawEntity(entities[i].x, entities[i].y, MakeColor(cyan.r, cyan.g, cyan.b), 1)
		endif
	next i
return

function CreateEntity(xPos, yPos, sizeX, sizeY, sprite, tag as string, id as integer, Color as Color)
	if (entities.length < maxEntities)
		entityToInsert as entity
		entityToInsert.sizeX = sizeX
		entityToInsert.sizeY = sizeY
		entityToInsert.x = xPos
		entityToInsert.y = yPos
		entityToInsert.spawned = 1
		entityToInsert.tag = tag
		entityToInsert.id = id
		entityToInsert.sprite = CreateSprite(sprite)
		entityToInsert.color = Color
		SetSpriteDepth(entityToInsert.sprite, 11)
		SetSpritePosition(entityToInsert.sprite, entityToInsert.x, entityToInsert.y)
		entities.insert(entityToInsert)
	endif
endfunction

function DestroyEntity(entityIndex as integer)
	DeleteSprite(entities[entityIndex].sprite)
	entities.remove(entityIndex)
endfunction

//Old Create Entity Function (Don't wanna delete for sake of possibly fixing bugs in the future
/*for i = 1 to maxEntities
	if (entities[i].spawned = 0)
		entities[i].sizeX = sizeX
		entities[i].sizeY = sizeY
		entities[i].x = xPos
		entities[i].y = yPos
		entities[i].spawned = 1
		entities[i].tag = tag
		entities[i].id = id
		exit
	endif
	next i*/
