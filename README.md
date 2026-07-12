
# 📐Simulación de Movimiento con Vectores en Godot

> Un proyecto educativo que demuestra la aplicación de vectores, MRU y geometría en el desarrollo de videojuegos.

---

**📖 Descripción General**

Este proyecto simula el movimiento de un personaje y un enemigo en un entorno 2D utilizando vectores y Movimiento Rectilíneo Uniforme (MRU). Fue desarrollado como parte de un estudio de geometría aplicada, con el objetivo de explicar cómo las matemáticas se traducen en código y movimiento en tiempo real.

---

**🧠 Marco Teórico Aplicado**

🔹 *Vectores de Dirección*

· El movimiento del jugador se controla con vectores unitarios obtenidos desde el teclado (WASD).
· Ejemplo: (1, 0) → derecha, (0, -1) → arriba, (1, -1) → diagonal.

🔹 Normalización

· Se utiliza .normalized() para asegurar que el vector de dirección tenga magnitud 1, manteniendo la velocidad constante en todas las direcciones.

🔹 MRU (Movimiento Rectilíneo Uniforme)

· La fórmula aplicada es:
    desplazamiento = velocidad * delta
· Donde velocidad = direccion * rapidez.

🔹 Colisiones por Geometría

· Se calcula una posición futura y se verifica si está dentro de los límites del mapa.
· Si está fuera, se anula el desplazamiento en ese eje.

---

**🎮 Características**

· ✅ Movimiento del jugador con WASD (vectores).
· ✅ Persecución del enemigo usando resta de vectores.
· ✅ Colisiones con límites del mapa (geometría de rectángulos).
· ✅ Sistema de ataque y vida (disparos en línea recta).
· ✅ Documentación completa del código.

---

**🖼️ Capturas del Proyecto**
    
   •*Menú*

![Menú](img/port.jpeg)

   •*Gameplay*

![Gameplay](img/mov.jpeg)

---

**📂 Estructura del Proyecto**

```
📁 Simulación-Movimiento-Vectores/       
│
├── 📄 README.md                            
│
├── 📁 Codigo-Fuente/                       
│   ├── project.godot
│   ├── 📁 Animation/
│   ├── 📁 Map/
│   └── 📁 UI/
│
├── 📁 Documentacion/                       
│   ├── Manual-TecnicoBasicoV1.pdf                 ← Apuntes (el que tiene las apuntes manuales.)
│   └── TrabajoFormulasMRUyDireccionNormalizada.pdf                   
├── 📁 Versiones_Anteriores/               
│   └── 📁 Solo-Movimiento/
│
└── 📁 img/                                
```

---

**🛠️ Tecnologías Usadas**

· Godot Engine 4.6
· GDScript
· Matemáticas Aplicadas (vectores, MRU, geometría de colisiones)
· Control de versiones con Git

---

**📥 Descargas**

· [Android]
· [Android(Tablet)](https://release-assets.githubusercontent.com/github-production-release-asset/1297202780/38a68a0a-2b67-4a11-b5a2-5298b90ca428?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-07-12T05%3A37%3A21Z&rscd=attachment%3B+filename%3DProyectoFinal.Tablet.apk&rsct=application%2Fvnd.android.package-archive&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-07-12T04%3A36%3A26Z&ske=2026-07-12T05%3A37%3A21Z&sks=b&skv=2018-11-09&sig=WVKpFdHH4NlSpb%2FaNpXGuk%2FGtnopoosNAvRDY7n%2BQUM%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MzgzMjc4NiwibmJmIjoxNzgzODMwOTg2LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.XEYXhuniM7XOTtkUdlRkHBz1Yx98cbmUFU0HRVFZ2t8&response-content-disposition=attachment%3B%20filename%3DProyectoFinal.Tablet.apk&response-content-type=application%2Fvnd.android.package-archive)
· [Windows 64bits](https://release-assets.githubusercontent.com/github-production-release-asset/1297202780/fb3903b0-e108-47c0-b717-cbf8a438facc?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-07-12T05%3A32%3A49Z&rscd=attachment%3B+filename%3DProyectoFinal.exe.zip&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-07-12T04%3A32%3A49Z&ske=2026-07-12T05%3A32%3A49Z&sks=b&skv=2018-11-09&sig=05V1jmqqkLIiEfQDyNXUg5gDS5PZM%2FKlKLhwY34YazA%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc4MzgzMjU2OSwibmJmIjoxNzgzODMwNzY5LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.gTJZLdQPjpB7tE2tyi9_X7bv5esabfA0NvbqSR7uaoI&response-content-disposition=attachment%3B%20filename%3DProyectoFinal.exe.zip&response-content-type=application%2Foctet-stream)
## ⚠️ Advertencia de Windows

Al ejecutar el juego, Windows puede mostrar un mensaje de seguridad. 
Esto ocurre porque el ejecutable no está firmado digitalmente. 
**Es seguro ejecutarlo.** Puedes hacer clic en **"Más información"** y luego en **"Ejecutar de todas formas"**.


---

**📄 Documentación**

· [Apuntes MRU y Dirección Normalizada](Documentacion/TrabajoFormulasMRUyDireccionNormalizada.pdf)
· [Guia Técnica](Documentacion/Manual_Tecnico_BasicoV1.pdf)

---
**📝 Apuntes**

 -> Debido a que en GitHub(Android) no se podía prevualizar el pdf de los apuntes eh puesto las capturas aquí. Si no se ven correctamente descargue el .pdf correspondiente.

![Apuntes 1raParte](img/apuntes1.png)
![Apuntes 2raParte](img/apuntes2.png)
![Apuntes 3raParte](img/apuntes3.png)
![Apuntes 4raParte](img/apuntes4.png)
![Apuntes 5raParte](img/apuntes5.png)
![Apuntes 6raParte](img/apuntes6.png)
---

**👨‍💻 Autor**

· Adrián Andrade
· Estudiante de Ingeniería de Software 
· 📧 adrian7462a@gmail.com
· 🔗 LinkedIn(Pendiente)
· 🐙 GitHub: xXadrianqXx

---

**📜 Licencia**

Este proyecto está bajo la licencia MIT.
Puedes usarlo, modificarlo y distribuirlo libremente, siempre que se mencione al autor original.

---

El código muestra qué hice. La documentación muestra por qué lo hice.

¡Gracias por visitar mi proyecto!

---

