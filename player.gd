extends CharacterBody2D

var prevPos
var canMove = true

signal ascend

func _ready():
	pass

func _process(delta):
	if canMove == true:
		if Input.is_action_just_pressed("moveLeft") && position.x > 263:
			prevPos = self.position
			self.position.x = self.position.x - 64
		if Input.is_action_just_pressed("moveRight") && position.x <519:
			prevPos = self.position
			self.position.x = self.position.x + 64
		if Input.is_action_just_pressed("moveUp"):
			if(self.position.y > 292):
				prevPos = self.position
				self.position.y = self.position.y - 64
			elif(self.position.y <= 292):
				ascend.emit()
		if Input.is_action_just_pressed("moveDown") && self.position.y <390:
			prevPos = self.position
			self.position.y = self.position.y + 64
	if canMove ==false:
		pass

func reenable():
	canMove = true
	find_child("AnimatedSprite2D").set_animation("default")
