#!/usr/bin/env python3
def inversor(R1, R2, e1):
    print()
    print("#### Inversor ####")
    result = round(-(R2 / R1) * e1, 1)
    print("Result inversor = ", result)


def neinversor(R1, R2, e1):
    print()
    print("#### Neinversor ####")
    result = round((1 + R2 / R1) * e1, 1)
    print("Result neinversor = ", result)


def repetor(e1):
    print()
    print("#### Repetor ####")
    result = round(e1, 1)
    print("Result repetor = ", result)

    
def sumator(R, R1, R2, e1, e2):
    print()
    print("#### Sumator ####")
    result = round(-R * (e1 / R1 + e2 / R2), 1)
    print("Result sumator = ", result)


def diferential(R1, R2, e1, e2):
    print()
    print("#### Diferential ####")
    result = round(e1 * (1 + R2 / R1) - e2 * (R2 / R1), 1)
    print("Result diferential = ", result)


def suci(R, i1):
    print()
    print("#### SUCI ####")
    result = round(R * i1, 1)
    print("Result SUCI = ", result)


def sicu(R1, u1):
    print()
    print("#### SICU ####")
    result = round((u1 / R1) * 1000, 1) 
    print("Result SICU = ", result)



inversor(200, 350, 120)
neinversor(900, 950, 30)
repetor(10)
sumator(300, 50, 600, 10, 30)
diferential(700, 250, 180, 150)
suci(140, 19)
sicu(115, 18.5)
