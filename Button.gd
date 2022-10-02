extends Area2D


export (NodePath) var collapsibleNodePath
export (NodePath) var collapsibleNodePath2
var collapsibleNode
var collapsibleNode2
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pressed = preload("res://asset/graphics-source_files/button_pressed.png")
var unpressed = preload("res://asset/graphics-source_files/button_unpressed.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	collapsibleNode = get_node(collapsibleNodePath)
	if is_instance_valid(collapsibleNode) && collapsibleNode.has_method("addButtonNeeded"):
		collapsibleNode.addButtonNeeded()
	if (collapsibleNodePath2):
		collapsibleNode2 = get_node(collapsibleNodePath2)
		if is_instance_valid(collapsibleNode2) && collapsibleNode2.has_method("addButtonNeeded"):
			collapsibleNode2.addButtonNeeded()
	pass # Replace with function body.

onready var sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate():
	sprite.texture = pressed
	if is_instance_valid(collapsibleNode) && collapsibleNode.has_method("setButtonActive"):
		collapsibleNode.setButtonActive(+1)
	if is_instance_valid(collapsibleNode2) && collapsibleNode2.has_method("setButtonActive"):
		collapsibleNode2.setButtonActive(+1)

func deactivate():
	sprite.texture = unpressed
	print(collapsibleNode)
	if is_instance_valid(collapsibleNode) && collapsibleNode.has_method("setButtonActive"):
		collapsibleNode.setButtonActive(-1)
	if is_instance_valid(collapsibleNode2) && collapsibleNode2.has_method("setButtonActive"):
		collapsibleNode2.setButtonActive(-1)
		


func _on_Button_body_entered(_body):
	activate()
	pass # Replace with function body.


func _on_Button_body_exited(_body):
	deactivate()
	pass # Replace with function body.
