(Ch_LDV)=

# 4. Variable Dependiente Limitada 

**LDVs: _Limited Dependent Variables_**

## Introducción

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

&nbsp;

## Diapositivas

A continuación se incluyen las diapositivas empleadas. Para avanzar hacer click sobre la diapositiva y luego usar las flechas del teclado.

Nota: puede tomar unos segundos en aparecer el material.

<div id   ="Container"
     style="padding-bottom:50.25%; position:relative; display:block; width: 100%">
     <iframe id                 ="my_html_slides"
             width              ="85%"
             height             ="100%"
             src                ="https://www.luischanci.com/presentations/Econometrics/econometria_4.html#/"
             frameborder        ="0"
             allowfullscreen    ="1"
             style              ="position:absolute; top:5%; left: 5%">
     </iframe>
</div>
</br>

`````{admonition} Enlace
:class: note
[Descargar diapositivas en PDF.](https://www.luischanci.com/presentations/Econometrics/econometria_4.pdf)
`````

</br>
