extends Area2D


var tile_size = 64
var inputs = {"player_right": Vector2.RIGHT,
			"player_left": Vector2.LEFT,
			"player_up": Vector2.UP,
			"player_down": Vector2.DOWN}

func _ready():
#	position = position.snapped(Vector2.ONE * tile_size)
#	position += Vector2.ONE * tile_size/2
	pass

func _process(_delta):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(dir)
			
onready var ray = $RayCast2D

onready var initial_position = position

func global_reset():
	tween.stop_all()
	position = initial_position

signal won

func win():
	emit_signal("won")

func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	var collider = ray.get_collider()
	if collider != null:
		if collider.has_method('being_pushed'):
			collider.being_pushed(inputs[dir], tile_size)
	if !ray.is_colliding():
		move_tween(dir)
		
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
