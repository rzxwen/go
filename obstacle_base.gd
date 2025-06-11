extends Area2D

var player

func _ready():
	player = get_node("/root/main/Player")
	#player = find_parent("main").find_child("Player")
	player.ascend.connect(descend)

func _process(delta):
	if self.position.y > 600:
		print("LEAVING")
		queue_free()

func descend():
	print("descending")
	self.position.y = self.position.y + 64
