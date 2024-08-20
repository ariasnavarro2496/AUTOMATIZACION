import sys
import random
import argparse



    
def calculaDV(rut):
    # Calcula el dígito verificador válido para un RUT
    rut_str=str(rut)[::-1]  
    
    # Variables para el cálculo
    multiplicador=2
    suma=0
    
    for c in rut_str:
        # Iteramos sobre todos los caracteres del RUT ya invertido, sumando los dígitos * el multiplicador
        suma+=int(c)*multiplicador
        multiplicador+=1
        if multiplicador>7:
            multiplicador=2
        
    dv=str(11-(suma%11))  # 11 - Módulo
    
    # Excepciones
    if dv=='11':
        dv='0'
    if dv=='10':
        dv='K'
        
    return dv
    
def generaRut(rango_inf, rango_sup):
    # Genera un rut válido entre los rangos especificados
    # random.seed()     # No hace falta. Al importar el módulo, se hace esto automáticamente.
    rut=random.randint(rango_inf, rango_sup)
    dv=calculaDV(rut)
    res=str(rut)+'-'+dv
    
    return res
# Manejo de opciones de línea de comando
parser=argparse.ArgumentParser(description="""\
Genera un listado de RUTs chilenos validos, con digito verificador.

Uso: genrut.py [opciones]

""")
    
parser.add_argument('-i', '--inf',
    type=int, action='store', dest="inf", metavar='lim_inf', default=5000000,
    help="Opcional. Especifica el limite inferior de numero de RUT generado (5000000 por omision).")
parser.add_argument('-s', '--sup',
    type=int, action='store', dest="sup", metavar='lim_sup', default=25000000,
    help="Opcional. Especifica el limite superior de numero de RUT generado (25000000 por omision).")
parser.add_argument('-c', '--cantidad',
    type=int, action='store', dest="cantidad", metavar='numero_ruts', default=1,
    help="Opcional. Especifica la cantidad de RUTs a generar (1 por omision).")
parser.add_argument('-v', '--validar',
    type=int, action='store', dest="validar", metavar='rut_a_validar', default=0,
    help="Opcional. Especifica un RUT (sin DV) y devuelve el mismo, incluyendo su DV.")
parser.add_argument('-n', '--nombres', action='store_true',
    dest='nombres', default=False,
    help="Opcional. Genera sexo, edad y nombres ademas de los RUTs, separados por tabs.")

args = parser.parse_args()

# Si se pasó un RUT para validar, se hace de inmediato y se termina.
if args.validar>0:
    dv=calculaDV(args.validar)
    print (args.validar, "-", dv, sep="")
    sys.exit(0)
    
# Validaciones de parámetros
if args.inf<1000000 or args.sup<1000000:
    # Falta algún parámetro obligatorio
    print ('ERROR: Tanto el limite inferior como el superior deben ser igual o mayor a 1000000.')
    sys.exit(1)
    
if args.inf>=args.sup:
    print ('ERROR: El limite superior debe ser mayor al inferior.')
    sys.exit(1)
    
if args.cantidad<1:
    print ('ERROR: La cantidad de RUTs a generar debe ser mayor o igual a 1.')
    sys.exit(1)
    

# Ciclo principal

for i in range(args.cantidad):
    rut = generaRut(args.inf, args.sup)
    if args.nombres:
        rut = + rut
    print(rut)    
    

