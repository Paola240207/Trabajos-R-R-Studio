# MAGT
# 14/04/2026
# Datos climatologicos
# Cumbres NL, Villagran Tamps, Carranza Coahuila

clima <- read.csv("CLIMATOLOGIA.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")

boxplot(clima$TA~ clima$Localidad,
        col= "indianred",
        ylab = "TA (C°)",
        xlab = "Localidades",
        ylim = c(10,35),
        outcol = "indianred", #marcar outliers en rojo
        outpch = 19) #cambiar la forma a circulo relleno

tapply(clima$TA, clima$Localidad, mean)
