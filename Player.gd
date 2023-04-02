extends KinematicBody2D


var speedMAX:int = 450
var accel:int = 100
var gravity:float = 1400.0
var jump:float = 600.0
var velocity:Vector2
func _physics_process(delta):
	
	#Player Movement
	if Input.is_action_pressed("ui_left"):
		velocity.x = max(velocity.x - accel,-speedMAX)
	elif Input.is_action_pressed("ui_right"):
		velocity.x = min(velocity.x + accel,speedMAX)
	else:
		velocity.x = lerp(velocity.x, 0, 0.2)
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = -jump
	if Input.is_action_just_pressed("shoot"):
		recoil(500)
	move_and_slide(velocity, Vector2.UP)
	
func recoil(strength):
	var mousepos = get_local_mouse_position()
	velocity = -mousepos.normalized() * strength
