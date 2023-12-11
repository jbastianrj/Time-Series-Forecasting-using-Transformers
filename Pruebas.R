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
#p-value = 0.04015 >> NO LINEAl 

#W03
#Diferenciamos una vez y haces la prueba nuevamente.
#ESCALAR DA EL MISMO P VALUE

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

#W11
#Airlane Passengers

ts <- read.csv('airline.csv')
ts <- ts(ts, frequency = 12)
plot(ts)
terasvirta.test(ts) #SI ES MUY CERCANO
ts_scaled <- scale(ts) 
terasvirta.test(ts_scaled) #SI ES MUY CERCANO
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff) #NO
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #NO
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 


#W21
#RESERVA FEDERAL

ts <- read.csv('reserva.csv')
ts <- ts(ts, frequency = 12)
plot(ts)
terasvirta.test(ts) #SI
ts_scaled <- scale(ts) 
terasvirta.test(ts_scaled) #SI
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff) #NO
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #NO
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 

#W31
#COLOMBIA DENGUE

ts <- read.csv('colombia.csv')
ts <- ts(ts, frequency = 52)
plot(ts)
terasvirta.test(ts) #NO
ts_scaled <- scale(ts) 
terasvirta.test(ts_scaled) #NO
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff) #SI
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #SI
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 


#W41
#BANGKOK DENGUE

ts <- read.csv('bangkok.csv')
ts <- ts(ts, frequency = 12)
plot(ts)
terasvirta.test(ts) #NO
ts_scaled <- scale(ts) 
terasvirta.test(ts_scaled) #NO
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff) #NO
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #NO
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #SI


#W51
#JAPAN FLU

ts <- read.csv('japan.csv')
ts <- ts(ts, frequency = 52)
plot(ts)
terasvirta.test(ts) #NO
ts_scaled <- scale(ts) 
terasvirta.test(ts_scaled) #NO
ts_diff <- ts #diff(ts,differences = 1) # NO SE DIFERENCIA QUEDA IGUAL
terasvirta.test(ts_diff) #NO
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #SI
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 

#W61
#NETFLIX STOCK 

ts <- read.csv('NFLX.csv')
ts <-as.data.frame(ts)
ts <- ts(ts$Close, frequency = 260) #Días hábiles en un año
plot(ts)
terasvirta.test(ts) #SI
ts_scaled <- scale(ts)
ts_scaled <- ts(ts_scaled, frequency = 260)
terasvirta.test(ts_scaled) #SI
plot(ts_scaled)
ts_diff <- diff(ts,differences = 2)
terasvirta.test(ts_diff) #NO
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #SI
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 



#W71  
#Sunspots Daily 

ts <- read.csv('SunspotsDaily.csv', header = FALSE, sep = ';')
plot(ts$V5)
ts<-ts$V5[73874:74659]
#Solo tomamos 265 datos
plot(ts)
ts <- ts(ts, frequency = 365) #Días
terasvirta.test(ts) #SI
ts_scaled <- scale(ts)
ts_scaled <- ts(ts_scaled, frequency = 365)
terasvirta.test(ts_scaled) #SI
ts_diff <- diff(ts,differences = 1)
terasvirta.test(ts_diff) #SI
df_descompose_aditivo <- decompose(ts, type = 'additive')
terasvirta.test(na.omit(df_descompose_aditivo$random)) #NO
df_descompose_mult <- decompose(ts, type = 'multiplicative')
terasvirta.test(na.omit(df_descompose_mult$random)) #NO 
