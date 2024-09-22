from scipy.optimize import linprog
import numpy as np 

# PROBLEMA 2
#Coeficientes de la función objetivo#
f_obj = [-550, -600, -350, -400, -200]  #Maximización -> Minimización multiplicando por -1#

#Matriz de restricciones#
f_con = [
    [12, 20, 0, 25, 15],  #Restricción de rectificado#
    [10, 8, 16, 0, 0],    #Restricción de perforado#
    [20, 20, 20, 20, 20]  #Restricción de ensamblaje#
]

#Lado derecho de las restricciones#
f_rhs = [288, 192, 384]

#Resolver el problema de maximización#
result2 = linprog(c=f_obj, A_ub=f_con, b_ub=f_rhs, method='highs')

#Mostrar los resultados#
if result2.success:
    print(f"PROBLEMA 2: Solución óptima = {result2.x}, Valor de la función objetivo = {-result2.fun}")
else:
    print("PROBLEMA 2: No se encontró una solución factible")


# PROBLEMA 3
#Coeficientes de la función objetivo#
profits = [-870, -1120, -1200]  #Maximización -> Minimización#

#Restricciones#
motor_time = [3, 2, 4]
body_time = [1, 2, 3]
gasoline_time = [2, 0, 0]
luxury_time = [0, 3, 0]
super_luxury_time = [0, 0, 2]

constraints = [motor_time, body_time, gasoline_time, luxury_time, super_luxury_time]
rhs = [120, 80, 96, 102, 40]

#Resolver el problema de maximización#
result3 = linprog(c=profits, A_ub=constraints, b_ub=rhs, method='highs')

#Mostrar los resultados#
if result3.success:
    print(f"PROBLEMA 3: Solución óptima = {result3.x}, Valor de la función objetivo = {-result3.fun}")
else:
    print("PROBLEMA 3: No se encontró una solución factible")


# PROBLEMA 4
#Coeficientes de la función objetivo#
ganancias = [-6, -6, -7, -7, -10, -10]  #Maximización -> Minimización#

#Restricciones#
restricciones = [
    [2, 0, 0, 0, 2, 0],    #Restricción Técnico A#
    [0, 2.5, 3, 0, 0, 0],  #Restricción Técnico B#
    [0, 0, 0, 0, 0, 4],    #Restricción Técnico C#
    [0, 0, 0, 3.5, 0, 0],  #Restricción Técnico D#
    [1, 1, 0, 0, 0, 0],    #Máximo Producto 1#
    [0, 0, 1, 1, 0, 0],    #Máximo Producto 2#
    [0, 0, 0, 0, 1, 1]     #Máximo Producto 3#
]

capacidades = [120, 120, 120, 120, 80, 50, 50]

#Resolver el problema de maximización#
result4 = linprog(c=ganancias, A_ub=restricciones, b_ub=capacidades, method='highs')

#Mostrar los resultados#
if result4.success:
    print(f"PROBLEMA 4: Ganancia total máxima = {-result4.fun}, Solución óptima = {result4.x}")
else:
    print("PROBLEMA 4: No se encontró una solución factible")


# PROBLEMA 5
#Coeficientes de la función objetivo#
f_obj = [132, 97, 103, 85, 91, 106, 89, 100, 98]

#Matriz de restricciones de desigualdad (<=)#
f_con_ub = [
    [1, 1, 1, 0, 0, 0, 0, 0, 0],  #S1#
    [0, 0, 0, 1, 1, 0, 0, 0, 0],  #S2#
    [0, 0, 0, 0, 0, 1, 1, 1, 1]   #S3#
]

#Lado derecho de las restricciones de desigualdad#
f_rhs_ub = [135, 56, 93]

#Matriz de restricciones de igualdad (=)#
f_con_eq = [
    [1, 0, 0, 1, 0, 1, 0, 0, 0],  #T1#
    [0, 0, 0, 0, 1, 0, 1, 0, 0],  #T2#
    [0, 1, 0, 0, 0, 0, 0, 1, 0],  #T3#
    [0, 0, 1, 0, 0, 0, 0, 0, 1]   #T4#
]

#Lado derecho de las restricciones de igualdad#
f_rhs_eq = [62, 83, 39, 91]

#Resolver el problema de minimización con restricciones de igualdad y desigualdad#
result5 = linprog(c=f_obj, A_ub=f_con_ub, b_ub=f_rhs_ub, A_eq=f_con_eq, b_eq=f_rhs_eq, method='highs')

#Mostrar los resultados#
if result5.success:
    print(f"PROBLEMA 5: Solución óptima = {result5.x}, Costo mínimo total = {result5.fun}")
else:
    print("PROBLEMA 5: No se encontró una solución factible")


# PROBLEMA 7
#Coeficientes de la función objetivo#
objective = [-40, -50]  #Maximización -> Minimización#

#Matriz de restricciones#
constraints = [
    [1, 1],   #Restricción de disponibilidad de nitrógeno#
    [3, 4],   #Restricción de disponibilidad de hidrógeno#
    [0, 1]    #Restricción de disponibilidad de cloro#
]

rhs = [50, 180, 40]

#Resolver el problema de maximización#
solution = linprog(c=objective, A_ub=constraints, b_ub=rhs, method='highs')

#Mostrar los resultados#
if solution.success:
    print(f"PROBLEMA 7: Beneficio total máximo = {-solution.fun}, Solución óptima = {solution.x}")
else:
    print("PROBLEMA 7: No se encontró una solución factible")


# PROBLEMA 8
#Coeficientes de la función objetivo (Maximización)#
#El orden de las variables es X1A, X1B, X2A, X2B, X3A#
f_obj = [0, 0, 0, -3, -1.7]  #Maximización -> Minimización multiplicando por -1#

#Coeficientes de las restricciones en una matriz#
#Convertir las restricciones >= a <= multiplicando por -1#
f_con = [
    [1, 1, 0, 0, 0],        #Restricción 1: X1A + X1B <= 100000#
    [-1.7, 0, 1, 1, 0],     #Restricción 2: -1.7X1A >= X2A + X2B -> -1.7X1A - X2A - X2B <= 0#
    [0, -3, -1.7, 0, 1]     #Restricción 3: X3A >= 1.7X2A + 3X1B - X2B -> -3X1B - 1.7X2A + X3A <= -X2B#
]

#Coeficientes del lado derecho (RHS) de las inecuaciones#
f_rhs = [100000, 0, 0]

#Resolver el problema de maximización usando linprog#
result = linprog(c=f_obj, A_ub=f_con, b_ub=f_rhs, method='highs')

#Mostrar la solución óptima#
if result.success:
    #Redondear valores cercanos a 0 para evitar mostrar -0#
    optimal_solution = np.round(result.x, decimals=6)
    
    #Reemplazar valores muy cercanos a 0 con 0#
    optimal_solution = np.where(np.abs(optimal_solution) < 1e-6, 0, optimal_solution)

    print(f"PROBLEMA 8: Solución óptima: {optimal_solution}")
    print(f"PROBLEMA 8: Valor de la función objetivo (ganancias totales): {-result.fun}")  #Multiplicamos por -1 para revertir la maximización#
else:
    print("PROBLEMA 8: No se encontró una solución factible")