Ejercicios Semana 6
================
Any Ocampo Dávila

Resolución de Ejercicios

**PARTE 1**

Cargar las variables almacenadas en el siguiente archivo Rdata

``` r
load("C:/Users/ANY/Desktop/IX/PROGRA II/CLASES R/data/ei1012-1516-la-s1-datos.RData")
library(tidyverse)
library(dplyr)
library(Biodem)
```

**1.Calcula los valores numéricos aproximados de**

1.  (0.3.0.15)/0.3.0.15+0.2.0.8+0.5.0.12

*Respuesta*

``` r
m<-((0.3*0.15)/(0.3*0.15+0.2*0.8+0.5*0.12))
m
```

    ## [1] 0.1698113

2.  *Respuesta*

``` r
e<-2.71828182846
fact<-c(6*5*4*3*2*1)
(5**6/fact)*(e**-5)
```

    ## [1] 0.1462228

3.  *Respuesta*

``` r
N<-20
n<-7
fact01<-factorial(N)/(factorial(n)*(factorial(N-n)))
res<-fact01*(0.4**7)*(0.6**13)
res
```

    ## [1] 0.1658823

**2.Realizar la siguiente suma**

1.  *Respuesta*

``` r
suma<-sum(1:1000)
suma
```

    ## [1] 500500

b.1+2+4+8+16+…+1024

*Respuesta*

``` r
resb<-(2**11)-1
resb
```

    ## [1] 2047

**3.El vector *grupo* representa el grupo al que pertenece una serie de
alumnos"**

a.¿Cuántos elementos tiene?

*Respuesta*

``` r
length(grupo)
```

    ## [1] 192

b.¿En qué posiciones del vector esta la letra A"

*Respuesta*

``` r
which(grupo=="A")
```

    ##  [1]   2   8  17  21  28  84 101 108 111 115 123 136 190 192

**4. El vector *nota* representa la nota de un examen de los alumnos que
están en los grupos del vector *grupo***

a.¿Cuanto suman todas las notas?

*Respuesta*

``` r
sum(nota)
```

    ## [1] 962

b.¿Cual es la media aritmética de todas las notas?"

*Respuesta*

``` r
mean(nota)
```

    ## [1] 5.010417

c.¿En qué posiciones están las notas mayores de 7.0?

*Respuesta*

``` r
which(nota>7.0)
```

    ## [1]  81 103 120 151

d.Visualiza las notas ordenadas de mayor a menor

*Respuesta*

``` r
sort(nota, decreasing = TRUE)
```

    ##   [1] 7.7 7.5 7.4 7.2 7.0 6.9 6.9 6.8 6.8 6.8 6.8 6.8 6.6 6.5 6.4 6.4 6.4 6.4
    ##  [19] 6.3 6.2 6.2 6.2 6.2 6.2 6.2 6.1 6.1 6.1 6.1 6.0 6.0 6.0 6.0 6.0 6.0 5.9
    ##  [37] 5.9 5.9 5.9 5.9 5.9 5.9 5.9 5.9 5.8 5.8 5.8 5.8 5.8 5.7 5.7 5.7 5.7 5.7
    ##  [55] 5.6 5.6 5.6 5.6 5.6 5.6 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5 5.5
    ##  [73] 5.5 5.4 5.4 5.4 5.4 5.4 5.4 5.4 5.4 5.3 5.3 5.3 5.3 5.2 5.2 5.2 5.2 5.2
    ##  [91] 5.2 5.2 5.1 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 5.0 4.9 4.9 4.9 4.9 4.9 4.9
    ## [109] 4.8 4.8 4.8 4.8 4.8 4.8 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.7 4.6 4.6
    ## [127] 4.6 4.6 4.5 4.5 4.5 4.5 4.5 4.5 4.4 4.4 4.4 4.4 4.4 4.4 4.4 4.3 4.3 4.3
    ## [145] 4.2 4.2 4.2 4.2 4.2 4.2 4.2 4.2 4.1 4.1 4.1 4.1 4.1 4.0 4.0 4.0 4.0 4.0
    ## [163] 4.0 3.9 3.9 3.8 3.8 3.8 3.7 3.7 3.7 3.7 3.6 3.6 3.6 3.5 3.4 3.4 3.4 3.4
    ## [181] 3.2 3.2 3.2 3.1 3.0 2.9 2.9 2.9 2.7 2.6 2.5 1.7

e.¿En qué posición está la nota máxima?

*Respuesta*

``` r
which(nota==max(nota))
```

    ## [1] 120

**5. A partir de los vectores *grupo* y *nota* definidos**

a.Suma las notas de los 10 primeros alumnos del vector

*Respuesta*

``` r
sum(nota[1:10])
```

    ## [1] 51.8

b.¿Cuantos alumnos hay del grupo C?

*Respuesta*

``` r
C<-sum(grupo =="C")
C
```

    ## [1] 39

c.¿Cuantos alumnos han aprobrado?

*Respuesta*

``` r
aprob <- ifelse(nota>=5.0, "Aprobado", "Desaprobado")
table(aprob)
```

    ## aprob
    ##    Aprobado Desaprobado 
    ##         102          90

``` r
sum(nota>=5.0)
```

    ## [1] 102

d.¿Cuantos alumnos del grupo B han aprobado?

*Respuesta*

-Paso1: Convertir vector a dataframe

``` r
df<- data.frame(grupo, nota)
head(df)
```

    ##   grupo nota
    ## 1     B  4.9
    ## 2     A  5.4
    ## 3     E  5.2
    ## 4     D  6.8
    ## 5     B  5.0
    ## 6     D  6.2

-Paso2: Grupo B y Aprobados

``` r
aprob<-subset(df ,grupo == "B" & nota >=5)
aprob01<-as_tibble(aprob)
length(aprob01$grupo)
```

    ## [1] 12

e.¿Que porcentaje de alumnos del grupo C han aprobado?

*Respuesta*

``` r
aprobC<-subset(df ,grupo == "C" & nota >=5)
aprobC1<-length(aprobC$nota)*100/C
aprobC1
```

    ## [1] 58.97436

f.¿De qué grupos son la máxima y minima notas de toda la muestra?

*Respuesta*

``` r
df[df$nota==max(df$nota)|df$nota== min(df$nota), ] 
```

    ##     grupo nota
    ## 120     E  7.7
    ## 142     B  1.7

``` r
df[df$nota %in% c(max(df$nota), min(df$nota)), ]
```

    ##     grupo nota
    ## 120     E  7.7
    ## 142     B  1.7

g.Nota media de los alumnos de grupo A y B, juntos, considerando solo a
los que han aprobado.

*Respuesta* -Sol1

``` r
df02<-subset(df,grupo=="A"| grupo=="B")
df03<-df02[df02$nota>=5.0, ] 
media<-mean(df03$nota)
```

-Sol2

``` r
mean(df[df$grupo %in% c("A","B") & df$nota>=5, ]$nota)
```

    ## [1] 5.825

**6. Calcula el percentil 66 de las notas de todos los alumnos,y también
de los alumnos del grupo C.**

*Respuesta*

``` r
total<-quantile(df$nota , probs=0.66)
total
```

    ## 66% 
    ## 5.5

``` r
alum_C <- df[df$grupo=="C", ]
groupC<-quantile(alum_C$nota, probs=0.66)
groupC
```

    ##   66% 
    ## 5.808

**7. Un alumno tiene una nota de 4.9.**

-¿Que porcentaje,del total de alumnos, tiene una nota menor o igual que
la suya?

*Respuesta*

``` r
total<-length(df$grupo) 
cal<-df[df$nota<=4.9 , ]

df07<-(length(cal$grupo)/total)*100
df07
```

    ## [1] 46.875

-¿ Y qué porcentaje tiene una nota mayor o igual que la suya?

``` r
cal01<-df[df$nota>=4.9 , ]
df007<- (length(cal01$grupo)/total)*100
df007
```

    ## [1] 56.25

**8. Realiza el gráfico de diagramas de caja de las notas de cada grupo,
para poder comparar el nivel de cada uno de ellos.**

*Respuesta*

``` r
boxplot(nota ~ grupo, data= df , col=rainbow(12),
        xlab = "Grupos de clase", ylab = "Notas de alumnos",
        main= "Diagrama de Cajas")
```

![](Rmarkdown1_files/figure-gfm/unnamed-chunk-26-1.png)<!-- --> **9.Si
la variable *conc* recoge la concentración de plomo (en ppm) en el aire
de cierta zona durante un día completo.**

a.¿Cuál ha sido la concentración máxima?

*Respuesta*

``` r
max(conc)
```

    ## [1] 47.34

b.¿En cuántos de los muestreos se ha superado la concentración de 40.0
ppm?

*Respuesta*

``` r
sum(conc> 40.0)
```

    ## [1] 61

c.¿Cuál ha sido la concentración media del día?

*Respuesta*

``` r
mean(conc)
```

    ## [1] 24.07229

d.¿Cuáles fueron las 10 mediciones más bajas del día?

*Respuesta*

``` r
sort(conc)[1:10]
```

    ##  [1] 0.93 1.07 1.77 2.03 2.58 2.73 2.75 2.88 2.88 2.91

e.Si la primera medida fue a las 00:00. ¿A qué hora del día se alcanzó
la concentración máxima?

*Respuesta*

``` r
df9<- data.frame(conc)
length(hora<-rep(0:23, times = 12))
```

    ## [1] 288

``` r
med<-mutate(df9,hora)
cmax<-med[med$conc==max(med$conc),]
cmax
```

    ##      conc hora
    ## 142 47.34   21

**PARTE 2**

1.  Graficar los puntos
    (1,1),(2,4),(3,6),(4,8),(5,25),(6,36),(7,49),(8,61),(9,81),(10,100)
    en un plano utilizando Rstudio.

*Respuesta*

``` r
x<-c(1:10)
y<-c(1,4,6,8,25,36,49,61,81,100)

plot(x,y)
```

![](Rmarkdown1_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

2.  Ingresar la matriz A en RStudio

*Respuesta*

``` r
A01<- c(1, 2, 3, 4, 2, 4, 6, 8, 3, 6, 9, 12)
A<-matrix(A01, nrow = 4, ncol=3)
A
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    2    3
    ## [2,]    2    4    6
    ## [3,]    3    6    9
    ## [4,]    4    8   12

3.  Ingresar la matriz identidad de tamaño 3I

*Respuesta*

``` r
I<- diag(1,nrow = 3)
I
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    0    0
    ## [2,]    0    1    0
    ## [3,]    0    0    1

4.  Crea una función que cree una matriz nula ingresando las dimensiones

*Respuesta*

``` r
nula<- function(n){
  M<-diag(n)
  for (i in 1:n){
    M[i,i]=0
  }
  return(M)
} 
nula(3)
```

    ##      [,1] [,2] [,3]
    ## [1,]    0    0    0
    ## [2,]    0    0    0
    ## [3,]    0    0    0

5.Modificar la matriz *diag(4)*, para que se parezca a la matriz B

*Respuesta*

``` r
matrix05<- diag(4)

mat<- c(-1,1,2,3)
mat05<- diag(mat, nrow = 4,ncol=4)

"sumamos matrices"
```

    ## [1] "sumamos matrices"

``` r
B<- matrix05 + mat05
B
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    0    0    0    0
    ## [2,]    0    2    0    0
    ## [3,]    0    0    3    0
    ## [4,]    0    0    0    4

6.  Obtener la matriz transpuesta de A (ejercicio 2)

*Respuesta*

``` r
trans<- t(A)
trans
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    2    3    4
    ## [2,]    2    4    6    8
    ## [3,]    3    6    9   12

7.  Realizar las siguientes operaciones A + B, A-B, 3B y *Respuesta*

<!-- -->

8.  Crea una funcion para calcular P\*\*6 P

*Respuesta*

``` r
P<-cbind(c(1,-2,1),c(2,4,0),c(3,-2,1))
pot_P<- mtx.exp(P,6)
pot_P
```

    ##       [,1]  [,2]  [,3]
    ## [1,] -1792    24 -2824
    ## [2,]  -464 -2416 -1344
    ## [3,]  -648   440  -912

9.  Resolver el sistema de ecuaciones

3x-y+z= -1 9x-2y+z= -9 3x+y-2z= -9

*Respuesta*

``` r
a1 <- rbind(c(3,-1,1),c(9,-2,1),c(3,1,-2))
b1 <- c(-1,-9,-9)
solve(a1)
```

    ##      [,1]       [,2]      [,3]
    ## [1,]    1 -0.3333333 0.3333333
    ## [2,]    7 -3.0000000 2.0000000
    ## [3,]    5 -2.0000000 1.0000000

``` r
res9<-solve(a1)%*%b1
```

10. Utilizando la ayuda de R, investigue para que sirven las funciones
    *eigen()* y *det()*

*Respuesta*

eigen(a1) “Permite calcular los autovalores y los autovectores de una
matriz” det(a1) “Permite calcular la determinante de una matriz”

11. Considerando las matrices

*Respuesta*

     

12. Considere ^β= (X<sup>t.X)</sup>-1.X^t.Y

**Respuesta**

13. Corre el siguiente código para cargar los vectores *year* y *co2* en
    memoria

**Respuesta**

``` r
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)
```

\*El vector *co2* contiene medidas de **CO2** en la atmósfera, en
unidades de ppm, durante el periodo 1959-1997. El vector *year* contiene
sus años correspondientes."

``` r
archivo<- as_tibble(data.frame(co2, year))
archivo
```

    ## # A tibble: 39 x 2
    ##      co2  year
    ##    <dbl> <dbl>
    ##  1  316.  1959
    ##  2  317.  1960
    ##  3  317.  1961
    ##  4  318.  1962
    ##  5  319.  1963
    ##  6  319.  1964
    ##  7  320.  1965
    ##  8  321.  1966
    ##  9  322.  1967
    ## 10  323.  1968
    ## # ... with 29 more rows

\*Calcular un vector de diferencias de CO2 entre años consecutivos, que
sería:"

\-***CO2*** en 1960 menos ***CO2*** en 1959 -**CO2** en 1961 menos
***CO2***en 1960 -y asi sucesivamente…

**Respuesta**

``` r
vec<-co2-lag(co2)
rest<-lag(co2)
dt<-data.frame(year,co2,rest)
dt01<-mutate(dt, dif = co2-rest)
dt01$dif
```

    ##  [1]        NA 0.9216667 0.7375000 0.8125000 0.5350000 0.6300000 0.4100000
    ##  [8] 1.3375000 0.8100000 0.8700000 1.5691667 1.0583333 0.6375000 1.1383333
    ## [15] 2.2183333 0.5675000 0.9066667 1.0000000 1.7441667 1.6058333 1.3450000
    ## [22] 1.8341667 1.2458333 1.1983333 1.6491667 1.6383333 1.4791667 1.2491667
    ## [29] 1.7758333 2.5625000 1.4408333 1.2825000 1.4416667 0.8133333 0.7041667
    ## [36] 1.8841667 2.0341667 1.7725000 1.1308333

\*Crear un plot con lineas y puntos mostrando las diferencias
consecutivas de  
CO2 en función del tiempo (1960, 1961, etc…), en negrita" **Respuesta**

    ggplot(dt01 = year, mapping = aes(x = dif, y = year)) +
      geom_point(aes(size = count), alpha = 1/3) +
      geom_smooth(se = FALSE)

\*La diferencia de concentración de **CO2** entre 2020 y 2019 fue igual
a 2.64. Agregar un punto rojo representando esa diferencia al plot ya
creado (usar una forma diferente, como pch=4)

**Respuesta**

**14.**

\*Lee el archivo *rainfall.csv* como un *data.frame*

\*Calcula e imprime un vector con los nombres de las estaciones donde al
menos uno de los meses tiene una precipitación superior a 180mm.

**Respuesta**

**PARTE 3**

**15. Manipule los dataframe según se solicite**

Se tiene el conjuntos de datos de precipitación diaria (período 1980 -
2013) de ciertas estaciones meteorológicas (**raingaugeDataset.csv**),
donde cada una de estas están asociadas a un código único (**p.e.
qc00000208**). Asimismo, se tiene una lista con los nombres, códigos,
coordenadas y elevación de cada una de las estaciones
(**listRaingauge.csv**)

\*\_\_GRUPO 6:\_\_CHULUCANAS

De lo descrito anteriormente, se solicita:

a.Determine la cantidad de **missing values** de la serie de tiempo a
paso diario.

b.Calcule la serie de tiempo de precipitación **acumulada mensual** (si
el \# de días con missing values, en un mes, supera el 10%, la
precipitación acumulada mensual será considerado como un **NA**).

c.Determine la cantidad de **missing values** de la serie de tiempo a
paso mensual.

d.Cree una función que calcule, a partir de los datos de precipitación
mensual, la **climatología (Ene-Dic)** para el **período 1980-2010.**

e.Poltear (boxplot) la variabilidad de los valores mensuales (Ene-Dic)
para el período 1980-2013
