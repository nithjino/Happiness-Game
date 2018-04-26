extends Area2D

onready var body = get_parent().get_node("Player")
onready var tilemap = get_parent().get_node("Tilemaps/Floor")

func _on_Camera_body_shape_entered(body_id, body, body_shape, area_shape):
	var map_limits = tilemap.get_used_rect()
	var map_cellsize = tilemap.cell_size
	#body.camera_limits(map_cellsize,map_limits)
