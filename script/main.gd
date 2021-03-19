extends Node2D

var x1 : int
var x2 : int
var y1 : int
var y2 : int
var deltaX : int
var deltaY : int
var step : int
var x_inc : float
var y_inc : float
var x_next
var y_next

func _ready():
	#$TileMap.set_cell(5,5,0)
	#$debug/Label.text = str("Titik : \n" , $TileMap.get_used_cells_by_id(0)) 
	$Option.add_item("DDA", 0)
	$Option.add_item("Bresenhem", 1)
	
	

func _on_Button_pressed():
	x1 = int($coordA/x1.text)
	y1 = int($coordA/y1.text)
	x2 = int($coordB/x2.text)
	y2 = int($coordB/y2.text)
	clear_text_input()
	clear_cell()
	dda(x1,x2,y1,y2)
	debug()

func debug():
	
	$debug/Label.text = str("Titik : \n", $TileMap.get_used_cells_by_id(0))


func clear_text_input():
	$coordA/x1.clear()
	$coordA/y1.clear()
	$coordB/x2.clear()
	$coordB/y2.clear()

func dda(x1:int, x2:int, y1:int, y2:int):
	$TileMap.set_cell(x1,y1,0)
	deltaX = abs(x2 - x1)
	deltaY = abs(y2 - y1)
	if deltaX > deltaY : 
		step = deltaX
	else : 
		step = deltaY
	x_inc = float(deltaX)/step
	y_inc = float(deltaY)/step
	x_next = int(round(float(x1)+x_inc))
	y_next = int(round(float(y1)+y_inc))
	
	while(true) : 
		$TileMap.set_cell(x_next, y_next, 0)
		if x_next == x2 and y_next == y2 : 
			break
		x_next += int(round(x_inc))
		y_next += int(round(y_inc))
	

func clear_cell():
	var data = $TileMap.get_used_cells_by_id(0)
	for item in data : 
		$TileMap.set_cell(item[0],item[1], 1)
