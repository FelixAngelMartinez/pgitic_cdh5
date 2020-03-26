# pgitic_cdh5
Proyecto para la asignatura del Máster en Ingeniería Informática llamada Planificación y Gestión de Infraestructuras TIC, en la cual se automatiza la instalación de CDH5 perteneciente a Hadoop, mediante el uso de Vagrant y Ansible.

## Instalación
Instalación aplicada a máquina **Ubuntu 19**
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

## Ejecución:
Nos dirigimos al directorio /src que es donde encontramos tanto el playbook de Ansible como de Vagrant y ejecutamos:
```
$ vagrant up
```


## Sobre máquina virtual
Si dicho programa se ejecuta sobre un host Windows, debemos asegurarnos que tenemos habilitado desde la BIOS: Hyper-V. También debemos irnos a "Activar o desactivar características de windows" y habilitar Plataforma de máquina virtual y Plataforma del hipervisor de Windows. Posteriormente reiniciar y probar a ejecutar vagrant.

## Licencia:
Proyecto bajo licencia [LICENSE.md](LICENSE.md)

---
_Proyecto realizado por:_
* **Félix Ángel Martínez Muela** - [Félix Ángel Martínez](https://github.com/FelixAngelMartinez)
* **Miguel de la Cal Bravo** - [Miguel de la Cal Bravo](https://gitlab.com/miguelcal97)
