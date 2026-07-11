extends Node2D

var direcction = Vector2.ZERO
var rapidez = 400
var radio_enemigo = 30
var damage

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var enemigos = get_tree().get_nodes_in_group("Enemigos")
	var desplazamiento = (direcction * rapidez) * delta
	for enemigo in enemigos:
		var distancia_futura = (desplazamiento + global_position).distance_to(enemigo.position)
		if distancia_futura < radio_enemigo:
			enemigo.ataque_recibido(damage)
			queue_free()
			return
	position += desplazamiento
	

func atack(d, direccion):
	direcction = direccion
	damage = d


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await get_tree().create_timer(5.0).timeout
	queue_free()
