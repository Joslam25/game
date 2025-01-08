extends Node2D


# Called when the node enters the scene tree for the first time.
var health_restore_amount = 20  # Amount of health restored


func _on_area_2d_body_entered(body: Node2D) -> void:
		if body.name == "player":  # Replace "Player" with your player's node name
			body.restore_health(20)  # Call player's restore health method
			queue_free()  # Remove the health pack after use
