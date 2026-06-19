extends Area2D

var entered = false

func _on_body_entered(_body: Node2D):
	if _body is CharacterBody2D:
		entered = true

func _on_body_exited(_body: Node2D):
	if _body is CharacterBody2D:
		entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("Change Level"):
			get_tree().change_scene_to_file("res://scene/game_level_forest.tscn")
