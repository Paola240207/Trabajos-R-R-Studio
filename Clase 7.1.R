
library(lubridate)
clima <- read.csv("CLIMATOLOGIA.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")
clima$FechaHora <- as.POSIXct(paste(clima$Fecha, clima$Hora),
                              format ="%Y-%m-%d %H:%M:%S")

