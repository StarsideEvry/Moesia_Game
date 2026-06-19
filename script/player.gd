extends CharacterBody2D

var player_current_speed = 100
var player_current_state

@export var inventory: Inventory

func _physics_process(_delta):

	#player input for direction
	var direction_input = Input.get_vector("go_left", "go_right", "go_up", "go_down")
	
	#checking for input to move
	if direction_input.x == 0 and direction_input.y == 0:
		player_current_state = "idle"
	elif direction_input.x != 0 or direction_input.y != 0:
		player_current_state = "walking"
	
	#The move speed for player
	velocity = direction_input * player_current_speed
	move_and_slide()
	
	play_anim(direction_input)

func play_anim(dir):
	#Plays coresponding animations to our current state
	if player_current_state == "idle":
		$AnimatedSprite2D.play("idle_south")
	if player_current_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("walk_north")
		if dir.x == 1:
			$AnimatedSprite2D.play("walk_east")
		if dir.y == 1:
			$AnimatedSprite2D.play("walk_south")
		if dir.x == -1:
			$AnimatedSprite2D.play("walk_west")
