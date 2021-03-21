extends Node2D

var x1 : int
var x2 : int
var y1 : int
var y2 : int




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
	var deltaX : int
	var deltaY : int
	var step : float
	var x_inc : float
	var y_inc : float
	var x_next : float
	var y_next : float
	
	
	deltaX = abs(x2 - x1)
	deltaY = abs(y2 - y1)
	
	print(deltaX,",", deltaY)
	
	if deltaX > deltaY : 
		step = deltaX
	else : 
		step = deltaY
	
	x_inc = deltaX/step
	y_inc = deltaY/step
	x_next = float(x1)
	y_next = float(y1)
	print("x  : ", x_next, "| x2 : ", x2)
	print("y  : ", y_next, "| y2 : ", y2)
	while(int(round(x_next)) != x2 || int(round(y_next)) != y2):
		$TileMap.set_cell(int(round(x_next)), int(round(y_next)), 0)
		x_next+=x_inc
		y_next+=y_inc
		print("x : " , int(round(x_next)),"\ny : ", int(round(y_next)))
	$TileMap.set_cell(int(round(x_next)), int(round(y_next)), 0)
	
func clear_cell():
	var data = $TileMap.get_used_cells_by_id(0)
	for item in data : 
		$TileMap.set_cell(item[0],item[1], 1)
