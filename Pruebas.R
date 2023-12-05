#Pruebas de no linelidad
#Terasvirta

library('tseries')
n <- 1000

x <- runif(1000, -1, 1)  # Non-linear in ``mean'' regression 
y <- x^2 - x^3 + 0.1*rnorm(x)
terasvirta.test(x, y)
# p-value < 2.2e-16 rechazamos la hipotesis nula >> No es lineal

## Is the polynomial of order 2 misspecified?
terasvirta.test(cbind(x,x^2,x^3), y)

## Generate time series which is nonlinear in ``mean''
x[1] <- 0.0
for(i in (2:n)) {
  x[i] <- 0.4*x[i-1] + tanh(x[i-1]) + rnorm(1, sd=0.5)
}
x <- as.ts(x)
plot(x)
terasvirta.test(x)
# p-value < 2.2e-16 rechazamos la hipotesis nula >> No es lineal

# INTEERPRETACIÓN: Si el valor p es suficientemente entonces no es lineal

#W01

getwd()
setwd("C:/Users/ramir/Desktop/MCE CURSOS/3 DEEP LEARNING/PROYECTO WAVELETS/data")
ts <- read.csv('inflacion.csv')
ts <- ts(ts, frequency = 4)
plot(ts)

terasvirta.test(ts)
#p-value = 0.04015 rechazamos la hipotesis nula >> No es lineal en media
#Interpretación si el pvalue es suficientemente bajo, entonces no es lineal 

#W02
# Estandarizar la serie de tiempo
ts_scaled <- scale(ts)
terasvirta.test(ts_scaled)
#p-value = 0.04015 >> NO LINEAL

#W03
#Diferenciamos una vez y haces la prueba nuevamente.

library('stats')
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff)
# Lineal

#W04
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random))
# p-value = 0.8113 >> LINEAL

#W05
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random))
# p-value = 0.01035 >> NO LINEAL 

#APLICACIONES CON OTRAS SERIES DE TIEMPO

#Airlane Passengers
