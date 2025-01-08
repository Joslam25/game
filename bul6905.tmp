extends Node2D

const speed: int = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * speed * delta



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("zombies"):
		queue_free()
