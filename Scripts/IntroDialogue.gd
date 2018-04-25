extends Area2D

onready var body = get_parent().get_parent().get_parent().get_node("Player")
onready var dialog = get_parent().get_parent().get_parent().get_node("DialogBox/RichTextLabel")
onready var dialog_parent = get_parent().get_parent().get_parent().get_node("DialogBox")
var entered = 0

func _ready():
	dialog_parent.hide()

func _process(delta):
	if overlaps_body(body):
		if Input.is_action_pressed("ui_z"):
			dialog_parent.show()
			dialog.talkingToPerson(true)
	else:
		dialog.talkingToPerson(false)
		dialog.page = 0
		dialog.set_visible_characters(0)
		dialog_parent.hide()