# MAGT
# 14/04/2026
# Datos climatologicos
# Cumbres NL, Villagran Tamps, Carranza Coahuila

clima <- read.csv("CLIMATOLOGIA.csv", header =T)
clima$Localidad <- as.factor(clima$Localidad)
clima$Fecha <- as.Date(clima$Fecha, format = "%d/%m/%Y")

boxplot(clima$TA~ clima$Localidad,
        col= "red",
        ylab = "TA (C°)",
        xlab = "Localidades",
        ylim = c)
