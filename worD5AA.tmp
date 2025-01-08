extends Node2D

var skinny = load("res://skinny.tscn")
var spawn_area_min = Vector2(0, 0)  # Top-left corner of the map
var spawn_area_max = Vector2(1000, 1000)  # Bottom-right corner of the map
var health_pack_scene = preload("res://healthpack.tscn")  # Path to your health pack scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_zombie()
	start_spawning()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_zombie():
	var zombie = skinny.instantiate()
	var rand = round(randf_range(1,4))
	print(rand)
	if rand == 1:
		zombie.position = Vector2(25,40)
		print("1")
	elif rand == 2:
		zombie.position = Vector2(25,220)
	elif rand == 3:
		zombie.position = Vector2(490,40)
	elif rand == 4:
		zombie.position = Vector2(490,220)
	add_child(zombie)
	
	await get_tree().create_timer(2.0).timeout
	spawn_zombie()
	
func start_spawning():
	$Timer.start()

func _spawn_health_pack():
	# Create and position a health pack randomly within the spawn area
	var health_pack = health_pack_scene.instantiate()
	var random_position = Vector2(
	randi() % int(480 - 20) + int(20),
	randi() % int(100 - 20) + int(20)
)
	health_pack.position = random_position
	add_child(health_pack)


func _on_timer_timeout() -> void:
	_spawn_health_pack()
