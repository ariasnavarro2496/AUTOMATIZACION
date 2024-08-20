import random

def generar_numero_base():
    """Genera un número base de 7 u 8 dígitos para el RUT."""
    return random.randint(1000000, 99999999)

def calcular_digito_verificador(rut):
    """Calcula el dígito verificador para el RUT dado."""
    reversed_digits = map(int, reversed(str(rut)))
    factors = [2, 3, 4, 5, 6, 7] * 2  # Se repite para cubrir hasta 8 dígitos
    s = sum(d * f for d, f in zip(reversed_digits, factors))
    mod = (-s) % 11
    if mod == 10:
        return 'K'
    else:
        return str(mod)

def generar_rut_aleatorio():
    """Genera un RUT chileno aleatorio y válido."""
    numero_base = generar_numero_base()
    digito_verificador = calcular_digito_verificador(numero_base)
    return f"{numero_base}-{digito_verificador}"

def generar_ruts_unicos(cantidad):
    """Genera una cantidad especificada de RUTs únicos."""
    ruts = set()
    while len(ruts) < cantidad:
        rut = generar_rut_aleatorio()
        ruts.add(rut)
    return list(ruts)

# Ejemplo de uso:
cantidad_ruts = 1
ruts = generar_ruts_unicos(cantidad_ruts)
for rut in ruts:
    print(rut)