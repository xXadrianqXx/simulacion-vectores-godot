extends Control

signal respawn 

#Inicio de la pantalla Respawn 
func start():
	$Timer.start()#Inicia el timer de 2 segundos
	modulate.a = 0 #Se asegura que sea transparente 
	visible = true #Muestra la pantalla 

	#Inicia la animación para dejar de ser transparente suavemente.
	$AnimationPlayer.play("new") 

#Actualizacion de Label que muestra el tiempo regresivo para el respawn.
func _process(delta: float) -> void:
	$ColorRect/Label.text = "Revivir en: \n%.1f" %$Timer.time_left


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("end")#Vuelve transparente la pantalla.
	respawn.emit() #Emite la señal al nodo "Main" que ya puede respawnear.
	visible = false #Oculta la pantalla 
