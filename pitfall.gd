extends "res://obstacle_base.gd"

var timer

signal trip


func _ready():
	super()
	timer = get_node("/root/main/Timer")
	

func _process(delta):
	if self.overlaps_body(player):
		trip.emit()
		print("pit")
		player.canMove = false
		player.find_child("AnimatedSprite2D").set_animation("dizzy")
		timer.start()
		queue_free()
	super(delta)
	

func descend():
	super()
