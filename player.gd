extends CharacterBody2D

const speed = 100
var current_dir = "none"
var max_health = 100
var health = 100
var enemy_inattack_range = false
var attack_cooldown = true
var player_alive = true
var new_scene = preload("res://death.tscn")

func _physics_process(delta):
	player_movement(delta)
	update_health()
	enemy_attack()
	if health <= 0:
		player_alive = false
		health = 0
		get_tree().change_scene_to_file("res://death.tscn")
	if velocity.x or velocity.y > 0:
		var isplaying = $walking_sound.playing
		if isplaying == false:
			$walking_sound.play()
	else: 
		$walking_sound.stop()
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_animation(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_animation(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
	
func play_animation(movement):
	var dir = current_dir
	var animation = $AnimatedSprite2D
	
	if dir == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
				animation.play("side_idle")
	if dir == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("side_walk")
		elif movement == 0:
				animation.play("side_idle")
	if dir == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("down_walk")
		elif movement == 0:
				animation.play("idle")
	if dir == "up":
		animation.flip_h = true
		if movement == 1:
			animation.play("top_walk")
		elif movement == 0:
				animation.play("top_idle")


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
		

func _on_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false


#enemy attacking
func enemy_attack():
	if enemy_inattack_range == true and attack_cooldown == true:
		attack_cooldown = false
		$attack_cooldown
		health -= 10


func _on_attack_cooldown_timeout():
	attack_cooldown = true

func restore_health(amount):
	health += amount
	if health > max_health:
		health = max_health
	print("Health restored! Current health:", health)
