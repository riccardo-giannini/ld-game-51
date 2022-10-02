extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var buttonNeeded = 0
var buttonActive = 0

func collapse():
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func addButtonNeeded():
	buttonNeeded += 1

func setButtonActive(button):
	buttonActive += button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if buttonNeeded > 0:
		if buttonActive == buttonNeeded:
			print('foo')
			collapse()
	pass
