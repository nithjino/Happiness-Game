extends RichTextLabel

var dialog = ["Hey! This is the demo for the Happiness Project!","Enter the temple to start.","You can enter by pressing 'z'"]
var page = 0
var talkingToPerson = false

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if ( ((event is InputEventKey and event.pressed and event.scancode == KEY_ENTER) or (event is InputEventScreenTouch)) and talkingToPerson):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	if talkingToPerson:
		set_visible_characters(get_visible_characters()+1)
		
func talkingToPerson(talking):
	talkingToPerson = talking
	
func reset():
	page = 0
	set_text("")
	set_visible_characters(0)
