extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var initial_position = global_position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

onready var i_am_being_pushed = false
onready var being_pushed_destination
onready var can_be_pushed = true
onready var my_dir
onready var my_tile_size

func global_reset():
	queue_free()

func being_pushed(dir, tile_size):
	my_dir = dir
	my_tile_size = tile_size
	if can_be_pushed:
		being_pushed_destination = position + (my_dir * my_tile_size)
		i_am_being_pushed = true
	can_be_pushed = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if i_am_being_pushed:
		var box_ray = $RayCast2D
		box_ray.cast_to = my_dir * my_tile_size
		box_ray.force_raycast_update()
		if !box_ray.is_colliding():
			position = lerp(position, being_pushed_destination, 1)
		if position.is_equal_approx(being_pushed_destination) || box_ray.is_colliding():
			being_pushed_destination = null
			i_am_being_pushed = false
			can_be_pushed = true
	
	pass
