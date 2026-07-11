extends CharacterBody2D
#region Estas variables estan en el inspector. Desde alli se modifican.
@export var animacion_robot: AnimatedSprite2D
@export_enum("Siempre","Cuando se mueva","Nunca") var mostrar_calculos = "Nunca"
#endregion

var rapidez = 300 #300 Pixeles 
var direccion = Vector2(0,0) #Direccion incial 

var impresiones_realizadas = 0 #Numero de impresiones de calculos de posicion realizas(Si es que se elige mostrar los calculos)

#Entrada de Movimiento/Cambio de direccion
func _input(event):
	#El evento recibido es las teclas que se presionaron o se liberaron.
	if event.is_action_pressed("mover_arriba"): #Si se presiona "mover_arriba" -> direccion(0,-1)
		direccion.y = -1
	elif event.is_action_released("mover_arriba"): #Si se libera "mover_arriba" -> direccion(0,0)
		direccion.y = 0
	if event.is_action_pressed("mover_abajo"):#Si se presiona "mover_abajo" -> direccion(0,1)
		direccion.y = 1
	elif event.is_action_released("mover_abajo"):#Si se libera "mover_abajo" -> direccion(0,0)
		direccion.y = 0
	
	if event.is_action_pressed("mover_izquierda"):#Si se presiona "mover_izquierda" -> direccion(-1,0)
		direccion.x = -1
	elif event.is_action_released("mover_izquierda"):#Si se libera "mover_izquierda" -> direccion(0,0)
		direccion.x = 0
	
	if event.is_action_pressed("mover_derecha"):#Si se presiona "mover_derecha" -> direccion(1,0)
		direccion.x = 1
	elif event.is_action_released("mover_derecha"):#Si se libera "mover_derecha" -> direccion(0,0)
		direccion.x = 0



func _physics_process(delta: float) -> void:
	var direccion_normalizada = direccion #Normalizacion del vector direccion
	var velocidad = direccion_normalizada * rapidez #MRU -> Vector "Velocidad" 

	var deplazamiento = velocidad * delta #MRU -> velocidad * tiempo

	#region Aqui se verifica si el Robot se encuentra dentro del rango permitido del mapa.
	#limite_del_mapa_eje_x() da true cuando la suma de (deplazamiento+position) ha superado al limite de pixeles del eje x que puede avanzar.
	if limite_del_mapa_eje_x(deplazamiento + position) == true: 
		deplazamiento.x = 0 #Si ha llegado al limite del mapa le asignamos 0 a x del vector despalzamiento.
	
	#limite_del_mapa_eje_y() da true cuando la suma de (deplazamiento+position) ha superado al limite de pixeles del eje y que puede avanzar.
	if limite_del_mapa_eje_y(deplazamiento + position) == true:
		deplazamiento.y = 0 #Si ha llegado al limite del mapa le asignamos 0 a y del vector despalzamiento.
	#endregion Si esta dentro del mapa esto no hace nada.

	position = position + deplazamiento #Aqui es donde se realiza el cambio de posicion. 
	
	#region Funciones secundarias(No afectan al movimiento)
	animaciones() #Esta funcion Gestiona las animaciones del robot
	if mostrar_calculos == "Siempre":
		print_directions(direccion_normalizada, velocidad, deplazamiento)
	elif mostrar_calculos == "Cuando se mueva":
		if direccion != Vector2.ZERO:
			print_directions(direccion_normalizada, velocidad, deplazamiento)
	#endregion



func animaciones():
	if direccion != Vector2.ZERO:
		animacion_robot.play("run")
	else: animacion_robot.play("default")
	if direccion.x == 1:
		animacion_robot.flip_h = false
	elif direccion.x == -1:  
		animacion_robot.flip_h = true

func print_directions(direccion_normalizada: Vector2, velocidad: Vector2, deplazamiento: Vector2):
	print("--------------------------------------------------------------")
	impresiones_realizadas = impresiones_realizadas + 1
	print("Calculo: ", impresiones_realizadas)
	print("Direccion: ", direccion )
	print("Direccion Normalizada: ", direccion_normalizada )
	print("velocidad(rapidez*direccion): ", velocidad )
	print("Desplazamiento(velocidad*tiempo): ", deplazamiento )
	print("Posicion(posicio_actual + desplazamiento): ", position )


func limite_del_mapa_eje_x(pos_futura) -> bool:
	var limit_right = 2146.009 #Limite derecho (x)
	var limit_left = -1856.009 #Limite izquierdo o (-x)
	if pos_futura.x > limit_right or pos_futura.x < limit_left:
		return true
	return false

func limite_del_mapa_eje_y(pos_futura) -> bool:
	var limit_up = -944.924 #Limite superior (-y)
	var limit_down = 985.924 #Limite inferior o (y)
	if pos_futura.y < limit_up or pos_futura.y > limit_down:
		return true
	return false
