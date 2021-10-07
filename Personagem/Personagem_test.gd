extends KinematicBody2D

var veloc = Vector2(64, 64) # Move 128 pixels por segundo
var pos_click = null

func _input(event):
	if event.is_action_pressed("Movi_person"):
		pos_click = get_viewport().get_mouse_position()

func _physics_process(_delta):
	if pos_click:
		var direcao = (pos_click - global_position)
		
		if direcao.length() < 3:
			return
	
		var per_direc = move_and_slide(direcao.normalized() * veloc)
		
		if per_direc.x > per_direc.y && per_direc.x < -per_direc.y:
			$AnimationPlayer.play("Mover_Cima")
		elif per_direc.x < per_direc.y && per_direc.x > -per_direc.y:
			$AnimationPlayer.play("Mover_Baixo")
		else:
			if per_direc.x > 0:
				$AnimationPlayer.play("Mover_Direita")
			else:
				$AnimationPlayer.play("Mover_Esquerda")
