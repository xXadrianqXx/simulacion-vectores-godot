---

**📐 Simulación de Movimiento con Vectores en Godot**

Un proyecto educativo que demuestra la aplicación de vectores, MRU y geometría en el desarrollo de videojuegos.

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

Jugador y Enemigo

assets/jugador-enemigo.png

Sistema de Ataque

assets/ataque.png

Colisiones en acción

assets/colisiones.png

---

**📂 Estructura del Proyecto**

```
📁 Simulacion-Movimiento-Vectores/
│
├── 📁 Codigo-Fuente/           # Proyecto completo de Godot
│   ├── project.godot
│   ├── 📁 scenes/
│   ├──📁 scripts/
|   └─ 📁 scripts/
│
├── 📁 Ejecutables/             # Archivos listos para jugar
│   ├── 📁 Windows/
│   │   └── Juego.exe
│   └── 📁 Android/
│       └── Juego.apk
│
├── 📁 Documentacion/           # Manuales y guías
│   ├── Manual-Tecnico.pdf
│   └── Guia-Usuario.pdf
│
├── 📁 assets/                  # Imágenes del README
│   └── (capturas de pantalla)
│
└── 📄 README.md                # Este archivo
```

---

**🛠️ Tecnologías Usadas**

· Godot Engine 4.6
· GDScript
· Matemáticas Aplicadas (vectores, MRU, geometría de colisiones)

---

**📥 Descargas**

· Windows (.exe)
· Android (.apk)

---

**📄 Documentación**

· Manual Técnico (PDF)
· Guía de Usuario (PDF)

---

**👨‍💻 Autor**

Adrián Andrade
Estudiante de Software 
📧 adrian7462a@gmail.com
🔗 LinkedIn(Pendiente)
🐙 GitHub

---

**📜 Licencia**

Este proyecto está bajo la licencia MIT.
Puedes usarlo, modificarlo y distribuirlo libremente, siempre que se mencione al autor original.

---

¡Gracias por visitar mi proyecto! 🚀

---

