extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var initial_position = position

onready var box = preload("res://Box.tscn")

func spawn():
	var box_instance = box.instance()
	box_instance.global_position = initial_position
	get_parent().call_deferred("add_child", box_instance)

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn()
	pass # Replace with function body.

func global_reset():
	spawn()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
