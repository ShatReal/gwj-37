extends Node


export(PackedScene) var game_scene


func _ready() -> void:
	$UI/HBox/VBox/Start.grab_focus()


func _on_start_pressed() -> void:
	get_tree().change_scene_to(game_scene)


func _on_credits_pressed() -> void:
	$UI/Credits.popup_centered()
