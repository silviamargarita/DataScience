x <- rnorm(500)
y <- x + rnorm(500)
z <- matrix(rnorm(500)

# Dibujamos los datos
plot(x, y)

# Equivalente
M <- cbind(x, y)
plot(M)

# Ejemplos

par(mfrow = c(2, 3))

# Datos
mi_ts <- ts(matrix(rnorm(500), nrow = 500, ncol = 1),
            start = c(1950, 1), frequency = 12)

mis_fechas <- seq(as.Date("2005/1/1"), by = "month", length = 50)

mi_factor <- factor(mtcars$cyl)

fun <- function(x) x^2

# Diagrama de dispersión
plot(x, y, main = "Gráfico de dispersión")

# Gráfico de barras
plot(mi_factor, main = "Diagrama de barras")

# Diagrama de cajas
plot(mi_factor, rnorm(32), main = "Diagrama de cajas y bigotes")

# Gráfico de una serie temporal
plot(mi_ts, main = "Serie temporal")

# Time-based plot
plot(mis_fechas, rnorm(50), main = "Gráfico basado en fechas")

# Dibujar una función
plot(fun, 0, 10, main = "Trazar una función")

# Gráfico de correlación
plot(trees[, 1:3], main = "Matriz de correlación")

par(mfrow = c(1, 1))

