extends Area2D


var tile_size = 64
var inputs = {"player_right": Vector2.RIGHT,
			"player_left": Vector2.LEFT,
			"player_up": Vector2.UP,
			"player_down": Vector2.DOWN}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _process(_delta):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(dir)
		push_box(dir)
	
			
onready var ray = $RayCast2D

onready var box_being_pushed = null
onready var box_being_pushed_destination = null
onready var box_can_be_pushed = true

func win():
	print('congratulations, you won')

func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	var collider = ray.get_collider()
	if collider != null:
		if collider.is_in_group('pushable'):
			box_being_pushed = collider
			if box_can_be_pushed:
				box_being_pushed_destination = box_being_pushed.position + (inputs[dir] * tile_size)
			box_can_be_pushed = false
	if !ray.is_colliding():
		move_tween(dir)
		
func push_box(dir):
	if box_being_pushed:
		var box_ray = box_being_pushed.get_node("RayCast2D")
		box_ray.cast_to = inputs[dir] * tile_size
		box_ray.force_raycast_update()
		if !box_ray.is_colliding():
			box_being_pushed.position = lerp(box_being_pushed.position, box_being_pushed_destination, 1)
		if box_being_pushed.position.is_equal_approx(box_being_pushed_destination) || box_ray.is_colliding():
			box_being_pushed_destination = null
			box_being_pushed = null
			box_can_be_pushed = true
	
	
func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + inputs[dir] * tile_size,
		1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

onready var tween = $Tween

export var speed = 7


func _on_Player_area_entered(area):
	if area.is_in_group('victory'):
		win()
	pass # Replace with function body.
