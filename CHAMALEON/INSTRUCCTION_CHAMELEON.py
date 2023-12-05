"""
/*
		CRISTHOFER PATZAN
		UNIVERSIDAD DEL VALLE DE GUATEMALA
		2023

	El siguiente manual son los pasos a seguir para ejecutar el algoritmo
	CHAMELEON, te recomiendo hacer todo desde un virtual enviroment de 
	python3.
 
	Se utilizo CentOS, para la compilación, debbugin y uso de la presente
	libreria.
*/
"""



#------------------------------------------------------------------------------
# 				Instalar CMAKE
#------------------------------------------------------------------------------
"""/* Debes intsalar cmake desde fuente
	- Descargar version estable
	- Desde la carpeta donde este el ".tar" abres una terminal
	- tar xvzf cmake-3.27.9.tar.gz 
	- cd cmake-3.27.9/
	- ./configure
		- Si al finalizar este instruccion te aparece un warning de 
		  open ssl, entonces instala las dependencias (libssl-dev)
		  Para el caso de centos es:
		- yum install -y openssl-devel 
		- ejecuta nuevamente:
		-./configure
	- make
	- sudo make install
	- Para comprobar que se instalo bien ejecuta : cmake --version
*/"""

#------------------------------------------------------------------------------
# 				Instalar Metis
#------------------------------------------------------------------------------
"""/*
	- Ve a: http://glaros.dtc.umn.edu/gkhome/metis/metis/download
	- Descarga: Latest stable release (5.1.0):
			metis-5.1.0.tar.gz
	- Descomprime metis (x y, son los numeros de la version):
		- gunzip metis-5.x.y.tar.gz
		- tar -xvf metis-5.x.y.tar
	- cd metis-5.1.0/
	- make
	- Te abrira una ventana con las instrucciones para compilar metis
	  ejecutalas
		-make config shared=1 prefix=~/.local/
		-make
		-make install
		-export METIS_DLL=~/.local/lib/libmetis.so
	- pip3 install metis-python
	- Ejecuta la siguiente linea siempre que abras una terminal para usar
	  metis: export METIS_DLL=~/.local/lib/libmetis.so
 

*/"""

#------------------------------------------------------------------------------
#  				Instalar Repo Chameleon
#------------------------------------------------------------------------------
"""/*
	-Descargar y descomprimir el repo:
	 https://github.com/Moonpuck/chameleon_cluster 
	- pip install -r requirements.txt 
	***********************************************************************
		Deberas actualizar ciertos parametro de la libreria
		por desactualizacion.
		
		Lo que se indica a continuacion no es la mejor forma de 
		debbuggin por lo que a futuro se debe realizar bien
	***********************************************************************
		* Ir al archivo /chameleon_cluster/graphtools.py
		* cambiar el .node a .nodes
			*linea 29 --> g.nodes
			*linea 50 --> g.nodes
			*linea 61 --> g.nodes
			*linea 68 --> g.nodes
			*linea 81 --> g.nodes
			*linea 39 --> g.nodes
		* /chameleon_cluster/chameleon.py
			*linea 75 -->  g.nodes
			*linea 76 -->  g.nodes
		*-------------INSTALAR TKINTER CON GUI----------------------
		*sudo yum install -y python3-tkinter
		
	- python -i main.py
	
*/"""

# EXCELENTE INSTALADO, VERSION FUNCIONAL AL 29 DE NOVIEMBRE 2023

