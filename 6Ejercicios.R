##EJERCICIOS 
##########################################PARTE 1 #################################################################

load("data/ei1012-1516-la-s1-datos.RData")
nota
grupo
library(tidyverse)
library(readr)
library(tidyverse)
library(dplyr)

N<-20
n<-7
fact01<-factorial(N)/(factorial(n)*(factorial(N-n)))
res<-fact01*(0.4**7)*(0.6**13)
##"3.El vector grupo representa el grupo al que pertenece 
##una serie de alumnos"
"?Cuantos elementos tiene?"
length(grupo)
"?en que posiciones del vector esta la letra A"
which(grupo=="A")
##4. El vector nota representa la nota de un examen 
#de los alumnos que est?n en los grupos del vector grupo
"a.?Cuanto suman todas las notas?" 
sum(nota)
"b.?Cual es la media aritm?tica de todas las notas?"
mean(nota)
"c.?En qu? posiciones est?n las notas mayores de 7.0?"
which(nota>7.0)
"d.Visualiza las notas ordenadas de mayor a menor"
sort(nota, decreasing = TRUE)
"e.?En qu? posici?n est? la nota m?xima?"
which(nota==max(nota))

### 5. A partir de los vectores grupo y nota definidos.
"a.Suma las notas de los 10 primeros alumnos del vector"
sum(nota[1:10])
#ejemplo
a<-c(1,5,3,4)
sum(a[1:3])

"b.?Cuantos alumnos hay del grupo C?"

c<-sum(grupo =="C")
c

"c.?Cuantos alumnos han aprobrado?"

aprob <- ifelse(nota>=5.0, "Aprobado", "Desaprobado")
table(aprob)
sum(nota>=5.0)

"d.?Cuantos alumnos del grupo B han aprobado?"
#convertir vector a daaframe

df<- data.frame(grupo, nota)
df

#grupo B y aprobados
aprob<-subset(df ,grupo == "B" & nota >=5)
aprob01<-as_tibble(aprob)
dim(aprob01)

"e.?Que porcentaje de alumnos del grupo C han aprobado?"

aprobC<-subset(df ,grupo == "C" & nota >=5)
#aprobC1<-as_tibble(aprobC)
aprobC1<-length(aprobC$nota)*100/C
aprobC1

"f.?De qu? grupos son la m?xima y minima notas de toda la muestra?"

df[df$nota==max(df$nota)|df$nota== min(df$nota), ] 
df[df$nota %in% c(max(df$nota), min(df$nota)), ]

"g. Nota media de los alumnos de grupo A y B, juntos, considerando solo a los que han aprobado."

df02<-subset(df,grupo=="A"| grupo=="B")
df03<-df02[df02$nota>=5.0, ] 
length(df03$grupo)
media<-mean(df03$nota)



mean(df[df$grupo %in% c("A","B") & df$nota>=5, ]$nota)

##6. Calcula el percentil 66 de las notas de todos los alumnos,y 
# tambien de los alumnos del grupo C. 

total<-quantile(df$nota , probs=0.66)
total

alum_C <- df[df$grupo=="C", ]
alum_C$nota

groupC<-quantile(alum_C$nota, probs=0.66)


## 7. Un alumno tiene una nota de 4.9 
#?Que porcentaje, del total de alumnos, tiene una nota menor o igual que la suya?

total<-length(df$grupo) 
cal<-df[df$nota<=4.9 , ]#as_tibble(df[df$nota<=4.9 , ])

df07<-(length(cal$grupo)/total)*100
df07

"df %>% mutate(prop=prop.table(nota)) #porcentajes por columna
as_tibble(prop.table(nota)[df$nota <= 4.9])"

#? Y qu? porcentaje tiene una nota mayor o igual que la suya?

cal01<-df[df$nota>=4.9 , ]
df007<- (length(cal01$grupo)/total)*100
df007
## 8.  Realiza el gr?fico de diagramas de caja de las notas de cada grupo, para poder comparar 
#el nivel de cada uno de ellos.


boxplot(nota ~ grupo, data= df , col=rainbow(12),
        xlab = "Grupos de clase", ylab = "Notas de alumnos",
        main= "Diagrama de Cajas")


##9.Si la variable conc recoge la concentraci?n de plomo (en ppm) en el aire de cierta zona 
#durante un d?a completo.

conc

"?Cu?l ha sido la concentraci?n m?xima?"

max(conc)

"?En cu?ntos de los muestreos se ha superado la concentraci?n de 40.0 ppm?"

sum(conc> 40.0)

"?Cu?l ha sido la concentraci?n media del d?a?"

mean(conc)

"?Cu?les fueron las 10 mediciones m?s bajas del d?a?"

sort(conc)[1:10]

"Si la primera medida fue a las 00:00. ?A qu? hora del d?a se alcanz? la concentraci?n m?xima?"

df9<- data.frame(conc)
length(hora<-rep(0:23, times = 12))
med<-mutate(df9,hora)
cmax<-med[med$conc==max(med$conc),]
cmax

##########################################PARTE 2 #################################################################

#1. Graficar los puntos en un plano con Rstudio 

x<-c(1:10)
y<-c(1,4,6,8,25,36,49,61,81,100)

plot(x,y)

#2. Ingresar la matriz A en RStudio 

A01<- c(1, 2, 3, 4, 2, 4, 6, 8, 3, 6, 9, 12)
A<-matrix(A01, nrow = 4, ncol=3)

#3. Ingresar la matriz identidad de tama?o 3I 

I<- diag(1,nrow = 3)

#4. Crea una funci?n que cree una matriz nula ingresando las dimensiones

#nula<-matrix(0, nrow = 3, ncol = 3)

nula<- function(n){
  M<-diag(n)
  for (i in 1:n){
    M[i,i]=0
  }
  return(M)
} 

nula(3)



#5.Modificar la matriz diag(4), para que se parezca a la matriz B

matrix05<- diag(4)

mat<- c(-1,1,2,3)
mat05<- diag(mat, nrow = 4,ncol=4)

"sumamos matrices"

B<- matrix05 + mat05
B

#6. Obtener la matriz transpuesta de A (ejercicio 2)

trans<- t(A)
trans

#7. Realizar las siguientes operaciones A + B, A-B, 3B y AB

A
B

A+B
A-B

"NO SE PUEDE"


#8. Crea una funcion para calcular P**6 P 

install.packages("Biodem")
library(Biodem)
P<-cbind(c(1,-2,1),c(2,4,0),c(3,-2,1))
pot_P<- mtx.exp(P,6)
pot_P

#9. Resolver el sistema de ecuaciones 

"3x-y+z= -1
 9x-2y+z= -9
 3x+y-2z= -9"

a1 <- rbind(c(3,-1,1),c(9,-2,1),c(3,1,-2))
b1 <- c(-1,-9,-9)
solve(a1)

res9<-solve(a1)%*%b1

#10. Utilizando la ayuda de R, investigue para que sirven las funciones 
#eigen() y det()

eigen(a1) "Permite calcular los autovalores y los autovectores de una matriz"
det(a1) "Permite calcular la determinante de una matriz"

# 11. Considerando las matrices

matB <- c() "no sale" 

#12. Considere B= (Xt*X)**-1*Xt*Y

#13. Corre el siguiente c?digo para cargar los vectores year y co2 en memoria

library(tidyverse)
library(dplyr)
data(co2)
means = aggregate(co2, FUN=mean)
year = as.vector(time(means))
co2 = as.vector(means)

archivo<- as_tibble(data.frame(co2, year))
archivo

"El vector co2 contiene medidas de CO2 en la atm?sfera, en unidades de ppm,
durante el periodo 1959-1997. El vector year contiene sus a?os correspondientes."

"Calcular un vector de diferencias de CO2 entre a?os consecutivos, que ser?a:"

#CO2 en 1960 menos CO2 en 1959
#CO2 en 1961 menos CO2en 1960
# y asi sucesivamente 
vec<-co2-lag(co2)
rest<-lag(co2)
dt<-data.frame(year,co2,rest)
dt01<-mutate(dt, dif = co2-rest)
dt01$dif

"Crear un plot con lineas y puntos mostrando las diferencias consecutivas de  
CO2 en funci?n del tiempo (1960, 1961, etc.), en negrita"


ggplot(dt01 = year, mapping = aes(x = dif, y = year)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)



"La diferencia de concentraci?n de CO2 entre 2020 y 2019 fue igual a 2.64. 
Agregar un punto rojo representando esa diferencia al plot ya creado (usar una forma diferente, como pch=4)" 





#14. 
"Lee el archivo rainfall.csv como un data.frame"
datos <- readr::read_csv(file = 'data/rainfall.csv')
datos

"Calcula e imprime un vector con los nombres de las estaciones donde al menos uno de los meses tiene una 
precipitacion superior a 180mm."


preci<-datos %>% 
  filter(sep>180 |
           oct > 180|
           nov > 180|
           dec > 180|
           jan > 180|
           feb > 180|
           mar > 180|
           apr > 180|
           may > 180
           )

pp<- dplyr::select(preci, name)

pp_final<-c(pp)

load("data/ei1012-1516-la-s1-datos.RData")






datos <- data.frame(anio = year, nivel =round(co2,1))
datos <- datos %>% 
  dplyr::mutate(rest = c(nivel[2:39], 0)) %>% 
  dplyr::mutate(difer = rest - nivel)


result <- datos[1:38, 4]










##########################################PARTE 3 #################################################################

## 15. Manipule los dataframe según se solicite

 "Se tiene el conjuntos de datos de precipitación diaria (período 1980 - 2013) de ciertas estaciones 
meteorológicas (raingaugeDataset.csv), donde cada una de estas están asociadas a un código único (p.e. qc00000208). 
Asimismo, se tiene una lista con los nombres, códigos, coordenadas y elevación de cada una de las estaciones 
(listRaingauge.csv)."


nombres <- read_csv("data/listRaingauge.csv")
names(nombres)

estaciones <- read_csv("data/raingaugeDataset.csv")
names(estaciones)

#A cada grupo le corresponde la siguiente estación:
  
#Grupo 06: CHULUCANAS

grupo6<- nombres %>% 
  dplyr:: filter(NOM_EST=="CHULUCANAS") %>% 
  dplyr:: select(CODIGO) %>% 
  as.character()

data<-estaciones %>%  dplyr::select (date, all_of(grupo6)) %>%  
  mutate(fecha= as.Date(date, format= "%d/%m/%Y")) %>% 
  rename(lluvia = all_of(grupo6)) %>% 
  arrange(fecha)

tail(data)

#Comprobacion de la cantidad de elementos en el dataframe 

seq(as.Date("1980-01-01"), as.Date("2013-12-31"), by= "day") %>% 
  length()

"De lo descrito anteriormente, se solicita:"
  
#"a.Determine la cantidad de missing values de la 
#serie de tiempo a paso diario."

NA_value <- data %>% 
  mutate(cantidad_NA = sum(is.na(lluvia))) %>% 
  summarise(cantidad_NA = unique(cantidad_NA))

#unique(), elimina los duplicados en una variable

#"b.Calcule la serie de tiempo de precipitación acumulada mensual
#(si el # de días con missing values, en un mes, supera el 10%, 
#la precipitación acumulada mensual será considerado como un NA)."

preci_mes<-data %>% 
  group_by(fecha= str_sub(fecha, 1, 7)) %>% # str_sub() extrae cadenas
  mutate(valores_NA = sum(is.na(lluvia))*100/(n)) %>% 
  summarise(pp_acum= sum(lluvia, na.rm = T),
            valores_NA = unique(valores_NA)) %>% 
  mutate(pp_acum= ifelse ( valores_NA >= 10, NA, pp_acum),
         fecha = as.Date(sprintf("%1$s-01", fecha)),
         meses = str_sub(fecha, 6, 7)
         )
  
#ploteamos los valores

ggplot(data = preci_mes, mapping = aes(x=fecha, y= pp_acum)) +
  geom_line(color = "blue") + 
  labs(y ="Precipitacion (mm)", x= "Años analizados") + 
  ggtitle("Precipitación acumulada mensual") + 
  theme(plot.title = element_text(vjust = 2 , hjust = 0.5)) + 
  theme(axis.title.y = element_text( vjust = 2.5))+
  theme(axis.title.x = element_text(vjust = -0.5))

#"c.Determine la cantidad de missing values de la serie de tiempo 
#a paso mensual."

(NA_mensual<- sum(is.na(preci_mes$pp_acum)))

#"d.Cree una función que calcule, a partir de los datos de precipitación 
#mensual, la climatología (Ene-Dic) para el período 1980-2010."


clim <- preci_mes %>% 
  dplyr::filter(fecha >= "1980-01-01" & fecha < "2010-12-31") %>% # filtramos el periodo que nos pide
  group_by(fecha=str_sub(fecha, 6,7)) %>% 
  summarise(pp_media = mean(pp_acum, na.rm = T))

#generando la funcion 

clima <- function(año_inicial, año_final){
  año_inicial = as.Date(año_inicial, format = "%Y-%m-%d")
  año_final = as.Date(año_final, format = "%Y-%m-%d")
  
  clim <- preci_mes %>% 
    dplyr::filter(fecha >= año_inicial & fecha <=año_final) %>%
    group_by(fecha=str_sub(fecha, 6,7)) %>% 
    summarise(pp_media = mean(pp_acum, na.rm = T))
  
  return(clim)
}
(climatologia <- clima ("1980-01-01", "2010-12-31"))

#"e.Poltear (boxplot) la variabilidad de los valores mensuales
#(Ene-Dic) para el período 1980-2013."

(pp_month2 <- preci_mes %>% 
  dplyr:: filter(fecha >="1980-01-01" & fecha < "2013-12-31"))

ggplot(pp_month2, aes(meses, pp_acum)) +
  geom_boxplot(fill= "red") + 
  theme_bw()+
  scale_x_discrete(
    labels = month.abb) +
  ggtitle("Variablidad de la precipitación mensual (1980-2013)") + 
  theme(plot.title = element_text(vjust = 2, hjust = 0.5)) +
  labs(y="Precipitacion (mm)") +
  theme(axis.title = element_text(vjust = 2.5))








