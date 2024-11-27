# Modelos de Elección Múltiple 

## Introducción

Consideramos ahora una generalización o extensión de los modelos Logit/Probit. Específicamente, pasaremos de una variable dependiente que permite dos opciones (binaria) a una categórica que aborda más de dos opciones. 

Primero estudiaremos el caso en el cual las opciones no asocian un orden particular. Es decir, modelo de **múltiples respuestas no ordenadas**, también conocido como regresión logística multinomial o _Multinomial Logit_. Algunos ejemplos son:

- ¿Cuál de los siguientes medios de transporte emplea para ir al trabajo? 
  1. Metro
  2. Bus
  3. Bicicleta

- ¿Por cuál de los siguientes partidos votará en las próximas elecciones? 
  1. Partido de Derecha
  2. Injerto del Centro
  3. Coalición de Izquierda

Luego pasaremos a revisar el modelo de **respuestas ordenadas**, también conocido como Logit/Probit Ordenado. Las opciones involucran un ordenamiento implicito. Algunos ejemplos son: 

- Evaluar la calidad del servicio recibido seleccionando entre una de las siguientes tres opciones:
  1. Excelente
  2. Bueno
  3. Malo

Al igual que el caso del Logit/Probit, se parte por asociar funciones de probabilidad a las elecciones u opciones, y por ende la técnica que emplearemos para obtener los parámetros estimados es el {ref}`Ch_MLE`. Es decir, el ejercicio se centrará en plantear la función de verosimilitud.

Referencia: Esta subsección sigue de cerca el capítulo 15 de {cite:t}`cameron2005`.


## Multinomial Logit

- **Descripción General**:
  - Este modelo es adecuado cuando la variable dependiente incluye **más de dos alternativas cualitativas** sin ningún tipo de orden implícito.
  - **Ejemplo**: Elegir un lugar para pescar, donde $y_i \in \{\text{playa}, \text{bote}, \text{muelle}\}$.

- **Enfoque de Utilidad Aleatoria**:
  - Siguiendo el marco de los modelos de **utilidad aleatoria**, se modela la probabilidad de escoger una opción particular sobre las demás, dadas las características observables.
  - Una forma de extender el modelo es comparar pares de opciones, como en el logit binario, asignando una probabilidad a cada comparación.

- **Función de Distribución de Probabilidad (f.d.p.)**:
  - Se usa la **f.d.p. logística**, en lugar de la normal, ya que es computacionalmente más sencilla y adecuada para este contexto.

- **Estructura del Modelo**:
  - Supongamos que existen $J + 1$ alternativas, donde se designa una categoría como **base de comparación**.
  - Las funciones de probabilidad para cada alternativa son:
  
    - Para la categoría base $Y=0$:

      $$
      Pr(Y=0|\boldsymbol{X}) = \frac{1}{\left[1 + \sum_{j=1}^J \exp(X \beta^{(j)})\right]}
      $$
    
    - Para cualquier otra categoría $Y=j$, con $j=1,...,J$:

      $$
      Pr(Y=j|\boldsymbol{X}) = \frac{\exp(X \beta^{(j)})}{\left[1 + \sum_{j=1}^J \exp(X \beta^{(j)})\right]}
      $$

**Interpretación de los Coeficientes**:

- Los coeficientes $\beta^{(j)}$ **varían por opción**, lo que significa que cada alternativa tiene su propio conjunto de parámetros.
- Si $J = 1$, el modelo se reduce a un logit binario, donde solo hay dos opciones.

**Log de los Coeficientes**: 

- La relación de los logaritmos de las probabilidades se expresa como:

  $$\ln \left( \frac{P_{ij}}{P_{i0}} \right) = X_i' \beta^j$$

- Alternativamente, normalizando respecto a otra probabilidad $k$:

  $$\ln \left( \frac{P_{ij}}{P_{ik}} \right) = X_i' (\beta^j - \beta^k)$$

> Nota: Con estas probabilidades, se pueden construir modelos que expliquen la preferencia por una opción sobre otras a partir de las características observables y la estructura de utilidades latentes.

**Independencia de Alternativas Irrelevantes (IAI)**

Los modelos multinomiales como el logit asumen la **independencia de alternativas irrelevantes (IAI)**. Esto significa que la relación de probabilidades entre dos opciones es independiente de la presencia o ausencia de otras alternativas.

Como vimos, para dos respuestas $k$ y $r$, la razón de probabilidades se expresa como:

$$\frac{Pr(Y_i = k)}{Pr(Y_i = r)} = \exp \left( X_i' (\beta^k - \beta^r) \right)$$

- Esto implica que la relación entre las probabilidades de escoger las opciones $k$ y $r$ no depende de las características de otras alternativas en el conjunto de opciones.
- La propiedad de IAI implica que **adicionar o remover alternativas** en el conjunto de opciones no afecta la relación de probabilidades entre dos opciones específicas, como $k$ y $r$.

Este supuesto facilita la estimación y análisis de los modelos, pero también limita la flexibilidad del modelo en situaciones donde las alternativas pueden estar correlacionadas o donde la presencia de otras opciones influye en la elección relativa entre dos opciones.

**Función de Verosimilitud** La función de verosimilitud a maximizar es:

$$\mathcal{L} = \sum_{i=1}^N \sum_{j=0}^J d_{ij} \cdot \ln \left( P(Y_i = j) \right)$$

Donde $d_{ij}$ es una variable indicadora (dummy) que toma el valor de 1 si el individuo $i$ escoge la alternativa $j$, y 0 en caso contrario.


**Condiciones de Primer Orden**: Las condiciones necesarias de primer orden para maximizar la verosimilitud son:

$$\frac{\partial \mathcal{L}}{\partial \beta^j} = \sum_i (d_{ij} - P_{ij}) \cdot X_i \quad \text{para } j = 1, \ldots, J$$


## Logit Condicional

El modelo de **Logit Condicional** es una extensión del logit multinomial que permite que las probabilidades de elección dependan no solo de las características individuales, sino también de las características específicas de cada alternativa. Ambos modelos permiten manejar múltiples alternativas no ordenadas, pero el logit condicional incorpora explícitamente características de cada opción.

El modelo logit condicional es útil en contextos donde las opciones de elección tienen características propias que influyen en la decisión del individuo. Ejemplos:

- Elección de medios de transporte en función de atributos como el costo, tiempo de viaje, y comodidad de cada opción (metro, bus, bicicleta, etc.).
- Elección de lugar de compra basado en factores como precio, distancia, y calidad del servicio en cada tienda.

> **Referencia:** Ver capítulo 15 en Cameron y Trivedi para una discusión detallada.

**Probabilidad de Elección y función de verosimilitud**

- La probabilidad de que el individuo $i$ elija la alternativa $j$ se define como:

  $$ P_{ij} = \frac{\exp(X_{ij}' \beta)}{\sum_{v=1}^J \exp(X_{iv}' \beta)} $$

- Aquí, $X_{ij}$ representa las características observables de la alternativa $j$ para el individuo $i$.
- La interpretación es que el vector de parámetros $\beta$ es común para todas las alternativas, pero las características específicas varían entre opciones.
- La función de verosimilitud para el logit condicional, dada la elección observada, es:

  $$ \mathcal{L} = \prod_{i=1}^N \prod_{j=0}^J \left( \frac{\exp(X_{ij}' \beta)}{\sum_{k=1}^J \exp(X_{ik}' \beta)} \right)^{d_{ij}} $$

  Donde $d_{ij}$ es una variable indicadora que toma el valor de 1 si el individuo $i$ elige la alternativa $j$, y 0 en caso contrario.

## Multinomial Probit
 
El modelo de **Multinomial Probit** es una alternativa al **Multinomial Logit** cuando se desea incorporar **correlación entre alternativas**. A diferencia del multinomial logit, el multinomial probit no asume **Independencia de Alternativas Irrelevantes (IAI)**. Esto significa que la relación de probabilidades entre dos opciones **sí puede depender de la presencia o ausencia de otras alternativas**.

El **Multinomial Probit** permite **relajarse del supuesto de IAI** ya que modela la correlación entre los errores de las alternativas mediante una distribución normal multivariada. Esto permite una mayor flexibilidad en escenarios donde las alternativas son similares y podrían estar correlacionadas, como en la elección de diferentes marcas o modos de transporte.

En el multinomial probit, la probabilidad de elegir una alternativa involucra múltiples integrales de la función de densidad normal multivariada. Esto genera un problema de alta **complejidad computacional** debido a la necesidad de calcular integrales múltiples.

Por ejemplo, para un modelo con tres alternativas, la probabilidad de elegir una de ellas está dada por:

$$ Pr(Y_i = 1) = \iint f(u_{i2}, u_{i3}) \, du_{i2} \, du_{i3} $$

Aquí, $f(u_{i2}, u_{i3})$ representa la función de densidad conjunta de una distribución normal bivariada. A medida que aumenta el número de alternativas, el número de integrales necesarias también aumenta, lo que complica el cálculo.

En la práctica, para resolver este problema, se emplean técnicas de simulación como el **Método de Simulación de Máxima Verosimilitud** (ML) o métodos basados en **Monte Carlo** para aproximar las probabilidades.


**Función de Verosimilitud** 

Similar al multinomial logit, el modelo multinomial probit utiliza una función de verosimilitud para estimar los parámetros. Sin embargo, debido a las integrales mencionadas, la maximización de la verosimilitud es considerablemente más complicada. La función de verosimilitud, en este caso, requiere aproximaciones numéricas para poder resolver los múltiples integrales.

> **Nota**: La elección entre el multinomial logit y el multinomial probit depende de la aplicación específica y la disponibilidad de recursos computacionales. Si las alternativas son claramente diferenciables y no correlacionadas, el logit multinomial puede ser suficiente y más práctico.

**Software**: 

- Stata: `mprobit` para Multinomial Probit, `mlogit` para Multinomial Logit y `clogit` para Logit Condicional.
- R: `multinom` de la libreria 'nnet', `mlogit` de la libreria 'mlogit', `clogit` de la libreria 'survival'. Otros son `MNP` y `bayesm` . Pero para grandes bases, tal vez el `mlogit` sea más eficiente.
  



## Respuesta Múltiple Ordenada

En algunos casos, la variable dependiente es una variable categórica con **más de dos alternativas** y **un orden natural** entre las categorías. A diferencia del multinomial logit, donde las opciones no tienen un orden particular, en el modelo de **respuesta múltiple ordenada** se aprovecha el orden implícito entre las categorías.

Los modelos **Ordered Logit** y **Ordered Probit** son extensiones de los modelos logit y probit tradicionales para tratar con variables dependientes ordinales.

**Ejemplos**:

- Un cliente califica su satisfacción con un producto o servicio en una escala ordinal: <br> 1. Insatisfecho; 2. Neutral; 3. Satisfecho; 4. Muy Satisfecho
- Un individuo alcanza un nivel de educación que se puede ordenar de menor a mayor: <br> 1. Primaria; 2. Secundaria; 3. Pregrado; 4. Posgrado

La **interpretación del modelo** se centra en analizar cómo los cambios en las variables explicativas influyen en la probabilidad de moverse hacia categorías superiores o inferiores.

Los modelos de respuesta múltiple ordenada parten de una **variable latente** $Y^*$, que representa la propensión subyacente de una persona a seleccionar una categoría más alta o baja. La variable latente se modela como $Y^* = X\beta + u$, donde  $X$ son las variables explicativas (observables) and $u_i$ es el término de error (asumido con distribución normal o logística).

La variable dependiente observada $Y$ es una versión ordinal de $Y^*$, donde cada valor de $Y$ se asocia a un rango específico de $Y^*$. 

$$Y_i = 
  \begin{cases} 
    0 & \text{si } Y_i^* < A_0 \\
    1 & \text{si } A_0 \leq Y_i^* < A_1 \\
    \vdots \\
    J & \text{si } A_{J-1} \leq Y_i^* < A_J
  \end{cases}
$$

los **umbrales $A$** representan los puntos de corte que delimitan las categorías.

Así, los parámetros a estimar son: $\beta$ junto a los $A=(A_0,\ldots,A_{J-1})$ umbrales.

La probabilidad de que un individuo elija una categoría en particular se calcula mediante la función de distribución acumulada de la normal estándar (para el **probit ordenado**) o de la logística (para el **logit ordenado**).

La probabilidad de que $Y_i = j$ está dada por:

$$
\begin{eqnarray}
Pr(Y_i = 0) &=& F(a_0 - X_i'\beta) \\
Pr(Y_i = j) &=& F(a_j - X_i'\beta) - F(a_{j-1} - X_i'\beta), \quad j > 0 \\
Pr(Y_i = J) &=& 1 - F(a_{J-1} - X_i'\beta)
\end{eqnarray}
$$

$F(\cdot)$ representa la función de distribución acumulada, por ejemplo, la normal acumulada en el caso del Probit o la logística acumulada en el caso del Logit ( $F(z)=[1+exp(-z)]^{-1}$ ).

Así, la **función de verosimilitud** a maximizar es:

$$
 \mathcal{L}(\beta, a) = \prod_{i=1}^N \prod_{j=0}^J \left( Pr(Y_i = j) \right)^{d_{ij}}
$$

donde $d_{ij}$ es una variable indicadora que toma valor 1 si $Y_i = j$ y 0 en caso contrario.

> Observación: tanto el logit multinomial como el logit ordenado tienen una forma similar para la log-verosimilitud.

Aunque la estructura de la log-verosimilitud es la misma, la **elección de la función de probabilidad** refleja las suposiciones del modelo sobre la naturaleza de las opciones (no ordenadas vs. ordenadas).

La diferencia radica en la expresión para $P(Y_i = j)$:

- **Logit Multinomial**: $P(Y_i = j)$ se calcula **usando la función** logística multinomial:

  $$
  P(Y_i = j) = \frac{\exp(X_i' \beta_j)}{\sum_{k=1}^J \exp(X_i' \beta_k)}
  $$

- **Logit Ordenado**: $P(Y_i = j)$ se basa en probabilidades acumuladas, típicamente **usando la función de distribución logística acumulada**:

    $$
    P(Y_i = j) = F(a_j - X_i' \beta) - F(a_{j-1} - X_i' \beta)
    $$

En el **logit multinomial**, los coeficientes $\beta_j$ varían por opción, capturando la preferencia relativa para cada opción; en el **logit ordenado**, el coeficiente $\beta$ es constante y las probabilidades de las categorías ordenadas dependen de los umbrales $a_j$, que segmentan la variable latente en categorías ordenadas.

**Efectos Marginales:** 

En los modelos logit y probit ordenados, los **coeficientes** no representan cambios marginales directos en las probabilidades de cada categoría. En su lugar, indican el **efecto de un cambio en las variables explicativas** sobre la probabilidad de moverse a categorías superiores o inferiores.

$$
\frac{\partial Pr(Y_i = j)}{\partial X_r} = \left[ F'(a_j - X_i'\beta) - F'(a_{j-1} - X_i'\beta) \right] \cdot \beta_r
$$

Notar que varían según el punto de evaluación, usualmente en la media de $X$ o en valores específicos.

**Software**: 

  - Stata: `oprobit` para Probit Ordenado, `ologit` para Logit Ordenado.
  - R: `polr` de la libreria MASS
  

