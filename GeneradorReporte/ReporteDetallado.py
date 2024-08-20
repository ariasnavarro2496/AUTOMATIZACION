import os
import subprocess
from datetime import datetime

# Crear un directorio con la fecha y hora actuales
timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M")
output_dir = f"Reporte_{timestamp}"
os.makedirs(output_dir, exist_ok=True)

# Comando para ejecutar las pruebas
command = [
    "robot",
    f"--output={output_dir}/output.xml",
    f"--log={output_dir}/log.html",
    f"--report={output_dir}/report.html",

#Ruta del proceso que se generara el reporte
    "AutomatizacionALTASVTR/AltaPlayVTR/AltaPlay1VTR.robot"
]

# Ejecutar el comando
subprocess.run(command)
