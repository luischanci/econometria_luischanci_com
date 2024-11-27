# Censura, Truncamiento, Selección <br> (Tobit y Heckman)

## Introducción

- En estos modelos, la variable de interés  `Y`  es continua (nuevamente).
- Sin embargo, por alguna razón, la variable  `Y`  está incompleta observada en forma incompleta o limitada:
    - Truncada o censurada.
- Por ende, OLS no es válido ya que la muestra no es representativa de la población.

En **Truncamiento:**

- Las observaciones **<u>sistemáticamente excluidas</u>** (var. dep. $y$ explicativas eliminadas o perdidas). Es decir, no hay datos completos.
- Ejemplo:  Encuesta de hogares donde no se incluye a hogares con ingresos muy altos. Por alguna razón, la muestra de ingreso de hogares no incluye los hogares que ganan 10 millones de pesos al mes.

En **Censura:**

- Todas las observaciones son incluidas. Sin embargo, la variable dependiente $y$ **se observa dentro de un rango**; por encima o por debajo de cierto **<u>umbral</u>** son tratados como si estuvieran en el umbral.
- Ejemplo:  Encuesta de hogares donde se reemplaza ingreso con "ingreso es mayor a 10" por un valor. Usando el ejemplo hipotético de la encuesta de hogares, diciendo que en los datos de "ganar mil millones", un millón es lo máximo, donde "ganar un millón" está registrado como ese umbral.

En **Truncamiento incidental a sesgo de selección:**

- Hay un truncamiento donde la posibilidad de obtener la muestra en particular se relaciona de forma con la variable de interés. **Ejemplo:** Encuesta de innovación de Chile que solo incluye a las empresas que innovan.
- Hay un sesgo de selección. Por ejemplo, en un estudio de salarios femeninos que se base solo en usar datos de mujeres que trabajan las estimaciones enfrentan un sesgo ya que la decisión de trabajar no es aleatoria y depende del nivel de la variable de interés. 
- **Heckman (1979):** El ejemplo más famoso es el de Heckman, donde el valor es implícito en la oferta de empleo. En principio, se necesita incluir trabajadores que no trabajan en la muestra.
  


## Censura

Nuestro gran objetivo es plantear la función de verosimilitud, así que partamos por entender el contexto del modelo.

**Mecanismo:**

**Sea  $y$  el valor observado, la parte incompleta de  $y^*$.**

En censura observamos toda la información de  $X_i$, pero la censura en  $y^*$  puede ser:

- **Censura por debajo:**

  $$
    y = \begin{cases}
        y^* & \text{ si } y^* > L \\
        L & \text{ si } y^* \leq L
    \end{cases}
  $$

  - Es decir, si  la variable latente es menor a un umbral ( $y^* \leq L$ ), entonces  la variable $y$  toma el valor del umbral $L$. Y si  $y^* > L$, entonces  $y = y^*$.
  - Por ejemplo,  $L = 0$  en una encuesta de gasto en bienes durables. Otro ejemplo, es lo que intentaba Tobit: **modelar una solución de esquina.**

- **Censura por encima:**

  $$
    y = \begin{cases}
        y^* & \text{ si } y^* \leq U \\
        U & \text{ si } y^* > L
    \end{cases}
  $$

  - Por ejemplo, en una encuesta de hogares con ingreso mayor a  $U = 10^6$.

**Observaciones:**

- Supongamos que en los datos solo vemos la variable dependiente hasta un umbral. Por ejemplo, ingresos hasta un millón: todos los ingresos reportan  $< U$  y los ingresos mayores se consideran censurados.
- Censura superior o inferior. Ejemplo: censura por debajo en los ingresos cuando  $L = 0$. En este caso: para deuda negativa sustituimos 0.

**Función de densidad con censura:**  Para  $y^*$, la función de densidad  $f^*(y^*|x, \theta)$  se define de la forma usual, donde  $\theta$  representa los parámetros del modelo.  Sin embargo, para la variable observada  $y$, la densidad se ajusta para considerar la censura.

**Censura por debajo en  $L$**

- Para los valores de  $y > L$, la densidad de  $y$  es la misma que la densidad de  $y^*$:
  $$ f(y|x) = f^*(y|x,\theta) \text{ si } y > L$$
- Para  $y \leq L$, la densidad de  $y$  se concentra en el punto  $L$:
  $$ f(y|x) = P(y^* \leq L | x, \theta) = F^*(L | x, \theta) \text{ si } y = L$$
    
  donde  $F^*(L | x, \theta)$  es la función de distribución acumulada de  $y^*$  evaluada en  $L$.


**Función de Verosimilitud:**  

Para una observación  $i$, la contribución a la función de verosimilitud se define como:

  $$
    L_i(\theta) = \begin{cases}
    f^*(y_i | x_i, \theta) & \text{si } y_i > L \\
    F^*(L | x_i, \theta) & \text{si } y_i = L
    \end{cases}
  $$

  Podemos escribir esto de forma compacta usando una variable indicadora  $d_i = \mathbb{I}(y_i > L)$:

  $$
    L_i(\theta) = [f^*(y_i | x_i, \theta)]^{d_i} \cdot [F^*(L | x_i, \theta)]^{1-d_i}
  $$

**Log-verosimilitud:**  

La log-verosimilitud para la muestra completa se obtiene sumando las contribuciones individuales:

  $$
    \ell(\theta) = \sum_{i=1}^{n} \left[ d_i \cdot \ln f^*(y_i | x_i, \theta) + (1-d_i) \cdot \ln F^*(L | x_i, \theta) \right]
  $$

## Censura: Normalidad y Modelo Tobit

**Incorporación del supuesto de Normalidad**

- En muchos casos, se asume que la variable latente  $y^*$  sigue una distribución normal.
- Es importante repasar primero las propiedades estadísticas de la distribución normal censurada para comprender cómo afecta al modelo.
- Bajo el supuesto de normalidad, podemos derivar expresiones explícitas para la función de verosimilitud, lo que facilita la estimación e inferencia.

### Momentos de la Distribución Normal Censurada

Consideremos una variable aleatoria  $z^*$  que sigue una distribución normal con media  $\mu$  y varianza  $\sigma^2$.  

Supongamos que  $z^*$  está censurada por debajo en un umbral  $L$.  Esto significa que solo observamos  $z = z^*$  si  $z^* > L$, y observamos  $z = L$  si  $z^* \leq L$.

  $$z^* \sim \mathcal{N}(\mu, \sigma^2) \hspace{0.5cm};\hspace{0.5cm} 
  z = \begin{cases}
   z^*, & \text{si } z^* > L \\
   L, & \text{si } z^* \leq L
   \end{cases}$$

**Momentos:**

- **Media:**  La media de la variable censurada  $z$  está dada por:
  $$ E(z) = \mu + \sigma \cdot \frac{\phi(\lambda)}{1-\Phi(\lambda)}, $$
  donde  $\lambda = (L - \mu)/\sigma$.
- **Varianza:** La varianza de la variable censurada  $z$  es:
  $$ \text{Var}(z) = \sigma^2 \left[ 1 - \frac{\phi(\lambda) \cdot (\phi(\lambda) - \lambda)}{[1-\Phi(\lambda)]^2} \right], $$
  donde $\phi(\cdot)$ es la función de densidad normal estándar y $\Phi(\cdot)$ es la acumulada normal estándar.

### Modelo Tobit

- El modelo Tobit es un modelo de **regresión censurada** donde la variable dependiente está censurada, típicamente en **cero**.
- Originalmente fue propuesto para soluciones de esquina (ej. adquirir un seguro agrícola).
- Es una extensión del modelo de regresión lineal que permite manejar la censura en la variable dependiente.
- Se asume que existe una variable latente  $y_i^*$  que sigue un modelo lineal con errores normales:

  $$ y_i^* = X_i'\beta + \varepsilon_i, \quad \varepsilon_i \sim \mathcal{N}(0, \sigma^2). $$

- La variable observada  $y_i$  es una versión censurada de  $y_i^*$:

  $$ y_i =
  \begin{cases}
  y_i^*, & \text{si } y_i^* > 0, \\
  0, & \text{si } y_i^* \leq 0.
  \end{cases}$$

**Probabilidad de Censura.**  

La probabilidad de que la variable latente sea menor o igual a cero (y por lo tanto censurada) es:

$$ F^*(0) = P(y^* \leq 0) = P(\varepsilon \leq -X'\beta) = \Phi(-X'\beta/\sigma). $$

**Función de log-verosimilitud.**  

Para estimar los parámetros del modelo Tobit ($\beta$ y $\sigma$), se utiliza el método de máxima verosimilitud. La función de log-verosimilitud se construye considerando la densidad de la variable observada  $y_i$, que se ajusta para tener en cuenta la censura:

$$\ell(\beta, \sigma) = \sum_{i=1}^n \left[
  d_i \left(-\ln(\sqrt{2\pi} \sigma) - \frac{(y_i - X_i'\beta)^2}{2\sigma^2}\right) +
  (1-d_i) \ln[1 - \Phi(X_i'\beta/\sigma)]
  \right]$$

donde $d_i = 1$ si $y_i > 0$, y $d_i = 0$ si $y_i \leq 0$. Es decir, el primer término dentro de la suma corresponde a las observaciones no censuradas, y el segundo término a las observaciones censuradas.

**Condiciones de Primer Orden (CPO) del Modelo Tobit**

Derivadas de la función de log-verosimilitud respecto a los parámetros:

$$ \frac{\partial \ell}{\partial \beta} = \sum_i \left[
    d_i \cdot \frac{(y_i - X_i'\beta)}{\sigma^2} + (1 - d_i) \cdot \frac{\phi(X_i'\beta/\sigma)}{1 - \Phi(X_i'\beta/\sigma)} \cdot \frac{X_i}{\sigma}
    \right] = 0 $$
  
$$ \frac{\partial \ell}{\partial \sigma} = \sum_i \left[
    d_i \left(-\frac{1}{\sigma} + \frac{(y_i - X_i'\beta)^2}{\sigma^3}\right) +
    (1 - d_i) \cdot \frac{\phi(X_i'\beta/\sigma)}{1 - \Phi(X_i'\beta/\sigma)} \cdot \frac{X_i'\beta}{\sigma^2}
    \right] = 0 $$

Estas ecuaciones no tienen una solución analítica cerrada y se utilizan métodos numéricos, como el algoritmo de Newton-Raphson, para encontrar las estimaciones de máxima verosimilitud de  $\beta$  y  $\sigma$.

## Truncamiento

El truncamiento es un tipo de censura donde las observaciones fuera de un rango determinado se **excluyen completamente** de la muestra.  Esto implica una **pérdida de información** tanto de la variable dependiente como de las variables independientes.

**Tipos de Truncamiento:**

- **Truncamiento por debajo ($L$):**

  $$
    y = \begin{cases}
        y^* & \text{ si } y^* > L \\
        - & \text{ si } y^* \leq L
    \end{cases}
  $$

  - Ejemplo: Solo se incluyen observaciones con  $y^* > L$  (e.g., hogares con ingresos mayores a 10 millones).

- **Truncamiento por encima ( $U$ ):**

  $$
    y = \begin{cases}
        y^* & \text{ si } y^* \leq U \\
        - & \text{ si } y^* > U
    \end{cases}
  $$

  - Ejemplo: Solo se incluyen hogares con ingresos menores a $10$ millones.

**Función de Densidad Condicional:**  Para modelar datos truncados, necesitamos ajustar la función de densidad para tener en cuenta la exclusión de observaciones fuera del rango permitido.  La función de densidad condicional de  $y$  dado que  $y^* > L$  (truncamiento por debajo) es:

  $$ f(y) = \frac{f^*(y)}{P(y^* > L)}, $$
  
  - donde  $f^*(y)$ es la función de densidad no censurada (o no truncada) de  $y^*$. $P(y^* > L)$ es la probabilidad de que  $y^*$  sea mayor que  $L$  (es decir, la probabilidad de que la observación no esté truncada).
  - **Probabilidad de Truncamiento**  La probabilidad de truncamiento se puede expresar en términos de la función de distribución acumulada (FDA) de  $y^*$:

  $$ P(y^* > L) = 1 - F^*(L), $$

  - donde  $F^*(L)$  es la F.D.Acumulada de  $y^*$  evaluada en  $L$.

**Verosimilitud**

La función de verosimilitud para datos truncados se construye considerando la densidad condicional de las observaciones que no están truncadas. En el caso de truncamiento, la log-verosimilitud incluye solo las observaciones dentro del rango permitido:

$$ \ell(\theta) = \sum_{i: y_i > L} \ln\left(\frac{f^*(y_i | x_i, \theta)}{1 - F^*(L | x_i, \theta)}\right). $$

donde  $\theta$  representa los parámetros del modelo.

**Log-Verosimilitud**

Para datos truncados por debajo en  $L$, la función de log-verosimilitud se puede escribir como:

$$ \ell(\theta) = \sum_{i=1}^{n} \left\{ \ln f^*(y_i | x_i; \theta) - \ln \left[1 - F^*(L | x_i; \theta)\right] \right\}$$

donde $f^*(y_i | x_i; \theta)$ es la densidad condicional de  $y_i^*$  dado  $x_i$  con parámetros  $\theta$. $F^*(L | x_i; \theta)$ es la función de distribución acumulada (FDA) de  $y_i^*$  evaluada en el umbral  $L$, condicional en  $x_i$.

**Notar que**  la log-verosimilitud se compone de dos términos:

- El primer término,  $\ln f^*(y_i | x_i; \theta)$, es la log-verosimilitud de la variable no truncada  $y_i^*$.
- El segundo término,  $-\ln \left[1 - F^*(L | x_i; \theta)\right]$, ajusta la verosimilitud para tener en cuenta el truncamiento.  Representa la probabilidad de observar  $y_i^*$  por encima del umbral  $L$.
- **Importancia del Ajuste:** Ignorar el truncamiento en los datos implicaría **no incluir el segundo término** en la log-verosimilitud.  Esto resultaría en estimaciones sesgadas e inferencias incorrectas, ya que la muestra truncada no es representativa de la población completa.

## Truncamiento y Normalidad

A menudo se asume que la variable  $y_i^*$  sigue una distribución normal.  En este caso, es importante comprender cómo el truncamiento afecta los momentos (media y varianza) de la distribución.

Supongamos que  $z$  sigue una distribución normal  $N(\mu, \sigma^2)$  y que está truncada por debajo en  $L$.  La función de densidad de la distribución normal truncada es:

$$ f(z | z \geq L) = \frac{f(z)}{1 - \Phi(\alpha)}, $$
    
donde $\alpha = \frac{L - \mu}{\sigma}$ (valor estandarizado del umbral de truncamiento) y $f(z)$ es la densidad normal. $\Phi(\alpha)$ es la función de distribución acumulada normal estándar.

**Distribución Normal Truncada Gráficamente:** La densidad normal truncada tiene forma similar a la densidad normal estándar pero restringida al intervalo $[L, \infty)$.

**Normalidad (normal truncada) - Momentos**

- **Media:**  La media de la distribución normal truncada por debajo en  $L$  es:

  $$ E(z | z \geq L) = \mu + \sigma \lambda, $$

  donde  $\lambda = \frac{\phi(\alpha)}{1 - \Phi(\alpha)}$  es la **relación de Mills inversa**.

- **Varianza:**  La varianza de la distribución normal truncada por debajo en  $L$  es:

  $$ V(z | z \geq L) = \sigma^2 (1 - \delta), $$

  donde  $\delta = \lambda (\lambda - \alpha)$  es un factor de ajuste.

- **Interpretación:**
  - La relación de Mills inversa  ($\lambda$)  mide el cambio en la media debido al truncamiento.
  - El factor de ajuste  ($\delta$)  mide el cambio en la varianza debido al truncamiento.

### Modelo de Regresión Truncada

El modelo de regresión truncada se utiliza cuando la variable dependiente  $y^*$  está **truncada**, es decir, solo observamos valores de  $y^*$  que caen dentro de un rango determinado.  

**Estructura del Modelo:**  Se asume que la variable latente  $y_i^*$  sigue un modelo lineal:

$$ y_i^* = x_i'\beta + \epsilon_i, \quad \epsilon_i \sim N(0, \sigma^2) $$

**Distribución de  $y_i^*$  (condicional al truncamiento):**  La función de densidad de  $y_i^*$ , condicional a que  $y_i^* > L$  (truncamiento por debajo), es:

$$ f^*(y_i | x_i; \theta) = \frac{(1/\sigma) \cdot \phi(\alpha)}{1 - \Phi(\alpha)} $$

donde $\alpha = \frac{L - x_i'\beta}{\sigma}$.

**Probabilidad acumulada hasta el umbral $L$:**

$$ F^*(L) = \Phi\left(\frac{L - x_i'\beta}{\sigma}\right) $$

**Log-Verosimilitud:** La función de log-verosimilitud para el modelo de regresión truncada es:

$$ \ell(\beta, \sigma^2) = \sum_{i=1}^{n} \left[ -\ln(\sqrt{2\pi}\sigma) - \frac{(y_i - x_i'\beta)^2}{2\sigma^2} - \ln\left(1 - \Phi\left(\frac{L - x_i'\beta}{\sigma}\right)\right) \right] $$

**Observaciones:**

- **OLS con  $y$  y  $x$  censurados o truncados:**
  - **Inconsistencia:**  Si aplicamos OLS directamente a datos censurados o truncados, las estimaciones de los coeficientes serán inconsistentes.  Esto se debe a que la muestra censurada o truncada no es representativa de la población, lo que introduce un sesgo en las estimaciones.

- **Aproximaciones:**
  - **Mínimos Cuadrados Ponderados:**  Para corregir el sesgo, se pueden utilizar métodos de mínimos cuadrados ponderados, donde las ponderaciones se ajustan para tener en cuenta la censura o el truncamiento.  Estos métodos son similares al **procedimiento de Heckman** para la corrección del sesgo de selección.

- **Supuesto de Normalidad:**
  - En muchos casos, se asume que los errores  $\epsilon_i$  siguen una distribución normal.  Este supuesto facilita la derivación de las expresiones para la función de verosimilitud y la estimación de los parámetros.

## Censura, Truncamiento y Modelos de Regresión

### Medias Condicionales

Media Condicional **<u>para Censura</u>** por Debajo (umbral $L = 0$):

$$ E(y | d = 0) = E(y^* | y^* \leq 0) = E(y^*) \cdot P(y^* \leq 0) + E(y^* | y^* > 0). $$

- **Interpretación:** La media condicional de  $y$  dado que está censurado  ($d=0$)  se puede descomponer en dos términos:
  - La media de  $y^*$  (la variable latente) multiplicada por la probabilidad de que  $y^*$  sea menor o igual a cero (la probabilidad de censura).
  - La media condicional de  $y^*$  dado que  $y^*$  es mayor que cero (la media de las observaciones no censuradas).

Media Condicional **<u>para truncamiento</u>.** La media condicional de  $y$  dado  $x$  y que  $y \geq L$  (truncamiento por debajo) es

$$ E(y | x, y \geq L) = E(y^* | x, y^* \geq L) = x_i'\beta + \sigma\lambda, $$

donde  $\lambda = \frac{\phi(\alpha)}{1 - \Phi(\alpha)}$  es la relación de Mills inversa.

### Fórmulas bajo supuestos de normalidad

**Motivación:**  Cuando asumimos que los errores en el modelo de regresión censurada o truncada siguen una distribución normal, podemos derivar expresiones explícitas para las medias condicionales.  Estas expresiones son útiles para comprender el impacto de la censura o el truncamiento en las estimaciones y para desarrollar métodos de corrección.

### **Censura**  

Para el modelo de censura por debajo con umbral  $L = 0$, la media condicional de  $\epsilon_i$  dado que  $x_i'\beta + \epsilon_i > 0$  es:

  $$ E(\epsilon_i | x_i'\beta + \epsilon_i > 0) = \sigma \cdot \lambda(\alpha), $$

  donde $\alpha = \frac{x_i'\beta}{\sigma}$  es el valor estandarizado de  $x_i'\beta$ y $\lambda(\alpha) = \frac{\phi(\alpha)}{\Phi(\alpha)}$  es la **relación de Mills inversa**.

  **Media Condicional de  $y_i$  (Censura):**  La media condicional de  $y_i$  dado  $x_i$  y que  $y_i^* > 0$  (no censurado) se puede expresar como:

  $$E(y_i | x_i, y_i^* > 0) = \Phi(\alpha) \cdot x_i'\beta + \sigma \cdot \lambda(\alpha)$$

### **Truncamiento** por debajo ($L=0$):

  **Media Condicional:**  La media condicional de  $y_i$  dado  $x_i$  y que  $y_i^* \geq 0$  (no truncado) es:

  $$ E(y_i | x_i, y_i^* \geq 0) = x_i'\beta + E(\epsilon_i | x_i, \epsilon_i > 0). $$

  **Bajo normalidad:**  Asumiendo que  $\epsilon_i \sim N(0, \sigma^2)$, la media condicional se simplifica a:

  $$ E(y_i | x_i, y_i^* \geq 0) = x_i'\beta + \sigma \cdot \lambda\left(\frac{x_i'\beta}{\sigma}\right). $$

### Estimador de Heckman (en dos pasos)

- El estimador de Heckman, también conocido como el procedimiento de dos pasos de Heckman, se utiliza para corregir el sesgo de selección en modelos de regresión con datos censurados o truncados.
- Este sesgo surge cuando la muestra observada no es representativa de la población, debido a la censura o el truncamiento.

1.  **Primer paso:**
    - **Estimación de la Probabilidad de Selección:**  Se estima un modelo Probit para la variable indicadora de selección  $d_i$, donde  $d_i = 1$  si  $y_i^* > 0$  (no censurado o no truncado) y  $d_i = 0$  en caso contrario.  El modelo Probit se estima utilizando la muestra completa.
    - **Cálculo de la Relación de Mills Inversa:**  Se utiliza la estimación del modelo Probit para calcular la relación de Mills inversa  $\hat{\lambda} = \frac{\phi(\hat{\alpha})}{\Phi(\hat{\alpha})}$, donde  $\hat{\alpha} = \frac{x_i'\hat{\beta}}{\hat{\sigma}}$  se obtiene a partir de las estimaciones del Probit.

2.  **Segundo paso:**
    - **Regresión con Corrección de Sesgo:**  Se estima un modelo OLS de  $y_i$  en  $x_i$  y  $\hat{\lambda}(x_i'\hat{\beta})$, utilizando solo la muestra no censurada o no truncada  ($d_i = 1$).  La inclusión de la relación de Mills inversa como regresor adicional corrige el sesgo de selección.

- **Intuición:**  El primer paso estima la probabilidad de que una observación no esté censurada o truncada.  El segundo paso utiliza esta información para ajustar la regresión y corregir el sesgo.
- **Corrección de Sesgo:**  El estimador de Heckman proporciona una forma de obtener estimaciones consistentes de los parámetros del modelo en presencia de censura o truncamiento.
- **Matriz de Varianza:**  Es importante tener en cuenta que la matriz de varianza y los errores estándar deben ajustarse para considerar la estimación en dos pasos.  Se utilizan métodos como el método de Murphy-Topel o el bootstrap para obtener errores estándar consistentes.



## Truncamiento Incidental o Sesgo de Selección

### Introducción

- **Relación con problemas de selectividad en la muestra:**
  - Se conoce como **Sesgo de Selectividad Muestral** ( _Sample Selectivity Bias_ ).
  - Ocurre cuando la muestra observada no es representativa de la población debido a un proceso de selección no aleatorio.
- **Ejemplo:** Consideremos el mercado laboral. Una persona **entra al mercado laboral** si el **salario ofrecido** es mayor al **costo de oportunidad** de trabajar. Por ende, una muestra del mercado laboral **excluye personas** para las cuales no es rentable entrar al mercado.
- **Implicaciones:**
  - Esto genera un problema de **sesgo de selección**.
  - **OLS es inconsistente** porque el salario observado está correlacionado con la probabilidad de entrar al mercado laboral.

- **Contexto del mercado laboral**: Observamos  $y_i$  (salario) solo para las personas que trabajan  ($d_i = 1$). $d_i$  es una **variable dummy** que indica si una persona trabaja, 

  $$ d_i = \begin{cases} 1 & \text{si trabaja} \\ 0 & \text{en caso contrario} \end{cases} $$

- **Variables Latentes**:
  - $y_i^*$: Variable latente de resultado (salario, incluso para los que no trabajan).
  - $d_i^*$: Variable latente que describe la decisión de participar en el mercado laboral.

- **Definición**:
  - Si  $d_i^* > 0$: La persona participa en el mercado laboral  ($d_i = 1$).
  - Si  $d_i^* \leq 0$: La persona no participa en el mercado laboral  ($d_i = 0$).

### Modelo de Muestra de Selección. Modelo con Dos Ecuaciones

Para modelar el sesgo de selección, se utiliza un sistema de dos ecuaciones:

1. **Ecuación de Selección:**  Modela la decisión de participar en el mercado laboral:

    $$ d_i^* = z_i' \gamma + \epsilon_i, \quad d_i = 1 \text{ si } d_i^* > 0. $$

    donde:
      - $z_i$: Vector de variables que influyen en la decisión de participar (e.g., educación, edad, estado civil).
      - $\gamma$: Vector de coeficientes.
      - $\epsilon_i$: Término de error.

2. **Ecuación de Resultado (_outcome_):**  Modela la variable de interés (salario):

    $$ y_i = x_i' \beta + u_i, \quad \text{observada solo si } d_i = 1. $$

    donde:
      - $x_i$: Vector de variables que influyen en el salario (e.g., experiencia, educación).
      - $\beta$: Vector de coeficientes.
      - $u_i$: Término de error.

**Ejemplo**: $d_i$ es Participación en el mercado laboral;  $y_i$ es Salario individual; $z_i$ son características que afectan la participación (ej., nivel educativo); $x_i$ son características que afectan el salario (e.g., experiencia laboral).

- **Selección No Aleatoria:** El modelo aborda la selección no aleatoria de la muestra, donde la decisión de participar (o ser observado) está correlacionada con la variable de resultado.
- **Correlación de Errores:**  Los errores  $\epsilon_i$  y  $u_i$  pueden estar correlacionados.  Esta correlación es la fuente del sesgo de selección, ya que implica que las variables no observadas que afectan la participación también afectan el resultado.
- **Estimación Conjunta:**  Se requiere una estimación conjunta de las dos ecuaciones para obtener resultados consistentes.  El estimador de Heckman (de dos pasos) es un método común para corregir el sesgo de selección en este tipo de modelos.

### Modelo Lineal

El truncamiento incidental o sesgo de selección surge cuando la observación de la variable dependiente está condicionada a un proceso de selección.  Para modelar este tipo de datos, se utiliza un modelo con dos ecuaciones: una para la selección y otra para el resultado.

**Especificación:**  El modelo de truncamiento incidental se especifica mediante dos ecuaciones lineales:

1. **Ecuación de Participación:**

   $$ y_i^{1*} = x_{i1}' \beta_1 + \epsilon_{i1} $$
    
   Esta ecuación modela la decisión binaria de participar o no en la muestra.  La variable latente  $y_i^{1*}$  representa la propensión a participar, y  $x_{i1}$  son las variables que influyen en esta decisión.

2. **Ecuación de Outcome:**

   $$ y_i^{2*} = x_{i2}' \beta_2 + \epsilon_{i2} $$
    
   Esta ecuación modela la variable de resultado  $y_i^{2*}$, que solo se observa si el individuo decide participar  ($y_i^{1*} > 0$).  Las variables  $x_{i2}$  son las que influyen en el resultado.

**Relación con el Modelo Tobit:**  El modelo Tobit es un caso particular de este modelo donde  $y_i^{1*} = y_i^{2*}$, es decir, la variable latente que determina la selección es la misma que la variable de resultado.


**Supuesto de Normalidad:**  Se asume que los errores de ambas ecuaciones,  $\epsilon_{i1}$  y  $\epsilon_{i2}$, siguen una distribución normal bivariada:

  $$
    \begin{pmatrix}
    \epsilon_{i1} \\
    \epsilon_{i2}
    \end{pmatrix} \sim \mathcal{N}
    \begin{pmatrix}
    0, &
    \begin{pmatrix}
    \sigma_1^2 & \rho\sigma_1\sigma_2 \\
    \rho\sigma_1\sigma_2 & \sigma_2^2
    \end{pmatrix}
    \end{pmatrix}.
  $$

**Implicaciones:**

- $\rho$:  El parámetro  $\rho$  representa la correlación entre los errores de la ecuación de participación y la ecuación de resultado.
- **Consistencia:**  Si  $\rho \neq 0$, existe una correlación entre las variables no observadas que afectan la participación y las que afectan el resultado.  Ignorar esta correlación al estimar la ecuación de resultado resultará en estimaciones sesgadas e inconsistentes.

### **Construcción de la Verosimilitud**  

Para construir la función de verosimilitud, necesitamos considerar dos casos:

1. **Participación:**  Si  $y_i^{1*} > 0$, observamos  $y_i^{2*}$.  La contribución a la verosimilitud en este caso es la probabilidad conjunta de observar  $y_i^{1*} > 0$  y  $y_i^{2*}$:
    
   $$ P(y_i^{1*} > 0) \cdot f(y_i^{2*} | y_i^{1*} > 0). $$
    
2. **No Participación:**  Si  $y_i^{1*} \leq 0$, no observamos  $y_i^{2*}$.  La contribución a la verosimilitud en este caso es simplemente la probabilidad de observar  $y_i^{1*} \leq 0$:
    
   $$ P(y_i^{1*} \leq 0). $$

La log-verosimilitud para la muestra completa se obtiene sumando las contribuciones de cada observación, teniendo en cuenta si participa o no en la muestra.

**Observaciones:**

- **Correlación entre las Ecuaciones:**  La correlación  $\rho$  entre los errores de las dos ecuaciones captura la dependencia entre la decisión de participar y el resultado.  Si  $\rho$  es diferente de cero, es crucial tener en cuenta esta correlación en la estimación.

- **Modelo de Selección:**  Este modelo proporciona un marco para incorporar explícitamente la selectividad muestral en el análisis de regresión, permitiendo obtener estimaciones consistentes de los parámetros de interés.


**Función de Verosimilitud para el Modelo de Sesgo de Selección**

La función de verosimilitud puede escribirse de la siguiente manera:
  
$$\mathcal{L} = \prod_{i=1}^{N} \left[ P(y_i^{1*} \leq 0) \right]^{1-d_i} \cdot \left[ f(y_i^{2*} | y_i^{1*} > 0) \cdot P(y_i^{1*} > 0) \right]^{d_i}$$
  donde $d_i$ es una variable indicadora que toma el valor de 1 si el individuo participa ($y_i^{1*} > 0$) y 0 en caso contrario.

La función de verosimilitud es el producto de las probabilidades de observar cada individuo en la muestra.  Para los individuos que no participan  ($d_i = 0$), la probabilidad es simplemente  $P(y_i^{1*} \leq 0)$.  Para los individuos que participan  ($d_i = 1$), la probabilidad es la probabilidad conjunta de observar  $y_i^{1*} > 0$  y  $y_i^{2*}$.

### **Supuesto de Normalidad** 

**Elemento Clave** para simplificar la función de verosimilitud, se asume que los errores  $\epsilon_{i1}$  y  $\epsilon_{i2}$  tienen una distribución conjunta bivariada normal estándar:

  $$
  \begin{pmatrix}
  \epsilon_{i1} \\
  \epsilon_{i2}
  \end{pmatrix} \sim \mathcal{N}
  \begin{pmatrix}
  0, &
  \begin{pmatrix}
  1 & \rho \\
  \rho & 1
  \end{pmatrix}
  \end{pmatrix}.
  $$

**Probabilidad de Participación:**  Bajo este supuesto, la probabilidad de participación se puede expresar como:

$$P(y_i^{1*} > 0) = \Phi\left( \frac{x_{i1}'\beta_1}{\sqrt{1-\rho^2}} \right)$$

donde  $\Phi(\cdot)$  es la función de distribución acumulada de la normal estándar.

Bajo el supuesto de normalidad, la log-verosimilitud para este modelo está dada por:

$$\ell(\beta_1, \beta_2, \rho) = \sum_{y_i = 0} \ln\left( \Phi\left( \frac{x_{i1}'\beta_1}{\sqrt{1-\rho^2}} \right) \right)
   + \sum_{y_i = 1} \ln\left( \phi\left( \frac{y_i^{2*} - x_{i2}'\beta_2}{\sqrt{1-\rho^2}} \right) \cdot \Phi\left( \frac{x_{i1}'\beta_1 + \rho \frac{y_i^{2*} - x_{i2}'\beta_2}{\sqrt{1-\rho^2}}}{\sqrt{1-\rho^2}} \right) \right).
 $$

donde  $\phi(\cdot)$  es la función de densidad de la normal estándar.

### Método de Heckman en Dos Pasos (Heckit)

**Alternativa a la Máxima Verosimilitud**  El método de Heckman en dos pasos es una alternativa a la estimación por máxima verosimilitud.  Es computacionalmente menos costoso, pero requiere el supuesto de normalidad de los errores.

Idea general de los pasos:

1.  **Relación entre los Errores:**  Bajo el supuesto de normalidad bivariada, la relación entre los errores de las dos ecuaciones se puede escribir como:

    $$
    \epsilon_{i2} = \rho \epsilon_{i1} + \xi_i,
    $$
    
    donde  $\xi_i$  es independiente de  $\epsilon_{i1}$  y  $\xi_i \sim \mathcal{N}(0, \sigma^2_\xi)$.

2.  **Media Condicional:**  La media condicional del outcome  ($y_i^{2*}$)  dado que el individuo participa  ($y_i^{1*} > 0$)  es:

    $$
    \mathbb{E}(y_i^{2*} | y_i^{1*} > 0) = x_{i2}'\beta_2 + \rho \lambda(x_{i1}'\beta_1),
    $$
    
    donde  $\lambda(\cdot)$  es el **Inverse Mills Ratio** $\lambda(x) = \frac{\phi(x)}{\Phi(x)}$.

**Corrección del Sesgo:**  El término  $\rho \lambda(x_{i1}'\beta_1)$  corrige el sesgo de selección.  La relación de Mills inversa  ($\lambda(x)$)  captura la información sobre la selección no aleatoria de la muestra.

El método de Heckman, también conocido como Heckit, es un procedimiento en dos pasos que se utiliza para corregir el sesgo de selección en modelos de regresión.  Este método es una alternativa a la estimación por máxima verosimilitud completa y es especialmente útil cuando se asume una distribución normal bivariada para los errores.

**Pasos:**

1.  **Probit para la Participación:**

    - Se estima un modelo probit para la variable indicadora de participación  $d_i$, donde  $d_i = 1$  si el individuo participa  ($y_i^{1*} > 0$)  y  $d_i = 0$  en caso contrario.  
    - La probabilidad de participación se modela como:

      $$
      P(d_i = 1 | x_{i1}) = \Phi(x_{i1}'\beta_1),
      $$
    
      donde  $\Phi(\cdot)$  es la función de distribución acumulada de la normal estándar.
    - Se obtienen las estimaciones de los coeficientes  $\hat{\beta}_1$  del modelo probit.
    - Se calcula la relación de Mills inversa  ($\lambda$)  para cada individuo utilizando las estimaciones del probit:

      $$
      \hat{\lambda}_i = \lambda(x_{i1}'\hat{\beta}_1) = \frac{\phi(x_{i1}'\hat{\beta}_1)}{\Phi(x_{i1}'\hat{\beta}_1)},
      $$
    
2.  **Regresión OLS Aumentada:**

    - Se estima la ecuación de resultado  ($y_i^{2*}$)  mediante una regresión OLS que incluye la relación de Mills inversa  ($\hat{\lambda}_i$)  como una variable explicativa adicional:
    
        $$
        y_i^{2*} = x_{i2}'\beta_2 + \rho \sigma_2 \hat{\lambda}_i + \nu_i,
        $$
    
        donde  $\rho$  es la correlación entre los errores de las dos ecuaciones y  $\sigma_2$  es la desviación estándar del error en la ecuación de resultado.
    - La inclusión de  $\hat{\lambda}_i$  corrige el sesgo de selección.

**Ventajas del Método Heckit:**

    - **Simplicidad:**  Es fácil de implementar, ya que solo requiere la estimación de un modelo probit y una regresión OLS.
    - **Amplitud:**  Es aplicable a una amplia variedad de modelos de selección, como el análisis del mercado laboral, la participación en programas sociales y las decisiones de inversión.
    - **Supuestos:**  Requiere menos supuestos que la máxima verosimilitud completa, pero asume la normalidad conjunta de los errores  $\epsilon_{i1}$  y  $\epsilon_{i2}$.

Sobre **Prueba de Hipótesis:**

    - Se puede realizar una prueba de hipótesis para determinar si la correlación entre los errores  ($\rho$)  es significativamente diferente de cero: $H_0: \rho = 0$.
    - Si se rechaza la hipótesis nula  ($H_0$), se recomienda utilizar la máxima verosimilitud completa (MLE) en lugar de OLS, ya que OLS no captura adecuadamente el sesgo de selección cuando  $\rho \neq 0$.

**Comparación de Métodos:**  
- Es recomendable comparar los resultados del método de Heckman (Heckit) con los de la máxima verosimilitud completa (MLE) en un ejemplo práctico.  Esto ayuda a comprender las diferencias entre los métodos y el impacto del sesgo de selección en las estimaciones.
- La comparación de los métodos también puede ayudar a clarificar las diferencias entre selección, censura y truncamiento, y a comprender cómo cada uno de estos problemas afecta la estimación de los modelos de regresión.

**Nota:**  Siempre es importante entender los supuestos y limitaciones de cada método para seleccionar el más adecuado en contextos prácticos.

<hr>
