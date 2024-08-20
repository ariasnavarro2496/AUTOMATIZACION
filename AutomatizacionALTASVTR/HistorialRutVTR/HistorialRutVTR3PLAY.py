from datetime import datetime

def actualizar_archivo_general(archivo_especifico, archivo_general):
    # Leer el contenido del archivo específico
    with open(archivo_especifico, 'r', encoding='utf-8') as archivo:
        contenido = archivo.read()
    
    # Obtener la fecha y hora actuales
    fecha_hora_actual = datetime.now().strftime('%d-%m-%Y %H:%M')
    
    # Formatear el contenido con la fecha y hora
    contenido_formateado = f'{contenido}  -  Alta 3PLAY VTR  {fecha_hora_actual}\n '
    
    # Añadir el contenido al archivo general
    with open(archivo_general, 'a', encoding='utf-8') as archivo:
        archivo.write(contenido_formateado)
    
    print(f'Archivo general actualizado con contenido de {archivo_especifico}')

# Ejemplo de uso
archivo_especifico = 'AutomatizacionALTASVTR/ID_VTR.txt'
archivo_general = 'AutomatizacionALTASVTR/HistorialRutVTR.txt'

actualizar_archivo_general(archivo_especifico, archivo_general)
