# practica_contenedores 

## Funcionamiento de Flask Counter con Mysql

Se ha modificado la aplicación flask counter vista en clase para que se pueda almacenar el contador en una base de datos MySQL y se pueda leer la misma.
La aplicación consiste en un único fichero Python en el que se han definido varios end points para realizar las operaciones. Así se tiene:

/ --> La aplicación aquí se comporta como la original, es decir que suma 1 cada vez que se le llama.
/create_db --> Crea una base de datos dentro de MySQL llamada TESTDB
/create_table --> Crea una tabla COUNTER en la que se almacenarán el número de pulsaciones que se lleve hasta el momento.
/insert --> Se insertará en la tabla COUNTER el número de pulsaciones registradas hasta el momento en la variable counts.
/read --> Se mostrará por pantalla el número de pulsaciones registradas hasta el momento pero consultando directamente a la tabla COUNTER.

## Requisitos para hacer funcionar la aplicación

Hay varias formas de hacer funcionar la aplicación:

1. Usando Dockers: Hay que bajarse el fichero Dockerfile, requirements.txt y el directorio mysql-counter que contiene los scripts sql que se ejecutarán cuando se arranque la imagen y un Dockerfile para la construcción de la imagen de MySQL.

Una vez descaragados hay que construir las imagenes. Para ello lo que hay que hacer es ejecutar el comando docker build -t <nombre_de_la imagen_app_flask> . para la app de Flask y para construir la imagen de MYSQL.

Una vez construidas las imágenes hay que ejecutar el fichero start.sh para arrancarlas.

Una vez arrancada la aplicación hay que irse al http://localhost:5000 e ir a los diferentes end points listados anteriormente para realizar las distintas acciones. En este caso tanto la BD como la tabla COUNTER ya están creadas a la hora de ejecutar als imágenes.

2. Usando kubernetes: dentro del direcotiro k8s se encuentran todos los ficheros yaml para la ejecución de la aplicación en un cluster de kubernetes. Usando el comando kubectl apply -f . se aplicarían los ficheros y se levantarían los nodos. 

Aquí hay que tener en cuenta que: 

- Hay que crear dos secretos: kubectl create secret generic mysql-password --from-literal=password=password 
kubectl create secret generic redis --from-literal=password=password

Si no se tienen creados la aplicación no lenvantará.

- Dentro del ingress.yaml hay que configurar el host con el que se va a acceder.

- Dentro del flask-deployment hay que indicar la imagen de flask-counter que se tomará com referencia.

También hay que tener en cuenta que aquí solamente se creará la base de datos cuando levante MySQL pero se tendrá que acceder a end point para crear la tabla.

3. Usando Helm: dentro del directorio helm se encuentran los ficheros yaml para instalar la aplicaicón con helm. A tener en cuenta: dentro del fichero values.yaml es posible configurar la prueba de vida, los recursos de la imagen de flask, el nombre de la imagen, los puertos de MySQL y de Flask, el número de réplicas y la ip externa con la que se accede.





