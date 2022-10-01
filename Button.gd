extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pressed = preload("res://asset/graphics-source_files/button_pressed.png")
var unpressed = preload("res://asset/graphics-source_files/button_unpressed.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate():
	sprite.texture = pressed

func deactivate():
	sprite.texture = unpressed


func _on_Button_body_entered(body):
	activate()
	pass # Replace with function body.


func _on_Button_body_exited(body):
	deactivate()
	pass # Replace with function body.
