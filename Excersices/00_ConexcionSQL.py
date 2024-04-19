import mysql.connector

def conectar_base_datos():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="Course_db"
        )
        print("Conexión exitosa")
        return connection
    except mysql.connector.Error as error:
        print("Error al conectar a la base de datos:", error)
        return None

def ejecutar_sql(connection, sql_query):
    try:
        cursor = connection.cursor()
        cursor.execute(sql_query)
        connection.commit()
        cursor.close()
        print("Comando SQL ejecutado exitosamente")
    except mysql.connector.Error as error:
        print("Error al ejecutar el comando SQL:", error)

connection = conectar_base_datos()

if connection:
    def ejecutar_comando_sql(sql_query):
        ejecutar_sql(connection, sql_query)
    print("Puedes ejecutar comandos SQL en bloques adicionales.")
else:
    print("No se pudo establecer la conexión con la base de datos.")
