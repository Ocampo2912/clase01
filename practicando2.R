##MATRIZ
"/Una matriz es una estructura bidimensional. Las filas son horizontales y las 
columnas son verticales. Una matriz de 4 por 3 (4 x 3), por ejemplo, tiene 4 filas 
y 3 columnas. Las matrices se crean comúnmente usando tablas de datos numéricos 
como las de una hoja de cálculo de Excel o un archivo csv./"

vector01 <- c(1,2,4,7,10,11,12,19,26)
vector01
dim(vector01)

#Dado que la variable es un vector, no tiene un atributo dim 
#(entonces es simplemente NULL).

"/¿Qué ocurre si le damos a vector01 un atributo dim?/"

dim(vector01) <- c(3, 3)
vector01
class(vector01)

#Un método más directo para crear la misma 
#matriz utiliza la función matrix.

matrix01 <- matrix(vector01, nrow = 3, ncol = 3, byrow = T)
matrix01

x <- matrix(1:4, nrow = 2)
x[4] <-1000
x






arboles <- c("Tipuana tipu", "Myrsine andina", "Salix humboldtiana")
matrix02 <- cbind(arboles, matrix01) # column bind o juntar por columna.
matrix02

#Esto se llama coerción implícita porque no lo hemos pedido. Solo sucedió. 
#Sin embargo, todavía se desea trabajar con diferentes tipos de datos.

class(matrix02)
dim(matrix02)
rownames(matrix02)
colnames(matrix02)


##DATAFRAMESSSSSS

"/Si bien un data frame parece una tabla simple, de 
hecho es una lista de vectores de la misma longitud/"

"La principal diferencia es que un data 
frame permite tipos de datos mixtos (por ejemplo, numérico, lógico, caracter). Esto les 
permite almacenar diferentes tipos de variables, lo cual es muy útil en el análisis 
estadístico."

"Las matrices se usan principalmente para almacenar datos numéricos, y se pueden usar 
para álgebra matricial.


Matrices y Data Frames, ambos representan tipos de datos rectangulares, 
lo que significa que se usan para almacenar datos tabulares, con filas y columnas.

La principal diferencia, es que las matrices solo pueden contener una 
única clase de datos (al igual que los vectores), mientras que los dataframes 
pueden consistir de muchas clases diferentes de datos."


# se crea un data frame (df)
df01 <- data.frame(arboles, matrix01)
df01
df01$arboles[2]
class(df01)

# podemos cambiar el nombre a las variables (columnas)
colnames(df01) <- c("nombre_cientifico", "circunferencia", "diametro_copa", "altura" )
df01


"Conjunto de datos en R"

#Trabajemos con el dataset iris (Edgar Anderson’s Iris Data)

str(iris)

# todas las observaciones de la columna 'Species'
iris[, "Species"]

# Se utiliza el caracter ‘$’ para acceder a los campos o columnas.
iris$Species

#Cuando queremos extraer datos del data frame según una condicion, esto se complica.

head(iris[iris$Species == "setosa", ])

#Así mismo, si se desea obtener las observaciones donde el ancho del sépalo sea menor o igual a 3 y la especie sea “setosa”.

head(iris[iris[, "Sepal.Width"] <= 3 & iris[, "Species"] == "setosa", ])

###SUBSETTING

"La función subset nos facilita filtrar datos cuando queremos que se 
cumplan ciertas condiciones."

subset(iris, Sepal.Width <= 3 & Species == "setosa")

df12<-data.frame(
  x=c(1,2,3),
  y=c("one","two")
)
(x$3)



























