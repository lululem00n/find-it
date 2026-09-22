extends Node2D

@onready var tilemap = $"TileMapLayer Puente temporal"
@onready var collision = $StaticBody2D/CollisionShape2D

func _ready():
	while true:
		# Aparece durante 3 segundos
		tilemap.visible = true
		collision.disabled = false
		await get_tree().create_timer(3.0).timeout

		# Desaparece durante 2 segundos
		tilemap.visible = false
		collision.disabled = true
		await get_tree().create_timer(2.0).timeout
