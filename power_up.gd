# power_up.gd
extends Area2D

var player
var antlion

func _ready():
	# Find the player and antlion in the scene
	player = get_node("/root/main/Player")
	antlion = get_node("/root/main/Antlion")
	# Connect to the ascend signal so power-ups move with the world
	player.ascend.connect(descend)

func _process(delta):
	# Check if the power-up touches the player
	if self.overlaps_body(player):
		print("Power-up collected, boosting player up!")
		
		# check if the player can move up 2 blocks
		var target_position = player.position.y - 128
		
		# don't go above the playing field
		if target_position >= 71:
			# safe to move up 2 blocks
			player.position.y = target_position
			# signal twice 
			player.ascend.emit()
			player.ascend.emit()
		else:
			# if can't move full 2 blocks, move as far as we can
			# and only trigger ascend for each block we actually moved
			var blocks_moved = 0
			while player.position.y > 71 and blocks_moved < 2:
				player.position.y = player.position.y - 64
				player.ascend.emit()
				blocks_moved += 1
			
			if blocks_moved > 0:
				print("Boosted player up " + str(blocks_moved) + " block(s)")
		
		# remove the power-up after player picks it up	
		queue_free()
	
	# remove power-up if it goes off screen
	if self.position.y > 600:
		queue_free()

func descend():
	# move down with the rest of the world when player ascends
	self.position.y = self.position.y + 64
