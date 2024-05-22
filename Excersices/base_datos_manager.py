import pymysql
import random
import string

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

    def crear_tabla(self, nombre_tabla, columnas):
        try:
            cursor = self.connection.cursor()
            consulta = f"CREATE TABLE IF NOT EXISTS {nombre_tabla} ({', '.join(columnas)})"
            cursor.execute(consulta)
            self.connection.commit()
            print(f"Tabla {nombre_tabla} creada correctamente")
            return cursor
        except pymysql.Error as e:
            print(f"Error al crear la tabla {nombre_tabla}:", e)
            return None

    def llenar_tabla(self, nombre_tabla, valores):
        try:
            cursor = self.connection.cursor()
            placeholders = ', '.join(['%s'] * len(valores))
            consulta = f"INSERT INTO {nombre_tabla} VALUES ({placeholders})"
            cursor.execute(consulta, valores)
            self.connection.commit()
            print(f"Datos insertados en la tabla {nombre_tabla} correctamente.")
        except pymysql.Error as e:
            print(f"Error al insertar datos en la tabla {nombre_tabla}:", e)

    def cerrar_conexion(self):
        self.connection.close()

    def generar_nombre_aleatorio(self):
        return ''.join(random.choice(string.ascii_letters) for _ in range(10))

    def generar_descripcion_aleatoria(self):
        return ''.join(random.choice(string.ascii_letters + string.digits + string.punctuation) for _ in range(50))

    def generar_precio_aleatorio(self):
        return round(random.uniform(1.0, 100.0), 2)

    def generar_stock_aleatorio(self):
        return random.randint(0, 1000)

    def generar_direccion_aleatoria(self):
        numero = random.randint(1, 100)
        calle = ''.join(random.choice(string.ascii_letters) for _ in range(10))
        ciudad = ''.join(random.choice(string.ascii_letters) for _ in range(10))
        estado = ''.join(random.choice(string.ascii_uppercase) for _ in range(2))
        return f"{numero} {calle}, {ciudad}, {estado}"
