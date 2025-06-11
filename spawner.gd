extends Node2D

var player
#var spawnList
var scene
var instance
var powerUp
var roll

var rng = RandomNumberGenerator.new()


func _ready():
	scene = preload("res://obstacle.tscn")
	player = get_node("/root/main/Player")
	#spawnList = get_node("/root/main/Obstacles")
	powerUp = preload("res://power_up.tscn")
	player.ascend.connect(descend)

func _process(delta):
	if Input.is_action_just_pressed("space"):
		instance = scene.instantiate()
		add_child(instance)
		

func descend():
	if get_child_count(true) < 2:
		print("READY TO BIRTH")
		roll = rng.randi_range(1,6)
		if roll >= 5:
			print("spawning")
			instance = scene.instantiate()
			add_child(instance)
		elif roll <= 1:
			instance = powerUp.instantiate()
			add_child(instance)
