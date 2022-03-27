
type mouse
	x as float
	y as float
endtype

function SnapToGrid(value as integer, gridSize as integer)
	snapTo = floor(value / gridSize) * gridSize
	toSnapTo = Round(snapTo)
endfunction toSnapTo

function DistanceTo(startX, startY, targetX, targetY)
	xDis = (targetX - startX)
	yDis = (targetY - startY)
	distance = sqrt((xDis * xDis) + (yDis * yDis))
endfunction distance

