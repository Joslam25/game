extends CharacterBody2D
var speed = 300
var player_chase = false
var playerbody = null

func _ready():
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	move_and_slide()
	if player_chase:
		if (playerbody.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = false
		elif (playerbody.position.x - position.x) > 0:
			$AnimatedSprite2D.flip_h = true
		position += (playerbody.position - position)/speed
		
		$AnimatedSprite2D.play("walk")

	else:
		$AnimatedSprite2D.play("idle")


#player entering detection zone
func _on_detection_area_body_entered(body):
	if body.name == "player":
		playerbody = body
		player_chase = true



#player exting detection zone
func _on_detection_area_body_exited(body):
	if body.name == "player":
		playerbody = null
		player_chase = false


func _on_area_2d_2_area_entered(area: Area2D) -> void:
	if area.name == "bullet":
		queue_free()
