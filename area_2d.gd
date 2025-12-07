extends Area2D

var in_area : bool = false
var Dialoug : bool = false
var label : int = 0
@onready var dialougs:Array = $CanvasLayer/ColorRect/Label/dialougs.dialougs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("E") and in_area:
		Dialoug = true
		$CanvasLayer/ColorRect/AnimationPlayer.play("new_animation")
		pass
		
	pass
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		in_area = true
		$AnimationPlayer.play("animation")
		$Label.text = "press E to talk"
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		in_area = false
		$AnimationPlayer.play_backwards("animation")
		$Label.text = ""
	pass # Replace with function body.
	pass # Replace with function body.


func _on_button_pressed() -> void:
	if Dialoug and dialougs.size() >= label:
		print(label)
		$CanvasLayer/ColorRect/Label/AnimationPlayer.play("new_animation")
		$CanvasLayer/ColorRect/Label.text = dialougs.get(label)
		label += 1
		if dialougs.size() == label:
			Dialoug = false
			$CanvasLayer/ColorRect/AnimationPlayer.play_backwards("new_animation")
			pass
		pass
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	Dialoug = false
	$CanvasLayer/ColorRect/AnimationPlayer.play_backwards("new_animation")
	pass # Replace with function body.
