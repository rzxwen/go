extends CharacterBody2D

var player
var speed
var ascentCount

func _ready():
	player = get_node("/root/main/Player")
	player.ascend.connect(descend)
	speed = 1
	ascentCount = 0

func _process(delta):
	self.velocity = Vector2(0,-1)
	self.velocity = self.velocity*speed
	move_and_collide(velocity*delta)
	if find_child("Area2D").overlaps_body(player):
		get_tree().change_scene_to_file("res://lose.tscn")

func descend():
	print("descending")
	if self.position.y <460:
		self.position.y = self.position.y + 8
	ascentCount += 1
	speed += ascentCount/80
