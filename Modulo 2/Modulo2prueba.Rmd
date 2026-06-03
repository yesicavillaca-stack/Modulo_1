---
title: "Algoritmos"
output:
  pdf_document: default
  word_document: default
  html_document: default
date: "2026-04-01"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Primeros comandos de R

R es un lenguaje muy similar a Matlab y permite el trabajo con matrices.

```{r}
A=38
A=40
B=60
C=B-A
C
```

```{r}
Y=40
alpha<-30
```

## Uso de data sets o base de datos internos de R

Usando el comando data en la consola obtenemos distintos datos ya cargados en la base de datos de R, estos datos estan dados en tablas de las cuales podemos elegir columnas especificas si escribimos \$ despues de el comando de informacion especifico y elegimos la columna de datos deseada

```{r cars}
summary(cars)
```

## Comando Plot

Es un comando que permite graficar cualquier fuente de datos que le asignemos ,teniendo también la posibilidad de asignar nombre a las variables o hacer cambios al gráfico.En caso de duda de como utilizar el comando podemos escribir **?plot** en la consola,lo cual abrirá una ventana que explicara en detalle el comando.

## funciones estadisticas

```{r}
z1<-rnorm(350,22,5)
z1

```

```{r}

w1<-length(z1)
w1
x1<-(500:849)
x1
plot(z1,x1) 
```

```{r}
hist(z1,main = "Histograma de edades",breaks = 50)
```

```{r}
density(z1)
```

```{r}
plot(density(z1))
```

## Ejercicio 1 de algoritmos

consigna: Los ultimos 3 cifras de mi DNI 007, consigna crear una variable que tenga ese numero

```{r}
DNI=007
```

Consigna: Crear un vector que tenga todos los numeros hasta el 007 enteros

```{r}
Secuencia_dni<-(1:DNI)
Secuencia_dni
```

## Ejercicio 2:

Calcular la suma de todos los valores del vector secuenciadni

```{r}
Sys.time()
total<-0
valor_final<-1000*length(z1)
for (i in 1:valor_final)
  total<-total+i
total
Sys.time()
```

## Ejercicio 3

Repetir el ejercicio anterior pero en python

```{python}
secuencia_dni = range(1, 8) 

total = 0
valor_final = len(secuencia_dni)

for i in secuencia_dni:
    total = total + i

print(total)
```

## Ejercicio 4

Hacer lo mismo en Julia

Dicho ejercicio no se puede hacer por la compatibilidad de Julia con posit cloud.

## Ejercicio 5

```{r}
Sys.time()
total<-0
valor_final<-1000*length(z1)
for (i in 1:valor_final)
  total<-total+i
total
Sys.time()
```

## Ejerjecio 6

Repetir el ejercicio anterior utilizando la cabeza de Gauss(camapana de gauss), para el caso del vector z1

```{r}
Sys.time()
Nt<-1000*length(z1)
Sgaus<-((Nt*(Nt+1))/2)
Sgaus
Sys.time()
```

## Ejercicio 7

```{r}
inicio_fibonaccir<-Sys.time()
fibonacci_recursivo <- function(n) {
  if (n <= 1) {
    return(n)
  } else {
    return(fibonacci_recursivo(n - 1) + fibonacci_recursivo(n - 2))
  }
}

# Para obtener una serie con este método, hay que usar un sapply
serie_recursiva <- sapply(0:9, fibonacci_recursivo)

print(serie_recursiva)

final_fibonaccir<-Sys.time()

tiempo_fibonaccir<-(final_fibonaccir-inicio_fibonaccir)

########################################################################################

inicio_fibonaccit<-Sys.time()

a <- 0
b <- 1
iteraciones <- 0

while (b <= 1000000) {
  siguiente <- a + b
  a <- b
  b <- siguiente
  iteraciones <- iteraciones + 1
}
final_fibonaccit<-Sys.time()

cat("El primer número mayor a 1,000,000 es:", b, "\n")
cat("Se necesitaron", iteraciones, "iteraciones.")

tiempo_fibonaccit<-(final_fibonaccit-inicio_fibonaccit)

cat("Tiempo con fibonacci_recursivo:", tiempo_fibonaccir, "segundos\n")
cat("Tiempo con fibonacci_iterativo:", tiempo_fibonaccit, "segundos\n")
```

## Ejercicio 8

Compara la performance de ordenación del método burbuja vs el método sort de R Mustra

```{r}
# Tomo una muestra de 10 números ente 1 y 100
set.seed(123)
x<-sample(1:100000,20000)
```

Metodo de burbuja

```{r}

# Creo una funcion para ordenar
burbuja <- function(x){
  n<-length(x)
  for(j in 1:(n-1)){
    for(i in 1:(n-j)){
      if(x[i]>x[i+1]){
        temp<-x[i]
        x[i]<-x[i+1]
        x[i+1]<-temp
      }
    }
  }
return(x)
}
res<-burbuja(x)
res
```

Metodo con sort de R

```{r}
sort(x)
```

```{r}
# 1. Cargar la librería (instálala con install.packages("microbenchmark") si no la tienes)
library(microbenchmark)

# 2. Ejecutar la comparación
 comparacion <- microbenchmark(
  burbuja = burbuja(x),
  sort_r  = sort(x),
  times   = 5 # Usamos pocas repeticiones porque burbuja es muy lento con 20k datos
)

# 3. Ver los resultados
print(comparacion)

# 4. Graficar la diferencia
boxplot(comparacion, main = "Burbuja vs Sort de R (20,000 datos)", unit = "ms")
```

Vemos que los diagramas se ven aplastados, aqui un

```{r}
# 1. Cargar librerías necesarias
library(microbenchmark)
library(ggplot2)

# 2. Reducimos la muestra a 500 para que el test no tarde horas
# y genere suficiente variabilidad para el gráfico
set.seed(123)
x_pequeña <- sample(1:1000,500)

# 3. Corremos el benchmark
# Aumentamos 'times' a 100 para que el violín tenga datos para "dibujarse"
comparacion <- microbenchmark(
  Burbuja = burbuja(x_pequeña),
  Sort_R  = sort(x_pequeña),
  times = 100
)

# 4. Graficar usando autoplot (que genera violines por defecto)
# O usando ggplot para total control:
autoplot(comparacion) + 
  aes(fill = expr) + 
  theme_minimal() +
  labs(title = "Distribución de tiempos (Escala Logarítmica)",
       y = "Tiempo [Log]", 
       x = "Algoritmo") +
  theme(legend.position = "none")
```

## Ejercicio 9

La penitencia de Newton

Consigna de trabajo : Desarrolla dos algoritmos que hagan el resultado de la suma de desde el número 1 hasta cierto número aleatoriamente elegido , por ejemplo para sumar desde 1 hasta 1 * 1010 y verifica cuál de los dos es más eficiente.

```{r}

xr<-sample(150,200,10)
nr<-100000*sample(xr,1)
#Con comando for
inicio_for <- Sys.time()
total<-0
valor_final<-nr
for (i in 1:valor_final)
  total<-total+i
total
fin_for <- Sys.time()
tiempo_for <- fin_for - inicio_for

inicio_gauss <- Sys.time()
Nt<-nr
Sgauss<-((Nt*(Nt+1))/2)
Sgauss
fin_gauss <- Sys.time()
tiempo_gauss <- fin_gauss - inicio_gauss

cat("Suma total:", Sgauss, "\n")
cat("Tiempo con bucle for:", tiempo_for, "segundos\n")
cat("Tiempo con método Gauss:", tiempo_gauss, "segundos\n")
```

## Ejercicio 10

El objetivo de K-means es minimizar la varianza intra-clúster, técnicamente conocida como Within-Cluster Sum of Squares (WCSS):

Donde $x_i$ es un punto de datos y $\mu_j$ es el centroide del clúster $C_j$. Sin embargo, el WCSS solo mide la cohesión. Para medir el desempeño real, solemos recurrir al Coeficiente de Silueta ($s_i$), que combina cohesión y separación

Cohesión ($a_i$): Distancia promedio entre el punto $i$ y todos los demás puntos de su mismo clúster.Separación ($b_i$): Distancia promedio entre el punto $i$ y los puntos del clúster más cercano.

Aplicacion del metodo K-means

```{r}
# =================================================================
# SCRIPT DE AGRUPAMIENTO K-MEANS Y EVALUACIÓN DE PERFORMANCE
# =================================================================

# --- 1. Instalación y Carga de Librerías ---
paquetes <- c("NbClust", "factoextra", "cluster", "ggplot2", "rattle")
instalados <- paquetes %in% installed.packages()[,"Package"]
if(any(!instalados)) install.packages(paquetes[!instalados])

library(NbClust)
library(factoextra)
library(cluster)
library(ggplot2)
library(rattle)

# --- 2. Carga y Preparación de Datos ---
data(wine, package = "rattle")
# Eliminamos la columna 1 (etiquetas reales) para que sea aprendizaje NO supervisado
df <- wine[, -1] 

# ESCALAMIENTO: Crucial para que todas las variables pesen igual
# Media = 0, Desviación Estándar = 1
df_scaled <- scale(df)

# --- 3. Determinación del K Óptimo (Consenso) ---
set.seed(2026)
cat("Calculando el número óptimo de clústeres por consenso...\n")
res_nb <- NbClust(df_scaled, distance = "euclidean", 
                  min.nc = 2, max.nc = 10, 
                  method = "kmeans", index = "all")

# Visualización del método del codo y silueta para confirmar
fviz_nbclust(df_scaled, kmeans, method = "wss") + labs(title = "Método del Codo")
fviz_nbclust(df_scaled, kmeans, method = "silhouette") + labs(title = "Método de Silueta")

# --- 4. Ejecución del Modelo K-means ---
# Usamos k = 3 basándonos en la naturaleza del dataset de vinos
k_elegido <- 3 
modelo_kmeans <- kmeans(df_scaled, centers = k_elegido, nstart = 25)

# --- 5. Visualización de los Clústeres ---
fviz_cluster(modelo_kmeans, data = df_scaled,
             ellipse.type = "convex",
             palette = "jco",
             main = "Mapa de Grupos (Proyección PCA)")

# --- 6. Medición de Performance (Gráfico de Violín) ---
# Calculamos la métrica de silueta
dist_matrix <- dist(df_scaled)
sil_info <- silhouette(modelo_kmeans$cluster, dist_matrix)
df_perf <- as.data.frame(sil_info)
df_perf$cluster <- as.factor(df_perf$cluster)

# Gráfico de Violín de Performance
ggplot(df_perf, aes(x = cluster, y = sil_width, fill = cluster)) +
  geom_violin(trim = FALSE, alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +
  geom_hline(yintercept = mean(df_perf$sil_width), 
             linetype = "dashed", color = "red", linewidth = 1) +
  labs(title = "Distribución de Performance por Clúster",
       subtitle = "Valores cercanos a 1 indican alta cohesión del grupo",
       x = "Clúster",
       y = "Coeficiente de Silueta") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")

# --- 7. Resumen de Calidad ---
cat("El promedio global de silueta es:", mean(df_perf$sil_width), "\n")
```
