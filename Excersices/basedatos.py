import pymysql
import random

class BaseDatosManager:
    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.connection = self.conectar_base_datos()

    def conectar_base_datos(self):
        try:
            connection = pymysql.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                database=self.database
            )
            print("Conexión establecida correctamente")
            return connection
        except pymysql.Error as e:
            print("Error al intentar conectarse a la Base de Datos:", e)
            return None

    def crear_tabla(self, nombre_tabla, consulta):
        try:
            cursor = self.connection.cursor()
            cursor.execute(consulta)
            self.connection.commit()
            print(f"Tabla {nombre_tabla} creada correctamente")
            return cursor
        except pymysql.Error as e:
            print(f"Error al crear la tabla {nombre_tabla}:", e)
            return None

    def llenar_tabla(self, nombre_tabla, cantidad, generador_datos):
        try:
            cursor = self.connection.cursor()
            for _ in range(cantidad):
                datos = generador_datos()
                cursor.execute(f'INSERT INTO {nombre_tabla} VALUES ({", ".join(["%s"] * len(datos))})', datos)
            
            self.connection.commit()
            print(f"Datos insertados en la tabla {nombre_tabla} correctamente.")
        except pymysql.Error as e:
            print(f"Error al insertar datos en la tabla {nombre_tabla}:", e)

    def cerrar_conexion(self):
        self.connection.close()


def generar_nombre_aleatorio():
    # Tu implementación actual
    pass

def generar_precio_aleatorio():
    # Tu implementación actual
    pass

def generar_stock_aleatorio():
    # Tu implementación actual
    pass


# Ejemplo de uso
if __name__ == "__main__":
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
