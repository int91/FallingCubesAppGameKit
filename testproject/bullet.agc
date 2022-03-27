
function CreateBullet(pla as entity, color as Color, sprite)
	buL as entity
	buL.sizeX = 8
	buL.sizeY = 16
	buL.pos.x = pla.pos.x + (pla.sizeX / 2) - (buL.sizeX / 2)
	buL.pos.y = pla.pos.y - 8
	buL.spawned = 1
	buL.tag = "bullet"
	buL.sprite = CreateSprite(sprite)
	buL.color = color
	//ent.insert(buL)
	buL.id = entities.length + 1
	SetSpritePosition(buL.sprite, buL.pos.x, buL.pos.y)
	SetSpriteColor(buL.sprite, buL.color.r, buL.color.g, buL.color.b, 255)
endfunction buL

BulletUpdate:
	for q = 0 to entities.length
		if (entities[q].spawned = 1 and entities[q].tag = "bullet")
			entities[q].pos.y = entities[q].pos.y - (900 * GetFrameTime())
			for w = 1 to entities.length
				if (entities[w].spawned = 1 and entities[w].tag = "enemy")
					if (GetSpriteCollision(entities[q].sprite, entities[w].sprite))
						entities[w].spawned = 0
						entities[q].spawned = 0
						shotsHit = shotsHit + 1
						score = score + 5
					endif
				endif
			next w
			if (entities[q].pos.y < 0)
				entities[q].spawned = 0
			endif
		elseif (entities[q].spawned = 0 and entities[q].tag = "bullet")
			DestroyBullet(q)
		endif
	next q
return

function DestroyBullet(bulletIndex as integer)
	DestroyEntity(bulletIndex)
endfunction
