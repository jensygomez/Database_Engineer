import mysql.connector
from datetime import datetime, timedelta
import random

# Configuración de la conexión a la base de datos
config = {
    'user': 'root',             # Usuario de MySQL/MariaDB
    'password': 'jensy',        # Contraseña del usuario
    'host': 'localhost',        # Host donde se encuentra MySQL/MariaDB
    'database': 'Systech_DB',   # Nombre de la base de datos
    'raise_on_warnings': True   # Activar excepciones por advertencias
}

# Lista de nombres y apellidos ficticios
nombres_apellidos = [
    ('Juan', 'García'), ('María', 'Rodríguez'), ('José', 'López'),
    ('Ana', 'Martínez'), ('Pedro', 'Sánchez'), ('Laura', 'Gómez'),
    ('Diego', 'Fernández'), ('Sofía', 'Pérez'), ('Carlos', 'Díaz'),
    ('Elena', 'Ruiz'), ('Miguel', 'Torres'), ('Carmen', 'Navarro'),
    ('Pablo', 'Jiménez'), ('Isabel', 'Ortega'), ('Javier', 'Serrano'),
    ('Lucía', 'Ramírez'), ('Antonio', 'Hernández'), ('Diana', 'Flores'),
    ('Francisco', 'Moreno'), ('Eva', 'Gutiérrez'), ('Jorge', 'Alonso'),
    ('Raquel', 'Castro'), ('Manuel', 'Romero'), ('Beatriz', 'Sanz'),
    ('Alberto', 'Garrido'), ('Rosa', 'Iglesias'), ('Andrés', 'Calvo'),
    ('Marina', 'Vega'), ('Santiago', 'Molina'), ('Silvia', 'Morales')
]

try:
    # Conectar a la base de datos
    conn = mysql.connector.connect(**config)
    cursor = conn.cursor()

    # Generar 100 empleados
    for _ in range(100):
        # Generar datos aleatorios para cada empleado
        nombre, apellido = random.choice(nombres_apellidos)
        fecha_nacimiento = datetime.now() - timedelta(days=random.randint(20*365, 60*365))
        fecha_contratacion = datetime.now() - timedelta(days=random.randint(0, 9*365))
        departamento_id = random.randint(1, 13)
        cargo_id = random.randint(1, 29)
        nivel_id = random.randint(1, 3)

        # Insertar el empleado en la base de datos
        query = "INSERT INTO Empleados (nombre, apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id) " \
                "VALUES (%s, %s, %s, %s, %s, %s, %s)"
        values = (f"{nombre} {apellido}", apellido, fecha_nacimiento, fecha_contratacion, departamento_id, cargo_id, nivel_id)
        cursor.execute(query, values)

    # Confirmar los cambios
    conn.commit()
    print("Se han insertado 100 empleados correctamente.")

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Cerrar el cursor y la conexión
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'conn' in locals() and conn.is_connected():
        conn.close()

