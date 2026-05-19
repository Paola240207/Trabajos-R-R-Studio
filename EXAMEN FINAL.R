# NOMBRE:PAOLA MONSERRAT CONSTANTE IBARRA
# MATRÍCULA: 2141635

#============================================================
# EXAMEN DE DISEÑOS EXPERIMENTALES
# Prueba t independiente
# Problema 1: Crecimiento de plántulas con y sin cercado
# ============================================================

# ------------------------------------------------------------
# 1. Cargar paquetes
# ------------------------------------------------------------

# install.packages("tidyverse")
# install.packages("car")

library(tidyverse)
library(car)

# ------------------------------------------------------------
# 2. Crear el conjunto de datos
# ------------------------------------------------------------

datos <- data.frame(
  tratamiento = rep(c("Cercado", "Sin cercado"), each = 25),
  altura_cm = c(
    34.8, 35.2, 36.1, 35.7, 36.5,
    34.9, 35.6, 36.2, 35.4, 36.0,
    35.8, 36.4, 35.1, 35.9, 36.3,
    34.7, 35.5, 36.1, 35.3, 36.6,
    35.7, 36.2, 35.0, 35.8, 36.4,
    
    28.1, 27.9, 29.0, 28.4, 29.1,
    27.8, 28.6, 29.3, 28.2, 28.7,
    28.5, 29.2, 27.7, 28.8, 29.0,
    27.6, 28.3, 29.1, 28.0, 29.4,
    28.5, 28.9, 27.8, 28.6, 29.2
  )
)

# ------------------------------------------------------------
# 3. Revisar estructura de los datos
# ------------------------------------------------------------

str(datos)
head(datos)

# Respuesta del estudiante:
# 
# Número de grupos comparados:
# 2 grupos, uno con cerca de proteccion y otro sin cerca

# ------------------------------------------------------------
# 4. Estadística descriptiva por grupo
# ------------------------------------------------------------

datos %>%
  group_by(tratamiento) %>%
  summarise(
    n = n(),
    media = mean(altura_cm),
    desviacion_estandar = sd(altura_cm),
    minimo = min(altura_cm),
    maximo = max(altura_cm)
  )

# Respuesta del estudiante:
# ¿Qué grupo presentó mayor promedio?
# El grupo con area cercada
# ¿La diferencia observada parece relevante desde el punto de vista forestal?
# Si, ya que demuestra como la ganaderia es un factor limitante en el crecimiento y desarrollo de
# las plantulas

# ------------------------------------------------------------
# 5. Gráfico exploratorio
# ------------------------------------------------------------

ggplot(datos, aes(x = tratamiento, y = altura_cm)) +
  geom_boxplot() +
  geom_jitter(width = 0.1, size = 2) +
  labs(
    title = "Altura de plántulas por tratamiento",
    x = "Tratamiento",
    y = "Altura de plántulas (cm)"
  ) +
  theme_minimal()

# Respuesta del estudiante:
# Describa la distribución de los datos en cada grupo:
# hay diferencias entre ambos grupos, y en tratamiento con cercado hay mas dispersion 
# de datos que con el tratamiento sin cercado
# ------------------------------------------------------------
# 6. Prueba de normalidad Shapiro-Wilk
# ------------------------------------------------------------

by(datos$altura_cm, datos$tratamiento, shapiro.test)

# Respuesta del estudiante:
# Valor p para el grupo Cercado:
# 0.3812
# Valor p para el grupo Sin cercado:
# 0.2427
# ¿Se cumple el supuesto de normalidad?
# si, en ambos tratamientos

# ------------------------------------------------------------
# 7. Evaluación de homogeneidad de varianzas
# ------------------------------------------------------------

leveneTest(altura_cm ~ tratamiento, data = datos)

# Respuesta del estudiante:
# Valor p de la prueba de Levene:
# 0.9628
# ¿Se cumple el supuesto de homogeneidad de varianzas?
# si

# ------------------------------------------------------------
# 8. Aplicar prueba t independiente
# ------------------------------------------------------------

resultado_t <- t.test(
  altura_cm ~ tratamiento,
  data = datos,
  var.equal = TRUE
)

resultado_t

# Respuesta del estudiante:
# Estadístico t:
# 45.666
# Grados de libertad:
# 48
# Valor p:
# 2.2e-16
# Intervalo de confianza:
# 95%

# ------------------------------------------------------------
# 9. Interpretación estadística
# ------------------------------------------------------------

# Respuesta del estudiante:
# ¿Se rechaza o no se rechaza la hipótesis nula?
# se rechaza la h0
# ¿Existe diferencia estadísticamente significativa entre tratamientos?
# si existen

# ------------------------------------------------------------
# 10. Interpretación forestal
# ------------------------------------------------------------

# Respuesta del estudiante:
# Explique qué significa el resultado en el contexto del crecimiento de plántulas:
# la supervivencia, crecimiento y desarrollo de las plantulas es mayor en areas con cerca
# ya que evita que el ganado se alimente de estas
