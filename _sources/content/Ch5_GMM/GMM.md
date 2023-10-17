(Ch_GMM)=

# 5. Método de Momentos

**GMM: _Generalized Method of Moments_**

## Introducción

- Hasta ahora, MLE:
  * Conjunto de obs., $\{y_i\}$, cuya pdf depende de $\theta$.
  * MLE selecciona el $\hat{\theta}$ a partir del valor para el cual hay mayor probabilidad de observar el conjunto de datos.
  * Se requiere la forma la verosimilitud (basado en la función de distribución de probabilidad - pdf).
- Ahora pasamos a revisar otra alternativa: GMM {cite:p}`hansen1982`
- Clave: requiere especificación de solo ciertos momentos en vez de la pdf completa.


## Método de Momentos (MM)

- Ejemplo:
  * Sea $y_i\sim t-student(\nu)$

    $$\begin{eqnarray*} f(y|\nu)=\frac{\Gamma((\nu+1)/2)}{(\pi y)^{1/2}\Gamma(\nu/2)}(1+(y^2/\nu))^{-(\nu+1)/2} \end{eqnarray*}$$

  * Disponemos de la información $\{y_i\}$ y se quiere estimar $\nu$
  * En MLE se obtendría el estimador a partir de la maximización de $l=\sum_ilog f(y_i|\nu)$.
  * Ahora, en MM:
    - Considerando que $\nu>2$, estándar $t$ tiene $\mathbb{E}(y)=0$ y $\mathbb{E}(y^2)=\nu/(\nu-2)$. A medida que $\nu→∞$, $var→1$, $f(\cdot)\rightarrow N(0,1)$.
    - Sea $\hat{\mu}_2=(1/N)\sum_i{y_i^2}$, para $N\rightarrow\infty$,

      $$\hat{\mu}_2\rightarrow_p\mathbb{E}(y^2)$$

      por ende, un estimador consistente para $\nu$ sería

      $$\frac{\nu}{\nu-2}=\hat{\mu}_2$$

      en otras palabras,

      $$\frac{2\hat{\mu}_2}{\hat{\mu}_2-1}$$

      (definido para $\hat{\mu}_2>1$).

    - Este estimador es conocido como el **estimador clásico de momentos (_the classical method of moments estimator_)**.

- Idea general:

  Dado un vector desconocido de parámetros $\theta_{k\times1}$, suponga que se pueden computar $k$ diferentes momento poblacionales asociados a la variable aleatoria $y$ como una función de $\theta$, tal que

  $$\mathbb{E}(y_i^j)=\mu_j(\theta)\hspace{0.4cm}para\,\,\,j=\{j_1,...,j_k\}$$

  El estimador clásico de momentos de $\theta$ es el valor de $\hat{\theta}_N$ para el cual los momentos poblacionales son igualados a los muestrales: $\mu_j(\hat{\theta}_N)=\frac{\sum y_i^j}{N}$.

## Método Generalizado de Momentos (GMM)
- Ejemplo:

  En el caso anterior de la $t-student$ empleamos un solo momento para obtener $\nu$. Sin embargo, es posible querer usar algunos momentos diferentes. Por ejemplo, el cuarto momento:

 $$\mu_4=\frac{3\nu^2}{(\nu-2)(\nu-4)}$$

 para el cual esperaríamos que fuera cercano a

 $$\hat{\mu}_4=\left(\frac{1}{N}\right)\sum{y_i^4}$$

 Así, al emplear dos momentos, el segundo y el cuarto, se buscaría seleccionar $\nu$ tal que los valores obtenidos para los momentos a partir de la muestra fueran lo más cercano posible a las expresiones poblacionales.

 Sin embargo, al tener dos momentos y un parámetro, se busca minimizar una función objetivo/criterio del tipo (familia $L^2$-Norm)

 $$Q(\nu;y_N,...,y_1)=g'\cdot W\cdot g$$

 en donde,

 $$\begin{eqnarray} g\equiv \left[\begin{array}{c} \hat{\mu}_2-\nu/(\nu-2) \\ \hat{\mu}_4-3\nu^2/[(\nu-2)(\nu-4)] \end{array}\right] \end{eqnarray}$$

 $W$ es una matriz simetrica 2x2 definida positiva de ponderadores que reflejan la importancia que se da a (‘alcanzar’) cada momento. Ej. a mayor valor del elemento $w_{1,1}$ en $W_N$, mayor es la importancia que se da a estar cercano de satisfacer $\hat{\mu}_2-\nu/(\nu-2)$. En el caso de $W=I_2$, se asigna igual importancia a los dos momentos.

### Formulación de Hansen:
- Sea $w_i$ un vector $h\times1$ de variables observadas
- Sea $\theta$ un vector $k\times1$ de parámetros desconocidos
- Sea $h(\theta,w_i)$ un vector $r\times1$ de funciones, $$h:\,(\mathbb{R}^k\times\mathbb{R}^h)\rightarrow\mathbb{R}^r$$
- Sea $\theta_0$ el verdadero vector de parámetros, y supongamos se encuentra caracterizado por $$\mathbb{E}\{h(\theta_0,w_i)\}=0$$
  llamadas también condiciones de ortogonalidad.
- Sea $X_N=(w_N,...,w_1)$ un vector $Nh\times1$ que contiene todas las observaciones (la muestra de tamaño $N$).
- Sea $g(\theta;X_N)$ un vector $r\times1$ de promedios de funciones de $h(\theta,w_i)$, para $g:\mathbb{R}^k\rightarrow\mathbb{R}^r$, definido por

  $$g(\theta,X_N)=\frac{1}{N}\sum{h(\theta;w_i)}$$

- La idea en GMM es seleccionar $\theta$ tal que los momentos muestrales $g(\theta;X_N)$ sean cercanos a los momentos poblacionales en cero. Así, el estimador de GMM, $\hat{\theta}_N$, es el valor de $\theta$ que minimiza

$$Q(\theta;X_N)=\left( g(\theta,X_N) \right)' W_N \left( g(\theta,X_N) \right)$$
con $\{W_N\}_{N=1}^\infty$ como una secuencia de matrices de ponderadores, la cual puede se runa función de los datos $X_N$.

- Retomando el ejemplo ($t-student$),
  * $r=2$
  * el vector $h$ estaría dado por

    $$ h(\theta,w_i)= \left[\begin{array}{c} y_i^2-\nu/(\nu-2) \\ y_i^4-3\nu^2/[(\nu-2)(\nu-4)] \end{array}\right]$$

  * el vector $g$ estaría dado por

    $$ g(\theta,X_N)= \frac{1}{N}\left[\begin{array}{c} \sum y_i^2-\nu/(\nu-2) \\ \sum y_i^4-3\nu^2/[(\nu-2)(\nu-4)] \end{array}\right]$$

  * por ende $\hat{\nu}$ se puede obtener a partir de

    $$\min_{\nu}{[g(\theta;X_N)]'W_N[g(\theta;X_N)]}$$

### (Sobre) Identificación

- Si el número de parámetros $k$ es el mismo que el número de condiciones de ortogonalidad $r$, la función objetivo puede, en general, reducirse a hacer $g(\hat{\theta}_N;X_N)=0$. Es decir, si $k=r$, el estimador de GMM resulta de satisfacer (o resolver) las $r$ ecuaciones. En tal caso, se dice que el sistema se encuentra exactamente identificado ($k=r$).

- El caso de $r>k$ sería sobre-identificación. Se involucran más condiciones de ortogonalidad de las necesarias para el número de parámetros y podría no ser posible encontrar un $\hat(\theta)$ que cumpla todas las restricciones (de cero) al mismo tiempo (e.g., las $r$ ecuaciones de forma separada). En otras palabras, si se tienen más condiciones de ortogonalidad en comparación al número de parámetros a estimar, $r>k$, se genera sobre identificación y emplear la condición $g(\hat{\theta}_N;X_N)=0$ podría no ser suficiente para identificar los parámetros.

- En ese caso, se emplea la matriz $r\times r$ de ponderadores. Así, que tan cercano se encuentre $g()$ a 0 dependerá de cuanto peso se le de a una condición de ortogonalidad sobre otra en la matriz $W$.

### Otros estimadores vistos como casos de GMM
Algunos estimadores pueden entenderse como ejemplos particulares de GMM. Por ejemplo,
- OLS
- IV
- 2SLS
- Nonlinear simultaneous equations estimators
- (muchos casos de) MLE

### Matriz Óptima de Ponderadores ($W$)
- **Teoría.** Suponiendo que $\{h(\theta_0,w_i)\}$ tiene media cero, que la matriz de varianza covarianza es dada por $\Omega_\nu=\mathbb{E}\{(h(\theta_0,w_i))(h(\theta_0,w_j))'\}$, y que las covarianzas (para series de tiempo por ejemplo) son '_absolute sumable_', para $\mathbb{S}=\sum_\nu\Omega_\nu$, donde $\mathbb{S}$ es la varianza asintótica de la media muestra en $h(\theta_0,w_i)$

  $$\mathbb{S}=\lim_{N\rightarrow\infty}\,N\,\mathbb{E}\{(g(\theta_0;X_N))(g(\theta_0;X_N))'\}$$

  por ende, el valor óptimo para $W_N$ estaría dado por $\mathbb{S}^{-1}$.

  Considerando que $\mathbb{S}$ depende de $\theta$, se tendría que

  $$\hat{\mathbb{S}}_N\equiv \left(\frac{1}{N}\right)\sum_i[h(\hat{\theta}_N,w_i)][h(\hat{\theta}_N,w_i)]'\rightarrow_p\,\mathbb{S}$$

  para cualquier estimador consistente de $\theta_0$.

  Notar que, (tal vez) en palabras más simples, lo anterior quiere decir que para obtener $W_N$ se necesita $\hat{\theta}$. Pero recordemos que $W_N$ es necesaria para minimizar la función oibjetivo en GMM, y por ende obtener los parámetros estimados $\hat{\theta}$. En síntesis, !hay una circularidad!.

  </br></br>

- **Aproximación práctica.** Procedimiento iterativo.
  * Proponer un forma inicial para $W^{(0)}$ (plantear un guess). Por ejemplo, $W^{(0)}=I$.
  * Emplear $W^{(0)}$ en la función objetivo $Q$ de GMM para llevar a cabo la minimización y, así, poder estimar $\theta$, obteniendo $\hat{\theta}^{(0)}$.
  * Usar $\hat{\theta}^{(0)}$ para estimar $\mathbb{S}$, obteniendo $\hat{\mathbb{S}}^{(0)}$.
  * Actualizar $W$ a $W^{(1)}$, con $W^{(1)}=(\hat{\mathbb{S}}^{(0)})^{-1}$, obteniendo a su vez un nuevo valor $\hat{\theta}^{(1)}$.
  * Repetir la iteración hasta que $\hat{\theta}^{(j)}\equiv \hat{\theta}^{(j+1)}$.

### Distribución Asintótica
- Sea $\hat{\theta}_N$ el valor que minimiza $[g(\theta,X_N)]'\hat{\mathbb{S}}^{-1}_N[g(\theta,X_N)]$
- Por ende, el estimador obtenido de GMM es una solución al sistema:

  $$\left[\left.\frac{\partial g(\theta,X_N)}{\partial \theta'}\right|_{\theta=\hat{\theta}}\right] \hat{\mathbb{S}}^{-1}_N g(\hat{\theta}_N,X_N)=0$$

- Considerando que $g(\theta,X_N)$ es la media muestral de un proceso asociado a una media poblacional de cero, dadas algunas condiciones adiconales (por ejemplo, continuidad de $h(\cdot)$), $g(\theta,X_N)$ debería satisfacer el _CLT_. Por ende,

 $$\sqrt{N}g(\theta_0,X_N)\rightarrow_L N(0,\mathbb{S})$$

- Proposición: Sea $g(\theta_0,X_N)$ diferenciable y sea $\hat{\theta}_N$ el estimador de GMM (para $r\geq k$).Suponiendo que se satisface:

  * a) $\hat{\theta}_N\rightarrow_p\theta_0$
  * b) $\sqrt{N}g(\theta_0,X_N)\rightarrow_L N(0,\mathbb{\mathbb{S}})$
  * c) $plim\left(\partial g(\cdot)/\partial\theta\right)_{\theta=\hat{\theta}_N}\equiv D'$, donde las columnas de $D$ son linealmente independientes.

 Por ende,

 $$\sqrt{N}(\hat{\theta}_N - \theta_0)\rightarrow_L N(0,V)$$

 con $V=(D\mathbb{S}^{-1}D')^{-1}$


#### Test para restricciones de sobre identificación
- {cite:t}`hansen1982` propone un test para evaluar si todos los momentos muestrales $g(\hat{\theta}_N;X_N)$ son cercanos a cero, tal como se esperaría si los momentos poblacionales $\mathbb{E}(h(\theta_0;w_i))$ fueran verdaderamente cero.

- Considerando que $\sqrt{N}g(\theta_0;X_N)\sim N(0,\mathbb{S})$ y que $g(\hat{\theta}_N;X_N)$ contiene ($r-k$) variables aleatorias (no degeneradas), un test para evaluar que las restricciones de sobreidentificación son válidas es:

  $$\left(\sqrt{N}g(\theta_0;X_N)\right)' \hat{\mathbb{S}}_N^{-1} \left(\sqrt{N}g(\theta_0;X_N)\right)\rightarrow_L \chi^2_{(r-k)}$$

  En otras palabras, es básicamente un test para estudiar que tan cercano es $g(\hat{\theta}_N;X_N)$ de cero. Así, si se rechaza la hipótesis nula $H_0:\,\mathbb(E)\{g(\theta_0;X_N)\}$, entonces el estimador GMM es inconsistente para $\theta$.
