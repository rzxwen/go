extends Label
var score

func _ready():
	score = 0

func increase():
	print(score)
	score +=1
	text = "Score = "+ str(score)
