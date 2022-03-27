
type Vector2
	x as integer
	y as integer
endtype

type entity
		pos as Vector2
		sizeX as integer
		sizeY as integer
		angle as float
		
		
		tag as string
		id as integer
		sprite as integer
		color as Color
		
		spawned as integer
endtype


EntityInit:
	#constant maxEntities = 10000
	global entities as entity[0]
	/*for i = 1 to entities.length
		DestroyEntity(i)
	next i*/
return

function DrawEntity(e as entity)
	SetSpritePosition(e.sprite, e.pos.x, e.pos.y)
	SetSpriteColor(e.sprite, e.color.r, e.color.g, e.color.b, 255)
	SetSpriteAngle(e.sprite, e.angle)
endfunction

DrawEntities:
	for i = 0 to entities.length
		if (entities[i].spawned = 1)
			DrawEntity(entities[i])
		endif
	next i
return

function CreateEntity(xPos, yPos, sizeX, sizeY, sprite, tag as string, id as integer, Color as Color)
	if (entities.length < maxEntities)
		entityToInsert as entity
		entityToInsert.sizeX = sizeX
		entityToInsert.sizeY = sizeY
		entityToInsert.pos.x = xPos
		entityToInsert.pos.y = yPos
		entityToInsert.spawned = 1
		entityToInsert.tag = tag
		entityToInsert.id = id
		entityToInsert.sprite = CreateSprite(sprite)
		entityToInsert.color = Color
		SetSpriteDepth(entityToInsert.sprite, 11)
		SetSpritePosition(entityToInsert.sprite, entityToInsert.pos.x, entityToInsert.pos.y)
		entities.insert(entityToInsert)
	endif
endfunction

function DestroyEntity(entityIndex as integer)
	DeleteSprite(entities[entityIndex].sprite)
	entities.remove(entityIndex)
endfunction

function GetEntity(index as integer)
	ent as entity
	ent = entities[index]
endfunction ent

function SetEntity(index as integer, e as entity)
	entities[index] = e
endfunction
