# Modelos LP, Logit y Probit

## Variable dependiente binaria

Supongamos que la variable dependiente observada toma valores discretos como los siguientes:

$$\begin{array}{ccl}
Y=1& & \text{Si se cumple cierta condición}\\ 
Y=0& & \text{Si no se cumple cierta condición}\\ 
\end{array}$$

una interpretación sencilla de la predicción de $Y$, o media condicional de la población, sería pensar en el número de casos que cumplen la condición respecto al número total de casos u observaciones. Es decir, para $Y=\mathbb{E}(Y|X)+u$, se tendría que $\mathbb{E}(Y|X)$ sería la probabilidad que $Y=1$. 

Notar que la motivación inicial de presentación del modelo de elección binaria se centra en pensar en $\mathbb{E}(Y|X)$ como una probabilidad. Así, el objetivo de la sección se centra en modelar dicha probabilidad. Al final de la sección presentaré una motivación al tema basada en el modelo de utilidad aleatoria. 

De forma equivalente, podríamos decir que si la variable dependiente $Y$ solo los dos valores (0,1), se puede entender su resultado como el de un ensayo Bernoulli: se cumple o no una condición con cierta probabilidad. Por ende, si $p$ es la probabilidad de que la variable tome el valor de 1, la probabilidad de $Y=1$ estará dada por la función de expectativa condicional: $p=\mathbb{E}(Y|X)$.

En esta subsección abordaremos tres modelos de econometría para este tipo de variable dependiente. El nombre particular que adopta el modelo de econometría cambia según la función particular que se emplee para modelar la probabilidad. En particular, estudiaremos los siguientes modelos: 

* Modelo de Probabilidad lineal ( _Linear Probability_ - LP ): Emplea una función lineal ( _OLS_ ).  
* Modelo Probit: Modela la probabilidad empleando una f.d.p. normal.
* Modelo Logit: Modela la probabilidad empleando una f.d.p. logística.

</br></br>

## Modelo de Probabilidad Lineal

**LPM: _Linear Probability Model_**

En el modelo lineal la probabilidad estaría dada por $p=\mathbb{E}(Y|X)=X\beta$. Es decir, sería el modelo de econometría _OLS_ ya visto:

$$Y=X\beta + u$$

En algunos textos de econometría se tiende a resaltar los siguientes dos argumentos como desventaja de usar el LPM:
- predecir **probabilidades fuera del intervalo** $[0,1]$. En particular, no hay garantía que, por ejemplo, $\hat{\beta}_0+\hat{\beta}_1x_i$ genere un valor positivo y menor a 1.
- **heteroscedasticidad**. Como $Y$ sigue un ensayo Bernoulli, la varianza estaría dada por $p(1-p)=X\beta(\iota-X\beta)$, donde $\iota$ es un vector de unos. Es decir, la varianza cambia con $X$ (deja de ser contante).

Respecto al segundo punto, si sabemos la forma de la heteroscedasticidad, podríamos aprovechar la consistencia de los estimaodres de _OLS_ y emplear una especie de procedimiento en dos etapas para corregirla (GLS). 

Respecto al primer punto, en muchas aplicaciones prácticas (e.g., datos cercanos a la media), el modelo lineal puede generar una aproximación razonable. El modelo lineal se estima de forma sencilla, sin implicar supuestos "fuertes" por no especificar una función de distribución de probabilidad, y los efectos marginales son de fácil lectura/presentación (son solo los $\beta$'s). 

Por ende, es común ver en investigaciones cientificas con variable dependiente binaria el uso del LPM.

## Modelos Probit y Logit

En el modelo **Probit** y **logit** se trata de modelar la probabilidad $p$ dentro de valores [0,1] mediante el uso de funciones de distribución de probabilidad. En particular, en el probit se emplea la función de distribución acumulada de la normal estándar, $p=\mathbb{E}(Y|X)=\Phi(X\beta)$, con $\Phi(\dot)=(\sqrt{2\pi}\int_{-\infty}^{x_i'\beta}{exp(-t^2/2)dt})$). En el logit se emplea la distribución de probabilidad logística, $p=\mathbb{E}(Y|X)=\Lambda(X\beta)=(1+exp(-X\beta))^{-1}$ (de ahí que se llame regresión logística).

De forma equivalente, se puede plantear el anterior resultado a partir de motivar los modelos logit/probit a partir de una variable latente (no observada). Es decir, en el caso del ejemplo de la participación laboral (la decisión de participar en el mercado laborar), supongamos que hay una variable latente $Y^{*}$ (no observada) que satisface

$$Y^*=X\beta+u$$

Podemos pensar en esta variable latente como una variable con 'mayor libertad', en el sentido que puede ser no negativa y/o continua ("no limitada"). Así, en el caso particular de tomar valores en una dirección específica (por ejemplo, valores positivos), su contra parte observada (por el investigador) tomaría el valor de 1. Es decir, $Y=\mathbf{1}[Y^*>0]$, en donde $\mathbf{1}$ es una función indicador. 

Por ende, bajo el supuesto de que $u\sim\mathbb{N}(0,1)$, la probabilidad $p$ estaría dada por

$$p=\mathbb{E}(Y|X)=P[Y=1|X]=P[u<X\beta]=\Phi(X\beta)$$   

**Estimación.** Una primer pregunta sería si aún podríamos usar la aproximación de _OLS_ (minimizar residuos al cuadrados) para obtener los parámetros estimados, y la respuesta sería, en principio, sí:

$$min_\beta\,(Y-\mathbb{E}(Y|X))'(Y-\mathbb{E}(Y|X))$$

es decir, sería mínimos cuadrados no lineales (NLS). Desventajas adicionales de querer seguir con _OLS_ se asocian a la eficiencia del estimador (ya no es _BLUE_) y complejidad computacional innecesaria.

Por ende, dado que se planteó la función de distribución de probabilidad, se puede emplear un estimador eficiente (en términos de la cota de Cramér–Rao) y computacionalmente más fácil: {ref}`Ch_MLE`.

En particular, al considerar que $Y$ corresponde a un ensayo Bernoulli con probabilidad $p$, la función de probabilidad para una observación particular $i$ estaría dada por

$$p_i^{Y_i}(1-p_i)^{1-Y_i}$$

en donde se reemplaza la probabilidad $p_i=F(X_i'\beta)=F_i$ por la f.d.p. normal $\Phi(X_i'\beta)$ para el caso del Probit o por la f.d.p. logística $\Lambda(X_i'\beta)$ para el caso del Logit. Por ende, el vector de parámetros estimados se puede obtener a partir de maximizar (el logaritmo de) la función de verosimilitud ( _log-likelihood_ ):

$$\hat{\beta}=\text{arg max}_\beta\,\sum_{i}^n{\left( Y_i\cdot\text{Ln}(p_i) + (1-Y_i)\cdot\text{Ln}(1-p_i)\right)}$$

Las condiciones necesarias de primer orden estarían dadas por una expresión no lineal,

$$\frac{\partial \ell}{\partial\beta}=\sum\left\{\frac{(Y_i-F_i)}{F_i(1-F_i)}X_i'\right\}$$

la cual por cierto, al definir $w_i=(F_i(1-F_i))^{-1}$, se puede ver como mínimos cuadrados ponderados no lineales (NWLS): $\sum\left\{w_i(Y_i-\mathbb{E}(Y_i|X))X_i\right\}$. Y en el caso del LPM, $w_i=1$ y, por ende, serían las mismas condiciones de primer orden de OLS: $\sum\left\{(Y_i-X_i'\beta)X_i\right\}$. 

De hecho, {cite:t}`amemiya1981q` muestra que para valores de probabilidad entre 0.1 y 0.9 habría cierto grado de relación entre los coeficientes estimados en el LPM, el logit y el probit. Específicamente: $\beta_{Logit}\approx4\beta_{OLS}$; $\beta_{Probit}\approx 2.5\beta_{OLS}$; $\beta_{Logit}\approx1.6\beta_{Probit}$.

Finalmente, las condiciones necesarias de segundo orden, importantes para la matriz de varianza basada en la matriz Hesiana, serían

- logit:

  $$\frac{\partial^2 \ell}{\partial\beta\partial\beta'}=-\sum\left\{\Lambda_i(1-\Lambda_i)X_iX_i'\right\}$$

- Probit: 
  
  $$\frac{\partial^2 \ell}{\partial\beta\partial\beta'}=-\sum\left\{\psi_i(\psi_i-X_i'\beta)X_iX_i'\right\}$$
  con $\psi_i=\phi_i/\Phi_i$ si $Y_i=1$ o $\psi_i=-\phi_i/(1-\Phi_i)$ si $Y_i=0$.

</br>

**Efectos Marginales.** Finalmente, es importante resaltar que los parámetros estimados en el logit/probit no corresponden a los efectos marginales. Es decir, el efecto marginal de un cambio en un regresor $j$ es

$$\frac{\partial \mathbb{E}(Y_i|X)}{\partial X^{(j)}}$$

el cual **en el LPM sería** 

$$\frac{\partial \mathbb{E}(Y_i|X)}{\partial X^{(j)}}=\frac{\partial X\beta}{\partial X^{(j)}}=\beta_{(j)}$$

Mientras que en el modelo logit o probit, sería 

$$\frac{\partial \mathbb{E}(Y_i|X)}{\partial X^{(j)}}=\frac{\partial F(X_i'\beta)}{\partial X^{(j)}}=\frac{\partial F(X_i'\beta)}{\partial X\beta}\frac{\partial X\beta}{\partial X^{(j)}}=f_i\cdot\beta_{(j)}$$

Es decir, después de estimar el modelo logit o probit, habría que emplear los parámetros estimados para el computo de $f_i=f(X_i\beta)$. Y una pregunta que emerge al ver que el efecto marginal varia sería: ¿En qué valor de $X_i^{(j)}$ evaluar?. Una práctica sencilla sería emplear el promedio de $X^{(j)}$. Otra alternativa sería evaluar el efecto marginal en cada $X_i$ y luego computar el promedio.


</br>

## Modelo Utilidad Aleatoria

Una motivación alternativa a los modelos de elección binaria es el modelo de utilidad aleatoria. Supongamos que un individuo enfrenta dos opciones entre las cuales elegir ($j=\{0,1\}$). Cada opción le entrega cierto nivel de utilidad al individuo. Supongamos que la utilidad se compone de una parte no aleatoria - predecible con ciertas características observables $X_i'\beta^{j}$, y de una parte aleatoria $e_i^{(j)}$. Por ende, el individuo elegirá una opción, por ejemplo, $j=1$, si esa opción 1 le reporta mayor utilidad: $X_i'\beta^{1}+e_i^{1}>X_i'\beta^{0}+e_i^{0}$. Lo cual se puede escribir como $X_i'\beta=X_i'(\beta^{1}-\beta^{0})>(e_i^{0}-e_i^{1})$. Por ende, al asociar una función de probabilidad acumulada a la parte aleatoria compuesta ($F(e_i^{0}-e_i^{1})$) se tendría que la probabilidad de elegir la opción 1 estaría dada por $Pr(Y=1)=F(X'\beta)$, que fue el modelo que plantamos al inicio. [^Footnote:CT148]


[^Footnote:CT148]: Nota: Recomiendo ver sección 14.8 en {cite:t}`cameron2005` para más detalles sobre la relación entre la f.d.p. de valor extremo y la logística.

</br>
<hr>
