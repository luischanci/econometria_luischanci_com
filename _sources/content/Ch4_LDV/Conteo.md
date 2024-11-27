# Modelo de Conteo

**Poisson Regression: Modelo para variables de conteo.**

### Introducción

- **Regresión de Poisson** 
  - Modelo de regresión para **datos de conteo**, donde la variable dependiente representa el **número de eventos en un tiempo** o espacio específico.
  - Los datos de conteo son no negativos y discretos (0, 1, 2,...).

- Ejemplos:
  - Número de cervezas que se venden en un bar entre las 23:00 y las 00:00 horas.
  - Número de accidentes de tráfico en una intersección por día.
  - Número de llamadas telefónicas recibidas por un centro de atención al cliente por minuto.

## Función de Probabilidad

El modelo de probabilidad esta dado por:

- **Función de Probabilidad:**
  $$P(Y = y) = \frac{e^{-\lambda} \lambda^y}{y!}, \quad y = 0, 1, 2, ...$$

  $Y$ es variable discreta que representa el número de eventos; $\lambda$ es la **media**.

Para hacerlo un modelo de regresión:
- **Relación entre Media y Variables Independientes:**
  $$\lambda = E(Y|X) = e^{X'\beta}$$
  donde $X = (X_1, X_2, ..., X_k)'$ es un vector de variables explicativas.
- **Supuesto Clave:** $Y$ sigue una distribución de Poisson con media $\lambda$, donde $\lambda$ es función de $X$.

Donde

- **Coeficientes ($\beta_j$):**
    - Representan el cambio en el logaritmo de la media de $Y$ por un cambio de una unidad en $X_j$, manteniendo constantes las demás variables.
    - $\exp(\beta_j)$ representa el cambio multiplicativo en la media de $Y$ con un cambio unitario en $X_j$.
- **Ejemplo:** Si $\exp(\beta_1) = 1,2$, un aumento de una unidad en $X_1$ se asocia con un aumento del 20% en la media de $Y$.

## Función de Verosimilitud

Considerando la función de probabilidad, la verosimilitud es:

$$L(\beta) = \prod_{i=1}^{n} \frac{e^{-\lambda_i} \lambda_i^{y_i}}{y_i!}$$

donde $\lambda_i = e^{X_i'\beta}$.

y la **Log-Verosimilitud** es:

$$\ell(\beta) = \sum_{i=1}^{n} (y_i X_i'\beta - e^{X_i'\beta} - \ln(y_i!))$$

## Sobre Inferencia
- Los **Errores Estándar** se calculan a partir de la matriz de información de Fisher.
- Y las **Pruebas de Hipótesis** se pueden realizar mediante pruebas t para la significancia individual de los coeficientes y pruebas de Wald para restricciones conjuntas.
- Respecto a los **Intervalos de Confianza,** se pueden construir intervalos de confianza para los coeficientes de forma usual.

## Sobredispersión

La sobredispersión ocurre cuando la varianza de $Y$ es mayor que su media, violando el supuesto de Poisson.
  
- **Causas:**
  - Heterogeneidad no observada.
  - Omisión de variables relevantes.
  - Eventos correlacionados.

- **Consecuencias:**
  - Sesgo en estimaciones de errores estándar.
  - Pruebas de hipótesis incorrectas.

- **Soluciones:**
  - **Regresión Binomial Negativa:** Modelo alternativo para permitir sobredispersión.
  - **Estimación Robusta:** Ajuste de errores estándar para sobredispersión.

## Software 

  - Stata: `rpoisson`
  - R: `glm` 

