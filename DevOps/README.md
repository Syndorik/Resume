# DevOps
The purpose of this project was to create thanks to a heat template VMs on Openstack and to deploy an application on those VMs. Here we had 3 VM (Master-salve running the application) and 3 VM runing the database (mongoDB).

Project done in IMT Atlantique (former Telecom Bretagne)
## Folders
**ansible-docker** :  Contains scripts that install ansible and docker on the VMs

**create_machines** :  Contains the Heat template that creates all the VMs on OpenStack

**elu504** : Contains some tests on Openstack

**src**: Contains the application that was deployed