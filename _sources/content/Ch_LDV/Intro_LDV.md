# Modelos con Variable Dependiente Limitada 

## ( _Limited Dependent Variables_ - LDVs) 


En esta sección revisaremos algunos modelos para abordar la estimación cuando la variable dependiente $y$ presenta algún tipo de limitación en los valores que puede adoptar. Un ejemplo sencillo sería pensar en que el interés del investigador se encuentra en modelar la decisión de una mujer de participar en el mercado laboral o no después de haber tenido un/a hijo/a. Podemos notar que en este caso la variable dependiente es discreta (elección binaria o cualitativa) y se puede representar de la siguiente forma:

$$\begin{array}{ccl}
Y=1& & \text{Si participa en el mercado laboral}\\ 
Y=0& & \text{Si no participa en el mercado laboral}\\ 
\end{array}$$

Dependiendo de la aplicación práctica, los modelos lineales aún logran proveer una aproximación razonable cuando la variable dependiente es discreta (como en el ejemplo anterior). Pero considerando que otros tipos de limitaciones, la cuales son abordadas con modelos canónicos cubiertos en los textos de econometría, revisaremos una serie de modelos alternativos. Estos modelos no son lineales y emplean supuestos sobre la distribución de probabilidad. De forma más específica, algunos de los modelos que revisaremos son:

* Probabilidad Lineal para elección binaria (respuesta cualitativa).
* Probit - Logit, también conocido como regresión logística para elección binaria.
* Modelos de elección múltiple (logit multinomial, condicional, anidado, probit ordenado, etc.)
* Modelos Tobit y Heckman.
* Modelo Poisson para datos de recuento.

Finalmente, considerando que en la mayoría de estos modelos la forma de obtener estimadores recae en la técnica de Máxima Verosimilitud, partiremos primero por realizar una breve revisión de este método.

```python

```
