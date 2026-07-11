extends CharacterBody2D
@export var animacion_enemigo: AnimatedSprite2D
@export_enum("Siempre","Cuando se mueva","Nunca") var mostrar_calculos = "Nunca"
#endregion

var rapidez = 150 #150 Pixeles
var direccion = Vector2(0,0) #Direccion incial 

var rango_max = 50 #Esto es la distancia maxima que se puede acercar el enemigo al robot


var impresiones_realizadas = 0 #Numero de impresiones de calculos de posicion realizas(Si es que se elige mostrar los calculos)

func _physics_process(delta: float) -> void:
	 #Con esta funcion subimos de rango del arbol de nodos y buscamos al nodo Robot.
	var robot = get_node("../Robot") #Una vez encontrado podemos ver y usar pero no modificar sus propiedades.
	#direccion = posicion ala que se quiere llegar - posision actual
	direccion =  robot.position - position #Realizamos una resta de vectores.
	
	var direccion_normalizada = direccion.normalized() #Normalizacion del vector direccion
	var velocidad = direccion_normalizada * rapidez #MRU -> Vector "Velocidad"

	var deplazamiento = velocidad * delta #MRU -> velocidad * tiempo

	#region Aqui se verifica si la Pet se encuentra dentro del rango permitido del mapa.
	#limite_del_mapa_eje_x() da true cuando la suma de (deplazamiento+position) ha superado al limite de pixeles del eje x que puede avanzar.
	if limite_del_mapa_eje_x(deplazamiento + position) == true: 
		deplazamiento.x = 0 #Si ha llegado al limite del mapa le asignamos 0 a x del vector despalzamiento.
	
	#limite_del_mapa_eje_y() da true cuando la suma de (deplazamiento+position) ha superado al limite de pixeles del eje y que puede avanzar.
	if limite_del_mapa_eje_y(deplazamiento + position) == true:
		deplazamiento.y = 0 #Si ha llegado al limite del mapa le asignamos 0 a y del vector despalzamiento.
	#endregion Si esta dentro del mapa esto no hace nada.

	#Calculo de la distacia que tienen el Robot y la macota por medio de distance_to() 
	var distancia_futura = (deplazamiento + position).distance_to(robot.position) #Recordemos que (deplazamiento + position) = nueva_posicion
	#Si la distancia_futura es menor a el rango_maximo 
	if distancia_futura < rango_max:
		deplazamiento = Vector2.ZERO # Si se cumple la condicion hacemos que se deje de mover asignando al vector desplazmiento -> (0,0)
	position = position + deplazamiento #Aqui es donde se realiza el cambio de posicion. 
	
	#region Funciones secundarias(No afectan al movimiento)
	animaciones(deplazamiento) #Esta funcion Gestiona las animaciones del Enemigo.
	if mostrar_calculos == "Siempre":
		print_directions(direccion_normalizada, velocidad, deplazamiento)
	elif mostrar_calculos == "Cuando se mueva":
		if direccion != Vector2.ZERO:
			print_directions(direccion_normalizada, velocidad, deplazamiento)
	#endregion



func animaciones(de):
	if de != Vector2.ZERO:
		animacion_enemigo.play("run")
	else: animacion_enemigo.play("default")
	if direccion.x > 0:
		animacion_enemigo.flip_h = false
	elif direccion.x < 0:  
		animacion_enemigo.flip_h = true

func print_directions(direccion_normalizada: Vector2, velocidad: Vector2, deplazamiento: Vector2):
	print("--------------------------------------------------------------")
	impresiones_realizadas = impresiones_realizadas + 1
	print("Calculo: ", impresiones_realizadas)
	print("Direccion: ", direccion )
	print("Direccion Normalizada: ", direccion_normalizada )
	print("velocidad(rapidez*direccion): ", velocidad )
	print("Desplazamiento(velocidad*tiempo): ", deplazamiento )
	print("Posicion(posicio_nactual + desplazamiento): ", position )


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
