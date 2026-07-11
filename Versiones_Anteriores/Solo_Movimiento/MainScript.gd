extends Node2D

@export var enemigo_scena: PackedScene  
@export var cantidad_enemigos: int = 3
@export var tiempo_entre_spawns: float = 5.0

@onready var timer = $Timer  

func _ready():
	for i in range(cantidad_enemigos):
		spawnear_enemigo()
	
	timer.wait_time = tiempo_entre_spawns
	timer.timeout.connect(_spawnear_periodico)
	timer.start()


func spawnear_enemigo():
	var enemigo = enemigo_scena.instantiate()
	var viewport = get_viewport().get_visible_rect().size
	var margen = 50  

	var pos_x = randf_range(margen, viewport.x - margen)
	var pos_y = randf_range(margen, viewport.y - margen)
	
	enemigo.global_position = Vector2(pos_x, pos_y)
	add_child(enemigo)

func _spawnear_periodico():
	spawnear_enemigo()
