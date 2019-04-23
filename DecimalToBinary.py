def decimalToBinary():
    decimal = int(input("Digite um numero decimal: "))

    def div(decimal):
        resto = decimal % 2
        print("resto =", resto)
        return resto

    binario = []

    while decimal > 1:
        resto = div(decimal)
        binario.append(resto)
        decimal = decimal // 2

    binario.append(decimal)
    print(binario)
    return binario

def verifyParity(vetor):
    aux = 0
    for i in range(len(vetor)):
        if vetor[i] == 1:
            aux = aux + 1
    

    while len(vetor) != 7:
        vetor.append(0)

    if aux % 2 == 0:
        print("Bit de Paridade = 0")
        vetor.append(0)
    else:
        print("Bit de paridade = 1")
        vetor.append(1)

def binaryToDecimal(vetor):
    numero = 0
    for i in range(len(vetor)):
        numero += vetor[i] * (2**i)
    vetor.reverse()
    print("Decimal: ", numero)
    print(vetor)
        


binario = decimalToBinary()
verifyParity(binario)
binaryToDecimal(binario)
