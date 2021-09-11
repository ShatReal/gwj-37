extends Node


export(PackedScene) var game_scene


func _ready() -> void:
	$UI/HBox/VBox/Start.grab_focus()


func _on_start_pressed() -> void:
	get_tree().change_scene_to(game_scene)


func _on_meta_clicked(meta) -> void:
	OS.shell_open(meta)
