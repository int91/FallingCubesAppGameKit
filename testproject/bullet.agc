
BulletUpdate:
	for q = 1 to entities.length
		if (entities[q].spawned = 1 and entities[q].tag = "bullet")
			entities[q].y = entities[q].y - 10
			SetSpritePosition(entities[q].sprite, entities[q].x, entities[q].y)
			SetSpriteAngle(entities[q].sprite, 180)
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
			if (entities[q].y < 0)
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
