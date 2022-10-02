extends Timer

# NOTE: this timer MUST always be a direct child of the Level node
# so that it can access all other children and reset them


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ResetWorld_timeout():
	var siblings = get_parent().get_children()
	for sibling in siblings:
		if sibling.has_method('global_reset'):
			sibling.global_reset()
		pass
	pass # Replace with function body.
