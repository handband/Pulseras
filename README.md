# Pulseras
Recopilación y ejemplos para creación de pulseras, certificados, credenciales, pvc con data variable

Variables útiles:
* pdf.fill_color "FFFFFF" : Permite cambiar el color de la fuente del pdf adjunto  
* pdf.stroke_bounds : Si está dispuesto dentro de una caja contenedora, permite dibujar los bordes de la caja, para entender hasta donde se expandirá la variable a agregar dentro de la caja.

## Pulseras laser (/pulseras-laser)
Contiene un script que permite crear pulseras de tipo laser con data variable.
> Variables importantes: 
 * total : Define la cantidad de pulseras que se generarán
 * start_from : Define el número desde el cual parte el código de barras y texto bajo el código
 * counter : Controla la cantidad de pulseras por página que se imprimirán
 * sec : Controla que el número de pulseras generadas no supere al total (creo que no es necesaria)

## Certificados (/certificados)

### Generacion individual (/certificados/Generación individual)
Permite la generación de certificados de con uno o más valores dada una entrada por stdin.

> Variables importantes:
* x,y : Lugar donde el texto quedará dispuesto en el certificado
* box_width, box_height : Ancho y alto de la caja contenedora del texto
* letter_size : Define el tamaño de la letra que estará dentro del texto, limitado por el box_width y box_height, dado que está limitado por la propiedad  ":overflow => :shrink_to_fit", si dicha propiedad es cambiada a ":overflow => :expand" el texto se saldrá de la caja contenedora

>> Ejemplo de uso en generación de certificados individuales
```
$ ruby generacion_individual.rb "base.pdf" "texto_variable"
```

### Generacion dada una lista (/certificados/Generación dada una lista)
Permite la generación de certificados de con uno o más valores dada una lista de datos en xls

> Variables importantes:
* x,y : Lugar donde el texto quedará dispuesto en el certificado
* box_width, box_height : Ancho y alto de la caja contenedora del texto
* letter_size : Define el tamaño de la letra que estará dentro del texto, limitado por el box_width y box_height, dado que está limitado por la propiedad  ":overflow => :shrink_to_fit", si dicha propiedad es cambiada a ":overflow => :expand" el texto se saldrá de la caja contenedora



