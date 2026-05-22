
library(lubridate)
clima <- read.csv("CLIMATOLOGIA.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")
clima$Hora <- as.Date(clima$Hora, format = "%H:%M:%S")
clima$FechaHora <- as.POSIXct(paste(clima$Fecha, clima$Hora),
                              format ="%Y-%m-%d %H:%M:%S")

Cumbres <- subset(clima, Localidad == "Cumbres")
Cumbres <- Cumbres[order(Cumbres$FechaHora),]

plot(Cumbres$FechaHora, Cumbres$TA,
     type = "l",
     col = "indianred",
     lwd = 2,
     xlab = "Fecha",
     ylab = "Temp (°C)",
     main = "Serie de variable Temp")

no me salio
