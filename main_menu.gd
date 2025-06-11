extends Node2D


func startGame():
	get_tree().change_scene_to_file("res://main.tscn")

func showTutorial():
	get_tree().change_scene_to_file("res://tutorial.tscn")
	

func showMenu():
	get_tree().change_scene_to_file("res://main_menu.tscn")
