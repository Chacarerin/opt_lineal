#PROBLEMA 2 (OK)#
#Cargar la librería lpSolve#
library(lpSolve)

#1. Coeficientes de la función objetivo#
f.obj <- c(550, 600, 350, 400, 200)

#2. Matriz de restricciones#
f.con <- matrix(c(12, 20, 0, 25, 15,    #Restricción de rectificado#
                  10, 8, 16, 0, 0,      #Restricción de perforado#
                  20, 20, 20, 20, 20),  #Restricción de ensamblaje#
                nrow = 3, byrow = TRUE)

#3. Direcciones de las restricciones#
f.dir <- c("<=", "<=", "<=")

#4. Lado derecho de las restricciones#
f.rhs <- c(288, 192, 384)

#5. Resolver el problema de maximización#
result <- lp("max", f.obj, f.con, f.dir, f.rhs)

#6. Mostrar la solución óptima (cuántas unidades de cada producto producir)#
print(result$solution)

#7. Mostrar el valor de la función objetivo (beneficio total máximo)#
print(result$objval)

#PROBLEMA 3 (OK)#

#Coeficientes de la función objetivo (ganancias por vehículo)#
profits <- c(870, 1120, 1200)

#Restricciones de tiempo de fabricación de motores#
#3*x1 + 2*x2 + 4*x3 <= 120#
motor_time <- c(3, 2, 4)

#Restricciones de tiempo de fabricación de carrocerías#
#1*x1 + 2*x2 + 3*x3 <= 80#
body_time <- c(1, 2, 3)

#Restricciones de tiempo en talleres para cada tipo de vehículo#
#Gasolina: 2*x1 <= 96#
#Lujo: 3*x2 <= 102#
#Súper Lujo: 2*x3 <= 40#
gasoline_time <- c(2, 0, 0)
luxury_time <- c(0, 3, 0)
super_luxury_time <- c(0, 0, 2)

#Lado derecho de las restricciones#
rhs <- c(120, 80, 96, 102, 40)

#Signos de las restricciones#
directions <- c("<=", "<=", "<=", "<=", "<=")

#Matriz de restricciones combinadas#
constraints <- rbind(motor_time, body_time, gasoline_time, luxury_time, super_luxury_time)

#Resolver el problema de maximización usando lp#
solution <- lp("max", profits, constraints, directions, rhs)

#Mostrar los resultados#
if(solution$status == 0){
  cat("Ganancia total máxima:", solution$objval, "\n")
  
  #Mostrar la cantidad óptima de vehículos a producir#
  cat("Cantidad óptima de vehículos a producir (x1, x2, x3):\n")
  print(solution$solution)
} else {
  cat("No se encontró una solución factible\n")
}

#PROBLEMA 4 (OK)#

#Definir los coeficientes de la función objetivo (ganancias por técnico)#
ganancias <- c(6, 6, 7, 7, 10, 10)

#Definir las restricciones en una matriz#
restricciones <- matrix(c(
  2, 0, 0, 0, 2, 0,    #Restricción Técnico A#
  0, 2.5, 3, 0, 0, 0,  #Restricción Técnico B#
  0, 0, 0, 0, 0, 4,    #Restricción Técnico C#
  0, 0, 0, 3.5, 0, 0,  #Restricción Técnico D#
  1, 1, 0, 0, 0, 0,    #Máximo Producto 1#
  0, 0, 1, 1, 0, 0,    #Máximo Producto 2#
  0, 0, 0, 0, 1, 1     #Máximo Producto 3#
), nrow = 7, byrow = TRUE)

#Definir los lados derechos de las restricciones (horas máximas y límites de producción)#
capacidades <- c(120, 120, 120, 120, 80, 50, 50)

#Definir las direcciones de las restricciones (<= para todas)#
direcciones <- rep("<=", 7)

#Resolver el problema de programación lineal#
resultado <- lp("max", ganancias, restricciones, direcciones, capacidades)

#Mostrar el resultado#
print("Ganancia total:")
print(resultado$objval)

print("Cantidad de productos fabricados por técnico:")
print(resultado$solution)

#PROBLEMA 5 (OK)#

#1. Coeficientes de la función objetivo (costos unitarios)#
#El orden de las variables es: x11, x13, x14, x21, x22, x31, x32, x33, x34#
f.obj <- c(132, 97, 103, 85, 91, 106, 89, 100, 98)

#2. Matriz de restricciones#

#Restricciones de capacidad#
#x11 + x13 + x14 <= 135 (S1)#
#x21 + x22 <= 56 (S2)#
#x31 + x32 + x33 + x34 <= 93 (S3)#

#Restricciones de demanda#
#x11 + x21 + x31 = 62 (T1)#
#x22 + x32 = 83 (T2)#
#x13 + x33 = 39 (T3)#
#x14 + x34 = 91 (T4)#

f.con <- matrix(c(
  #Restricciones de capacidad#
  1, 1, 1, 0, 0, 0, 0, 0, 0,  #S1#
  0, 0, 0, 1, 1, 0, 0, 0, 0,  #S2#
  0, 0, 0, 0, 0, 1, 1, 1, 1,  #S3#
  
  #Restricciones de demanda#
  1, 0, 0, 1, 0, 1, 0, 0, 0,  #T1#
  0, 0, 0, 0, 1, 0, 1, 0, 0,  #T2#
  0, 1, 0, 0, 0, 0, 0, 1, 0,  #T3#
  0, 0, 1, 0, 0, 0, 0, 0, 1   #T4#
), nrow = 7, byrow = TRUE)

#3. Direcciones de las restricciones (<= para capacidad, = para demanda)#
f.dir <- c("<=", "<=", "<=", "=", "=", "=", "=")

#4. Lado derecho de las restricciones (capacidades y demandas)#
f.rhs <- c(135, 56, 93, 62, 83, 39, 91)

#5. Resolver el problema de minimización#
result <- lp("min", f.obj, f.con, f.dir, f.rhs)

#6. Mostrar la solución óptima#
print(result$solution)

#7. Mostrar el valor de la función objetivo (costo mínimo total)#
print(result$objval)

#PROBLEMA 6#

#PROBLEMA 7 (OK)#

#Coeficientes de la función objetivo (beneficios por producto)#
objective <- c(40, 50)

#Restricciones del problema#
#a) Restricción de disponibilidad de nitrógeno: x1 + x2 <= 50#
nitrogen_constraint <- c(1, 1)

#b) Restricción de disponibilidad de hidrógeno: 3*x1 + 4*x2 <= 180#
hydrogen_constraint <- c(3, 4)

#c) Restricción de disponibilidad de cloro: x2 <= 40#
chlorine_constraint <- c(0, 1)

#Crear la matriz de restricciones#
constraints <- rbind(nitrogen_constraint, hydrogen_constraint, chlorine_constraint)

#Lado derecho de las restricciones#
rhs <- c(50, 180, 40)

#Signos de las restricciones#
directions <- c("<=", "<=", "<=")

#Resolver el problema de maximización usando lp#
solution <- lp("max", objective, constraints, directions, rhs)

#Mostrar los resultados#
if(solution$status == 0){
  cat("Beneficio total máximo:", solution$objval, "\n")
  
  #Mostrar la cantidad óptima de unidades a producir#
  cat("Cantidad óptima de unidades a producir (x1, x2):\n")
  print(solution$solution)
} else {
  cat("No se encontró una solución factible\n")
}

#PROBLEMA 8 (OK)#
#FIJAR COEFICIENTES DE LA FUNCIÓN OBJETIVO#
#El orden de las variables es X1A, X1B, X2A, X2B, X3A#
f.obj <- c(0, 0, 0, 3, 1.7)

#FIJAR COEFICIENTES DE LAS RESTRICCIONES EN UNA MATRIZ#
f.con <- matrix(c(1, 1, 0, 0, 0,        #Restricción 1: X1A + X1B <= 100000#
                  1.7, 0, -1, -1, 0,     #Restricción 2: X2A + X2B <= 1.7X1A#
                  0, 3, 1.7, 0, -1),     #Restricción 3: X3A <= 1.7X2A + 3X1B - X2B#
                nrow = 3, byrow = TRUE)

#ESTABLECER DIRECCIÓN O SENTIDO DE LOS SÍMBOLOS DE LAS DESIGUALDADES#
f.dir <- c("<=", ">=", ">=")

#ESTABLECER COEFICIENTES DEL LADO DERECHO (RHS) DE LAS INECUACIONES#
f.rhs <- c(100000, 0, 0)

#DETERMINAR LA SOLUCIÓN ÓPTIMA#
result <- lp("max", f.obj, f.con, f.dir, f.rhs)

#Mostrar la solución óptima#
print(result$solution)

#Mostrar el valor de la función objetivo (ganancias totales)#
print(result$objval)
