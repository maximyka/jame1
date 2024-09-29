extends Node2D

func _ready() -> void:
	$Label.visible = Global.win
	GlobalWorldEnvironment.environment.adjustment_brightness = 0
	$AudioStreamPlayer.volume_db = -40
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(GlobalWorldEnvironment, 'environment:adjustment_brightness', 1, 1)
	tween.parallel().tween_property($AudioStreamPlayer, 'volume_db', -10, 0.5)
	await tween.finished

func Start_button() -> void:
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(GlobalWorldEnvironment, 'environment:adjustment_brightness', 0, 1)
	tween.parallel().tween_property($AudioStreamPlayer, 'volume_db', -40, 0.5)
	await tween.finished
	var mainscene = load("res://scenes/start_level_first.tscn")
	get_tree().change_scene_to_packed(mainscene)


func _on_quit_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(GlobalWorldEnvironment, 'environment:adjustment_brightness', 0, 1)
	tween.parallel().tween_property($AudioStreamPlayer, 'volume_db', -40, 0.5)
	await tween.finished
	Global.save_game()
	get_tree().quit()


func _on_credits_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(GlobalWorldEnvironment, 'environment:adjustment_brightness', 0, 1)
	tween.parallel().tween_property($AudioStreamPlayer, 'volume_db', -40, 0.5)
	await tween.finished
	var mainscene = load("res://scenes/UI/credits.tscn")
	get_tree().change_scene_to_packed(mainscene)
