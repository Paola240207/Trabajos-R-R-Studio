
library(lubridate)
Viento <- read.csv("CLIMATOLOGIA.csv", header = T)
Viento$Localidad <- as.factor(Viento$Localidad)
Viento$Fecha <- as.Date(Viento$Fecha, format = "%d/%m/%Y")
Viento$Hora <- as.Date(Viento$Hora, format = "%H:%M:%S")
Viento$FechaHora <- as.POSIXct(paste(Viento$Fecha, Viento$Hora),
                               format = "%d/%m/%Y %H:%M:%S")

boxplot(Viento$RV ~ Viento$Localidad,
        col= "purple",
        ylab = "Rapidez del Viento (Km/h)",
        xlab = "Localidad"
        )

tapply(Viento$RV, Viento$Localidad, mean)

Villagran <-subset(Viento, Localidad == "Villagran")
Villagran <- Villagran[order(Villagran$FechaHora),]

# No hice el plot
# ni un tapply donde solo venga el Viento

vien.aov <- aov(Viento$RV ~ Viento$Localidad)
summary(vien.aov)

# Se acepta la H1 (hipyesis alterna/alternativa), es decir que SI hay 
# diferencias signifcativas y para comparar la diferencia de medias se usa la
# prueba de Tukey

TukeyHSD (vien.aov)

tapply(Viento$RV, Viento$Localidad, var)
