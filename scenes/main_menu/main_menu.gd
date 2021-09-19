extends Node


export(PackedScene) var game_scene


func _on_meta_clicked(meta) -> void:
	OS.shell_open(meta)


func _on_play_pressed() -> void:
	get_tree().change_scene_to(game_scene)
