# Modelos con Variable Dependiente Limitada 

##  LDVs: _Limited Dependent Variables_ 

En esta sección revisaremos algunos modelos para abordar la estimación cuando la variable dependiente $y$ presenta algún tipo de limitación en los valores que puede adoptar. Un ejemplo sencillo sería pensar en que el interés del investigador se encuentra en modelar la decisión de una mujer de participar en el mercado laboral o no después de haber tenido un/a hijo/a. Podemos notar que en este caso la variable dependiente es discreta (elección binaria o cualitativa) y se puede representar de la siguiente forma:

$$Y=\left\{
\begin{array}{ccl}
1& & \text{Si participa en el mercado laboral}\\ 
0& & \text{Si no participa en el mercado laboral}\\ 
\end{array}\right.$$

Dependiendo de la aplicación práctica, el modelo de regresión lineal podría servir para obtener una aproximación razonable de los efectos marginales cuando la variable dependiente es discreta (como en el ejemplo anterior). Sin embargo, en esta sección iremos un poco más allá del modelo lineal y de variables dependientes dicotómicas. Es decir, consideraremos modelos no lineales y casos con otros tipos de limitaciones en la variable dependiente. Varios de los modelos que revisaremos son canónicos en el sentido que son cubiertos en los textos de econometría. Específicamente, algunos de los modelos que revisaremos son:

* Probabilidad Lineal para elección binaria (respuesta cualitativa).
* Probit - Logit, también conocido como regresión logística para elección binaria.
* Modelos de elección múltiple (logit multinomial, condicional, anidado, probit ordenado, etc.)
* Modelos Tobit y Heckman.
* Modelo Poisson para datos de recuento.

Finalmente, es de anotar que en la mayoría de estos modelos se emplean supuestos sobre la distribución de probabilidad y por ende la técnica para obtener los parámetros estimados es el {ref}`Ch_MLE`. Así, la idea central será construir la función de verosimilitud (específicamente, la función _log-likelihood_ ). 

</br>
<hr>
