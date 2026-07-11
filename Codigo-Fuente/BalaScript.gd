extends Node2D

var direcction = Vector2.ZERO #Direccion obtenida de la orientación del Robot.
var rapidez = 400 
var radio_enemigo = 30 #Distancia para infligir daño

var damage: int #Daño asignado por el Robot.


func _process(delta: float) -> void:
	#Obtener todos los nodos del grupo enemigos dentro del árbol de nodos.
	var enemigos = get_tree().get_nodes_in_group("Enemigos")
	#Movimiento usando la fórmula del mru directamente.
	#La dirección la recibimos normalizada.
	var desplazamiento = (direcction * rapidez) * delta
	#Calculamos la distancia de cada uno de los enemigos con respecto a la bala.
	for enemigo in enemigos:
		#Distancia
		#global_position para evitar errores en los cálculos ya que la bala es hijo del nodo Robot y el enemigo es hijo del rodo nodo raíz.
		var distancia_futura = (desplazamiento + global_position).distance_to(enemigo.position)
		#si la distancia es menor al radio del enemigo infligir daño y desaparecer.
		if distancia_futura < radio_enemigo:
			#Infligimos daño llamando a la función del enemigo llamada ataque_recibido().
			enemigo.ataque_recibido(damage)
			#Eliminamos la Bala de la escena
			queue_free()
			#Paramos el bucle.
			return
	# Si la distancia es mayor al radio de todos los enemigos entonces actualizamos nuestra posición.
	position += desplazamiento

#Funcion que recibe los parámetros necesarios para que la bala tenga dirección y daño.
func atack(_damage, direccion):
	direcction = direccion
	damage = _damage

#con esta función hacemos que la bala desaparezca automáticamente una vez haya salido dela cámara/pantalla y hayan pasado 5 segundos.
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	await get_tree().create_timer(5.0).timeout
	queue_free()
