# pgitic_cdh5
Proyecto para la asignatura del Máster en Ingeniería Informática llamada Planificación y Gestión de Infraestructuras TIC, en la cual se automatiza la instalación de CDH5 perteneciente a Hadoop, mediante el uso de Vagrant y Ansible.<br />
Dicho proyecto se ha desarrollado una versión para Ubuntu y otra para Centos, ambas funcionan correctamente.
## Instalación
Instalación aplicada a máquina **Ubuntu 19**<br />
Pasos previos a la ejecución del "Vagrant up"
``` 
$ sudo apt update
```

### Instalación Ansible:
[Guía oficial de instalación Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#)
```
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install -y ansible
$ ansible --version
```
### Instalación Vagrant:
[Guía oficial de instalación Vagrant](https://www.vagrantup.com/docs/installation)
```
$ wget https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb
$ sudo dpkg -i vagrant_2.2.7_x86_64.deb
$ vagrant --version
```
### Instalacion VirtualBox
Para que Vagrant despliegue las máquinas virtuales es necesario un hipervisor que cree dichas máquinas, para lo cual en este caso hemos elegido VBox, pudiéndose realizar también con otros como VMWare.<br />
[Documentación VBox](https://www.virtualbox.org/wiki/Documentation)<br />
Guía para Ubuntu 19.10:
```
$ wget https://download.virtualbox.org/virtualbox/6.1.4/virtualbox-6.1_6.1.4-136177~Ubuntu~eoan_amd64.deb
$ sudo dpkg -i virtualbox-6.1_6.1.4-136177~Ubuntu~eoan_amd64.deb
$ virtualbox
```

## Ejecución:
Nos dirigimos al directorio /src que es donde encontramos tanto el playbook de Ansible como de Vagrant y ejecutamos:
```
$ vagrant up
```
Para conectarnos a la máquina debemos ejecutar el comando:
```
$ vagrant ssh
```

## Carpeta compartida
Se ha creado una carpeta compartida entre el host y el guest (Hadoop) llamada "hadoop" (host) y encontrandose en /tmp/ (guest).


## Probar Hadoop
```
$ cd /tmp
$ sudo -u hdfs hadoop fs -mkdir -p /user/vagrant/trabajo
$ sudo -u hdfs hadoop fs -put donquijote.txt /user/vagrant/trabajo
$ cd /tmp/WordCountSimple
$ make
$ sudo hadoop jar WordCountSimple.jar /user/vagrant/trabajo /user/vagrant/trabajo/salida

```

## Acceso al sistema de archivos
Para acceder al sistema de archivos "distribuido" mediante el navegador debemos teclear la siguiente dirección ip:<br />
Centos
```
192.168.100.100:50070
```
Ubuntu
```
192.168.100.100:50070
```
No es compatible lanzarlos a la vez, a no ser, que se cambie la ip de una de las máquinas tanto en el archivo inventory.ini y en su respectivo Vagrantfile.
### Parar la máquina:
Si deseamos parar la máquina virtual debemos ejecutar el comando:
```
$ vagrant halt
```
Si finalmente queremos eliminarla, se hará con el siguiente comando:
```
$ vagrant destroy -f
```

## Comprobar el estado de los servicios:
```
$ sudo service hadoop-hdfs-datanode status
$ sudo service hadoop-hdfs-namenode status
$ sudo service hadoop-hdfs-secondarynamenode status
$ sudo service hadoop-0.20-mapreduce-jobtracker status
$ sudo service hadoop-0.20-mapreduce-tasktracker status
```
Aquellos servicios que estén muertos se deben levantar empleando:
```
$ sudo service <ServicioCaido> start
```

## Posibles fallos
### Error sobre máquina virtual.
Si dicho programa se ejecuta sobre un host Windows, debemos asegurarnos que tenemos habilitado desde la BIOS: Hyper-V. También debemos irnos a "Activar o desactivar características de windows" y habilitar Hyper-V.
### Conexión ssh
Es posible que nos de fallo si el repositorio lo colnamos en un directorio que tenga alguna ruta previa con espacios, por lo que instamos a que se controle que la ruta a dicho directorio no contenga carácteres especiales ni espacios. Para evitar esto podemos clonarlo directamente en C:
### Problema con las carpetas compartidas
"Vagrant was unable to mount VirtualBox shared folders".
Solución:
```
$ vagrant plugin install vagrant-vbguest
$ vagrant vbguest
$ vagrant reload default
```

## Licencia:
Proyecto bajo licencia [LICENSE.md](LICENSE.md)

---
_Proyecto realizado por:_
* **Félix Ángel Martínez Muela** - [Félix Ángel Martínez](https://github.com/FelixAngelMartinez)
* **Miguel de la Cal Bravo** - [Miguel de la Cal Bravo](https://gitlab.com/miguelcal97)
