# Tesis Mecatrónica 2023
## Aplicación sistemática de algoritmos de aprendizaje automático para el estudio de la epilepsia y la detección de segmentos de interés en señales bioeléctricas

<img src="/logoUVG.png" alt="Logo UVG" width="200">

![Badge en Desarollo](https://img.shields.io/badge/STATUS-EN%20DESAROLLO-green)

## Resumen

Esta tesis representa el resultado de un extenso y profundo trabajo de investigación en el campo de *ML*, procesamiento de señales y biomédica; llevado a cabo con el objetivo de abordar la detección de segmentos de interes en señales bioeléctricas.

### Objetivo de la Tesis

El propósito fundamental de esta tesis es: Aplicar los algoritmos de aprendizaje automático desarrollados en fases anteriores a una mayor cantidad de señales bioeléctricas, y mejorar el proceso de detección de segmentos de interés en las señales, para el estudio de la epilepsia. Para alcanzar este objetivo, se han definido una serie de objetivos específicos que se detallan a lo largo de la documentación.

### Estructura de la Documentación

La documentación se encuentra organizada de la siguiente manera:

**Índice**   
1. [Introducción](#id1) 
2. [Marco Teórico](#id2)
3. [Metodología](#id3)
4. [Resultados](#id4)
5. [Discusión](#id5)
6. [Conclusiones](#id6)
7. [Recomendaciones](#id7)
8. [Anexos](#id8)

## Introducción<a name="id1"></a>
En este trabajo de investigación se aborda el tema de la epilepsia y la aplicación del aprendizaje automático en su diagnóstico y tratamiento. Se destaca la importancia de utilizar algoritmos de aprendizaje automático para mejorar la detección de patrones en señales bioeléctricas relacionadas con la epilepsia. Esto ayuda a reducir el tiempo de diagnóstico en comparación con los métodos manuales tradicionales. El proyecto tiene como objetivo aplicar estos algoritmos a un mayor número de señales bioeléctricas y mejorar la identificación de segmentos de interés en estas señales. Se utilizan diferentes características en el dominio del tiempo y la frecuencia, así como transformadas Wavelet para el análisis. El trabajo incluye una revisión de las bases teóricas, descripción de experimentos, metodología y resultados. Se concluye con recomendaciones para futuras investigaciones en esta área.

## Marco Teórico<a name="id2"></a>
Una crisis epiléptica consiste en una alteración brusca y transitoria ocasionada por una actividad anormal de las neuronas, manifestándose a través de sensaciones, emociones y comportamientos extraños, espasmos musculares y pérdida de conciencia. La epilepsia implica una predisposición a experimentar crisis epilépticas recurrentes, siendo diagnosticada cuando una persona ha experimentado dos o más de estas crisis. Las crisis epilépticas se dividen en dos tipos principales: crisis generalizadas y crisis parciales o focales. En las crisis generalizadas, la descarga epiléptica afecta simultáneamente a toda la superficie del cerebro, mientras que en las crisis parciales o focales, la descarga epiléptica se origina en una parte específica del cerebro.

### Señales EEG
La electroencefalografía (EEG) es una prueba de diagnóstico neurofisiológico que consiste en la medición de la actividad eléctrica cerebral en estado de reposo, vigilia o sueño, y durante diversas activaciones. En general, la electroencefalografía se utiliza para el análisis de la actividad eléctrica cerebral en humanos con el fin de obtener información para una inspección exhaustiva de la funcionalidad cerebral, ayudando a la detección y prevención de enfermedades y trastornos. Estas ondas cerebrales se conocen como señales electroencefalográficas (señales EEG), que proporcionan información indirecta relacionada con las funciones cerebrales, incluidas, entre otras, las tareas mentales, las acciones motoras y las expresiones faciales.

### EEG Ictal
En el caso de una convulsión, el EEG se denomina EEG ictal y se caracteriza por un patrón inusual con un aumento repentino de la amplitud. Además, el comienzo de una convulsión se acompaña de un cambio repentino en la amplitud. Contenido de frecuencia que con frecuencia progresa a un patrón de picos y ondas. Debido a la variabilidad sustancial en el EEG ictal entre convulsiones, puede ser un desafío identificar el patrón de manera consistente, ya sea por medios manuales o automáticos. 

### Señales EMG
La  electromiografía (EMG) es una herramienta de diagnóstico utilizada para analizar y registrar la actividad eléctrica producida por los músculos esqueléticos. La EMG se emplea en diversos campos de la medicina, como la neurología, la medicina deportiva, la rehabilitación y el diagnóstico. Los investigadores también utilizan la EMG para estudiar los patrones de
activación muscular durante el movimiento, así como los patrones de fatiga y recuperación muscular. La EMG registra la actividad eléctrica llevada a cabo por las neuronas motoras durante las contracciones musculares y también mide la fuerza de las contracciones.

### Señales ECG
Un electrocardiograma (ECG) es una prueba médica común que registra la actividad eléctrica del corazón. Se utiliza para evaluar la salud y el funcionamiento del corazón, y puede ayudar a diagnosticar problemas cardíacos o monitorizar afecciones existentes. Durante un ECG, se colocan electrodos en el pecho, las extremidades y a veces en otros lugares del cuerpo, para medir y registrar la actividad eléctrica del corazón.

### Características en el dominio del tiempo
Las características en el dominio del tiempo se basan en el análisis de la amplitud de la señal y sus cambios a lo largo del tiempo. Algunas características comunes en el dominio del tiempo incluyen:

- Media: El valor promedio de la señal durante un intervalo de tiempo específico.
- Mediana: El valor medio de la señal durante un intervalo de tiempo específico.
- Varianza: La desviación cuadrada promedio de la señal de su valor medio.
- Desviación estándar: La raíz cuadrada de la varianza.
- Asimetría: Una medida de la asimetría de la distribución de la señal.
- Curtosis: Una medida del pico de la distribución de la señal.

### Características en el dominio de frecuencia
Las características en el dominio de la frecuencia se basan en el análisis del espectro de potencia de la señal. El espectro de potencia es un gráfico de la potencia de la señal en función de la frecuencia. Algunas características comunes en el dominio de la frecuencia incluyen:

- Potencia: La potencia total de la señal en una banda de frecuencia especificada.
- Energía: La energía total de la señal en una banda de frecuencia específica.
- Densidad espectral: La potencia de la señal por unidad de frecuencia en una banda de frecuencia especificada.
- Frecuencia centroide: La frecuencia en la que el espectro de potencia de la señal es más alto.
- Propagación: Una medida del ancho del espectro de potencia de la señal.

### Propiedades de las señales deterministas y estocásticas
Las propiedades de las señales deterministas y estocásticas se refieren a las características distintivas de dos tipos de señales en el contexto del procesamiento de señales y la teoría de la probabilidad:

- Señales Deterministas: Estas señales siguen patrones predecibles y están completamente definidas por una función matemática o un conjunto de ecuaciones. Las señales deterministas son reproducibles y no poseen elementos aleatorios. Sus propiedades incluyen una amplitud constante, una frecuencia fija y una fase invariable. Ejemplos comunes de señales deterministas incluyen señales sinusoidales, cuadradas y triangulares. Estas señales son fundamentales en aplicaciones como la teoría de la comunicación, la electrónica y la ingeniería de control.

- Señales Estocásticas: A diferencia de las señales deterministas, las señales estocásticas exhiben variabilidad y aleatoriedad. No pueden predecirse con certeza y su comportamiento se describe en términos de probabilidades y estadísticas. Las señales estocásticas pueden tener propiedades como la media, la varianza y la densidad espectral de potencia que se utilizan para caracterizar su comportamiento probabilístico. Ejemplos de señales estocásticas incluyen ruido aleatorio, señales biológicas y financieras. Estas señales se aplican en campos como el procesamiento de imágenes, el análisis de datos y la modelización de sistemas complejos.

### Aprendizaje automático
El aprendizaje automático (Machine Learning) es un tipo de inteligencia artificial (IA) que permite a las aplicaciones de software ser más precisas en la predicción de resultados sin estar explícitamente programadas para ello. Los algoritmos de aprendizaje automático utilizan datos históricos como entrada para predecir nuevos valores de salida. Existen tres tipos principales de aprendizaje automático:

- Aprendizaje supervisado
- Aprendizaje no supervisado
- Aprendizaje por refuerzo

### Aprendizaje supervisado
El aprendizaje supervisado es un tipo de aprendizaje automático en el que el modelo se entrena en un conjunto de datos etiquetados. Esto significa que los datos se han etiquetado con la salida correcta. El modelo aprende a predecir la salida de nuevos datos en función de los datos etiquetados en los que se ha entrenado.

El aprendizaje supervisado se utiliza para una variedad de tareas, incluidas la clasificación, la regresión y la previsión. Las tareas de clasificación implican predecir la categoría de un punto de datos, como si un correo electrónico es spam o no. Las tareas de regresión implican predecir un valor numérico, como el precio de una casa. Las tareas de previsión implican predecir valores futuros, como el número de ventas en un mes determinado.

Hay muchos modelos diferentes de aprendizaje supervisado, cada uno con sus propias fortalezas y debilidades. Algunos de los modelos de aprendizaje supervisado más comunes incluyen:

- Regresión lineal
- Regresión logística
- Árboles de decisión
- Bosques aleatorios
- Máquinas de vectores de soporte

### Aprendizaje no supervisado
El aprendizaje no supervisado es un tipo de aprendizaje automático en el que el modelo se entrena en un conjunto de datos no etiquetados. Esto significa que los datos no tienen etiquetas asociadas. El modelo aprende a encontrar patrones en los datos y a agrupar puntos de datos similares.

El aprendizaje no supervisado se utiliza para una variedad de tareas, incluida la agrupación, la reducción de la dimensionalidad y la detección de anomalías. Las tareas de agrupamiento implican agrupar puntos de datos en función de sus similitudes. Las tareas de reducción de dimensionalidad implican reducir la cantidad de características en un conjunto de datos mientras se conserva la mayor cantidad de información posible. Las tareas de detección de anomalías implican identificar puntos de datos que son significativamente diferentes del resto de los datos.

Hay muchos modelos diferentes de aprendizaje no supervisado, cada uno con sus propias fortalezas y debilidades. Algunos de los modelos de aprendizaje no supervisado más comunes incluyen:

- Agrupamiento de K-medias
- Agrupación jerárquica
- Análisis de componentes principales (PCA)
- Descomposición en valores singulares (SVD)
- Modelos de mezcla gaussiana (GMM)

### BIOPAC
Los dispositivos BIOPAC son una línea de productos de calidad avanzada para investigadores y educadores en ciencias de la vida. Proporcionan una forma flexible e integrada de registrar y analizar datos fisiológicos como ECG, EDA (GSR), EEG, EGG, EMG, EOG, y más de 300 otras señales y medidas fisiológicas.

## Metodología<a name="id3"></a>
Las señales bioeléctricas, que incluyen EEG y EMG, se utilizaron para implementar y evaluar algoritmos de aprendizaje automático para el análisis y reconocimiento de segmentos de interés.

En la UVG, se utilizaron los modelos MP36 y MP41 de BIOPAC para recopilar señales EEG y EMG. Se describen las actividades específicas realizadas por los sujetos de prueba para cada tipo de señal, como elevar la muñeca o realizar pruebas matemáticas.

Se establece un estándar de formato para el almacenamiento de los datos obtenidos con el equipo BIOPAC, incluyendo información sobre la señal, el tiempo de grabación, el número de muestras y otros parámetros. Los datos se nombran siguiendo una convención específica que incluye el nombre de la persona, el tipo de actividad y el tipo de señal bioeléctrica.

La agrupación de datos, diferenciando entre el análisis de señales EEG de forma intersujeto y señales EMG de forma intrasujeto debido a las diferencias en la naturaleza de estas señales.

Luego, se aborda el aprendizaje automático, donde se describen procesos como la extracción de características en el dominio tiempo, frecuencia y wavelets, anotaciones automáticas y análisis estadístico para validar la efectividad de los algoritmos.

Finalmente, se hizo una actualización de la herramienta de software utilizada en el estudio de la epilepsia, que incluye la eliminación de advertencias y errores, así como la mejora de la eficiencia computacional en ciertos algoritmos.

## Resultados<a name="id4"></a>

<img src="/Documentos/Tesis 2023 - Cristhofer Isaac Patzán/figuras/vat_edf_n_Uban15_freq.png" alt="Vat frecuencia" width="800">

<img src="/Documentos/Tesis 2023 - Cristhofer Isaac Patzán/figuras/vat_edf_n_Uban15_time.png" alt="VAT tiempo" width="800">

<img src="/Documentos/Tesis 2023 - Cristhofer Isaac Patzán/figuras/vat_edf_n_Uban15_wavelet.png" alt="VAT wavelets" width="800">

## Discusión<a name="id5"></a>

## Conclusiones<a name="id6"></a>
- La obtención de señales bioeléctricas permitió contar con un conjunto diverso y representativo para su posterior análisis. La recopilación de datos de pacientes con epilepsia atendidos en el Instituto HUMANA y de registros capturados con el equipo de la Universidad del Valle de Guatemala proporcionó una base sólida para la investigación y el desarrollo de la herramienta de software.

- La aplicación de algoritmos de aprendizaje automático previamente desarrollados para la extracción de características de las señales EEG y EMG fue exitosa. Estos algoritmos demostraron ser efectivos en la identificación de patrones relevantes en las señales bioeléctricas y en la generación de características que sirvieron como entrada para los procesos de detección de segmentos de interés. Aunque se percibe la necesidad de contar con una mayor cantidad de datos de distintas personas por parte de HUMANA.

- Los análisis estadísticos realizados arrojaron resultados positivos en términos del rendimiento de los algoritmos implementados. Se pudo evaluar de manera objetiva la eficacia de la metodología propuesta y se identificaron áreas de mejora potencial. Estos análisis proporcionaron una base sólida para la toma de decisiones y la optimización de los algoritmos utilizados.

- La actualización de la herramienta de software desarrollada en fases anteriores con las mejoras implementadas en los algoritmos de clasificación y detección de segmentos de interés representa un avance significativo en la automatización de procesos clínicos relacionados con la epilepsia. Esta actualización fortalece la capacidad de la herramienta para asistir a los especialistas médicos en el diagnóstico y seguimiento de pacientes con epilepsia, lo que contribuye a una atención más eficiente y precisa.


## Recomendaciones<a name="id7"></a>
- Se recomienda continuar la recopilación de datos de señales bioeléctricas, tanto de pacientes con epilepsia como de sujetos sanos, con el fin de enriquecer la base de datos y mejorar la capacidad de detección de patrones. La inclusión de un conjunto más amplio y diverso de datos permitirá una validación más robusta de los algoritmos desarrollados, añadiendo otro tipo de señales bioeléctricas como electrocardiogramas.

- Se sugiere realizar una validación clínica más amplia de la herramienta de software desarrollada en entornos médicos reales. La colaboración continua con instituciones médicas, como el Instituto HUMANA, puede proporcionar una plataforma para aplicar la metodología en la práctica médica y evaluar su utilidad en el diagnóstico y tratamiento de pacientes con epilepsia

- Dado el potencial de los algoritmos de aprendizaje automático para identificar patrones en señales bioeléctricas, se recomienda explorar la aplicación de esta metodología en el estudio de otros trastornos neurológicos. Investigar la detección de patrones relacionados con otras afecciones cerebrales puede ampliar significativamente el impacto y la relevancia de la investigación.

- Es esencial mantener la herramienta de software actualizada con los avances tecnológicos y las mejores prácticas en el campo de aprendizaje automático. Esto garantizará que la herramienta siga siendo eficaz y relevante a medida que evoluciona la investigación y la tecnología médica.

## Anexos<a name="id8"></a>


#
Este documento pretende proporcionar una visión completa y detallada de la tesis, permitiendo a los lectores comprender la investigación realizada y sus contribuciones al campo de estudio.

¡Gracias por explorar esta tesis y por tu interés en este importante proyecto de investigación!

[Cristhofer_Patzán]
[2023]
