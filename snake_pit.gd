extends Node2D


#var Snake_head = preload("res://Snake_head.gd")
@export var HeadScene: PackedScene

@export var TailScene_01: PackedScene
@export var TailScene_02: PackedScene
@export var TailScene_03: PackedScene

@export var WallScene_01: PackedScene
@export var WallScene_02: PackedScene
@export var WallScene_03: PackedScene

@export var FoodScene_01: PackedScene
@export var FoodScene_02: PackedScene

@export var FloorScene_01: PackedScene
@export var FloorScene_02: PackedScene
@export var FloorScene_03: PackedScene

signal pit_need_to_destroyed

var head = null
var snake_tails = []
var floor_tiles = []
var free_floor_tiles = []

var direction = Vector2.ZERO
#var direction = Vector2(0, 0)
var target_position = Vector2.ZERO


enum MOVE {HORIZONTAL, VERTICAL}
var CURRENT_DIR = MOVE.VERTICAL
var AVAIBLE_TURN = true



# Called when the node enters the scene tree for the first time.
func _ready():
	if G.DEBUG:
		$Debug_labels.show()
	$Time_step.set_wait_time(G.TIME_STEP)
	draw_walls()
	draw_floor()
	head = HeadScene.instantiate()
	head.set_position(Vector2(96, 96))
	add_child(head)
#	button.button_down.connect(_on_button_down)
#	This is Alfa function !!!
	head.head_collision.connect(on_head_collision)
	head.get_some_food.connect(on_get_some_food)
	drop_new_food()
	drop_new_food()
	
	direction.y = G.STEP # Temporary


func _input(event):
	if event is InputEventScreenDrag and AVAIBLE_TURN:
		if G.DEBUG:
			$Debug_labels/Rel.set_text(str(event.get_relative()))
		match CURRENT_DIR:
			MOVE.VERTICAL:
				if event.get_relative().x > G.DIRECTION_RELATIVE:
					direction = Vector2(G.STEP, 0)
					AVAIBLE_TURN = false
					CURRENT_DIR = MOVE.HORIZONTAL
				elif event.get_relative().x < -G.DIRECTION_RELATIVE:
					direction = Vector2(-G.STEP, 0)
					AVAIBLE_TURN = false
					CURRENT_DIR = MOVE.HORIZONTAL
			MOVE.HORIZONTAL:
				if event.get_relative().y < -G.DIRECTION_RELATIVE:
					direction = Vector2(0, -G.STEP)
					AVAIBLE_TURN = false
					CURRENT_DIR = MOVE.VERTICAL
				elif event.get_relative().y > G.DIRECTION_RELATIVE:
					direction = Vector2(0, G.STEP)
					AVAIBLE_TURN = false
					CURRENT_DIR = MOVE.VERTICAL


func draw_walls():
	var wall
	# i fom 0 to 12
	for i in range(0, 13):
		wall = choose_wall()
		wall.set_position(Vector2(G.STEP * i, 0))
		if G.DEBUG:
			wall.show_num(i) # For debug
		add_child(wall)
		wall = choose_wall()
		wall.set_position(Vector2(G.STEP * i, G.STEP * 20))
		add_child(wall)
		
	# y from 1 to 19
	for y in range(1, 20):
		wall = choose_wall()
		wall.set_position(Vector2(0, G.STEP * y))
		if G.DEBUG:
			wall.show_num(y) # For debug
		add_child(wall)
		wall = choose_wall()
		wall.set_position(Vector2(G.STEP * 12, G.STEP * y))
		add_child(wall)


func choose_wall():
	var i = randi() % 21
	if i < 10:
		return WallScene_01.instantiate()
	elif i > 15:
		return WallScene_02.instantiate()
	else:
		return WallScene_03.instantiate()


func draw_floor():
	for i in range (1, 12):
		for y in range (1, 20):
			var floor_tail = choose_floor()
			floor_tail.set_position(Vector2(i * G.STEP, y * G.STEP))
			add_child(floor_tail)
	floor_tiles = get_tree().get_nodes_in_group("floor")
#	print("Total floor tiles: " + str(floor_tiles.size()))


func choose_floor():
	var i = randi() % 21
	if i < 10:
		return FloorScene_01.instantiate()
	elif i > 15:
		return FloorScene_02.instantiate()
	else:
		return FloorScene_03.instantiate()


func get_free_space():
	free_floor_tiles = []
	for floor_tile in floor_tiles:
		if floor_tile.has_method("is_overlaps"):
			if not floor_tile.is_overlaps():
				free_floor_tiles.append(floor_tile)
	if G.DEBUG:
		print("Free_tiles: " + str(free_floor_tiles.size()))


func drop_new_food():
	get_free_space()
	if free_floor_tiles.size() > 1:
		free_floor_tiles.shuffle()
		var food = choose_food()
		food.set_position(free_floor_tiles[0].get_position())
		call_deferred("add_child", food)


func drop_new_food_old():
	# not using in game
	# see drop_new_food():
	var food = choose_food()
	# get x_pos from 1 to 19 (* 32)
	var x_pos = (randi() % 11 + 1) * G.STEP
	# get y_pos from 1 to 29 (* 32)
	var y_pos = (randi() % 19 + 1) * G.STEP
	food.set_position(Vector2(x_pos, y_pos))
#	Need deffered call
#	add_child(food)
	call_deferred("add_child", food)


func choose_food():
	var i = randi() % 21
	if i <=10:
		return FoodScene_01.instantiate()
	else:
		return FoodScene_02.instantiate()


func add_new_tail():
	var tail = choose_tail()
	tail.set_position(target_position)
	call_deferred("add_child", tail)
	snake_tails.append(tail)
	if G.DEBUG:
		tail.show_num(snake_tails.size())


func choose_tail():
	var i = randi() % 21
	if i < 10:
		return TailScene_01.instantiate()
	elif i > 15:
		return TailScene_03.instantiate()
	else:
		return TailScene_03.instantiate()


func snake_move():
	target_position = head.get_position()
	head.set_position(head.get_position() + direction)
	for tail in snake_tails:
		var old_position = tail.get_position()
		tail.set_position(target_position)
		target_position = old_position
	AVAIBLE_TURN = true

func on_head_collision():
	emit_signal("pit_need_to_destroyed")


func on_get_some_food():
	G.update_score()
	get_parent().redraw_score_label()
	add_new_tail()
	drop_new_food()


func _on_time_step_timeout():
	if not G.game_paused:
		snake_move()
