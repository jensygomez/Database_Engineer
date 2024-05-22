from base_datos_manager import BaseDatosManager
import random

if __name__ == "__main__":
    manager = BaseDatosManager(
        host='sql10.freesqldatabase.com',
        user='sql10705361',
        password='HqKECAGFRn',
        database='sql10705361'
    )

    # Crear tabla de productos desde main.py
    nombre_tabla_productos = "productos12"
    columnas_productos = [
        "id INT AUTO_INCREMENT PRIMARY KEY",
        "nombre VARCHAR(255)",
        "descripcion TEXT",
        "precio DECIMAL(10, 2)",
        "stock INT"
    ]
    manager.crear_tabla(nombre_tabla_productos, columnas_productos)

    # Llenar tabla de productos con valores aleatorios
    cantidad = 100
    for _ in range(cantidad):
        valores_productos = (
            manager.generar_nombre_aleatorio(),
            manager.generar_descripcion_aleatoria(),
            manager.generar_precio_aleatorio(),
            manager.generar_stock_aleatorio(),
            manager.generar_direccion_aleatoria()  # Generar dirección aleatoria
        )
        manager.llenar_tabla(nombre_tabla_productos, valores_productos)

    # Otras operaciones con la base de datos...

    # Cerrar conexión
    manager.cerrar_conexion()
