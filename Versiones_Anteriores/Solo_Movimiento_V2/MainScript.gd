extends Node2D

@export var enemigo_scena: PackedScene 
@export var cantidad_enemigos: int = 3
@export var tiempo_entre_spawns: float = 5.0

@onready var timer = $Timer 

@export var score_label : Label 
 

func _ready():
	#Range devuelve un Array de 0 a n
	for i in range(cantidad_enemigos):
		#En cada Iteracion llama al funcion spawnear_enemigo()
		spawnear_enemigo()
	#Asignamos el tiempo entre spawns de enemigos
	timer.wait_time = tiempo_entre_spawns
	#Cuando el tiempo llegué a 0 llama a la funcion _spawnear_periodico()
	#En si conectamos la señal timeout a la funcion.
	timer.timeout.connect(_spawnear_periodico)
	#Iniciamos el timer solo una vez porque en el inspector desmarcamos one shot.
	timer.start()


func spawnear_enemigo():
	#Instancia la escena "Enemigo"
	var enemigo = enemigo_scena.instantiate()
#En está 2 variable por la fun randf obtenemos números randoms dentro de el Área del Mapa
#que vendrían a ser las posiones del enemigo
	var pos_x = randf_range(-1856, 2146)
	var pos_y = randf_range(-944, 985)
	#Se aplica la pocision al enemigo instanciado
	enemigo.global_position = Vector2(pos_x, pos_y)
	#Añadimos al nodo "Enemigo* cómo hijo de Main.
	add_child(enemigo)

func _spawnear_periodico():
	#Buscamos a todos los nodos del grupo Enemigos
	var enemigos = get_tree().get_nodes_in_group("Enemigos")#Devuelve una lista/Array
	#Si hay menos de 30 enemigos spawnear otro enemigo.
	if enemigos.size() < 30:
		spawnear_enemigo()
		#Condicionamos para que el tiempo disminuya entre cada spawn
		if timer.wait_time > 1:
			tiempo_entre_spawns -= 0.3
			timer.wait_time = tiempo_entre_spawns

#Actualiza El label Score.
func _process(delta: float) -> void:
	var enemies = get_tree().get_nodes_in_group("Enemigos")
	print(enemies.size())
	score_label.text = "SCORE: %d " %GlobalScript.score

#Reinicio del juego
#Señal recibida de Robot.
func _on_robot_reboot() -> void:
	GlobalScript.score = 0
	timer.stop()
	#Busca a todos los nodos de grupo "Enemigos" de árbol.
	var enemies = get_tree().get_nodes_in_group("Enemigos")
	for enemy in enemies:
		enemy.queue_free()#Los elimina(Borra lo nodos)
	#Inicia la pantalla Respawn 
	$UI/RespawScene.start()

#Señal de que ya puede respawnear.
func _on_respaw_scene_respawn() -> void:
	#Llama a la funcion new_party() del Robot para respawnear 
	$Robot.new_party()
	#Busca a todos los nodos de grupo "Enemigos" de árbol.
	var enemies = get_tree().get_nodes_in_group("Enemigos")
	for enemy in enemies: #Borra a todos enemigos.
		enemy.queue_free()
#Restaura el intervalo de spawns de los enemigos.
	tiempo_entre_spawns = 5.0 #Restaura el intervalo de spawns 
	timer.wait_time = tiempo_entre_spawns #Reasigna el tiempo.
	timer.start()#Iniciamos el timer.
