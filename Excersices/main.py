from base_datos_manager import BaseDatosManager, generar_nombre_aleatorio, generar_precio_aleatorio, generar_stock_aleatorio, laboratorios
import random

if __name__ == "__main__":
    # Crear una instancia de BaseDatosManager
    manager = BaseDatosManager(
        host='sql10.freesqldatabase.com',
        user='sql10705361',
        password='HqKECAGFRn',
        database='sql10705361'
    )

    # Crear tabla de medicamentos
    consulta_medicamentos = """
    CREATE TABLE IF NOT EXISTS medicamentos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(255),
        laboratorio VARCHAR(255),
        precio DECIMAL(10, 2),
        stock INT
    )
    """
    manager.crear_tabla("medicamentos", consulta_medicamentos)

    # Llenar tabla de medicamentos
    cantidad = 100
    manager.llenar_tabla("medicamentos", cantidad, lambda: (
        generar_nombre_aleatorio(),
        random.choice(laboratorios),
        generar_precio_aleatorio(),
        generar_stock_aleatorio()
    ))

    # Otras operaciones con la base de datos...

    # Cerrar conexión
    manager.cerrar_conexion()
