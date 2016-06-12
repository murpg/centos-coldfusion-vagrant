# CDE - Custom Development Environment

Local development environment for CFML projects. Vagrant box for local
development with ColdFusion and several utilities.


## Requirements

It is assumed you have:

- Vagrant (version 1.7.2) with **vagrant-hostsupdater** plugin
- VMware Workstation (version 11.1.2) or
- VirtualBox with Guest Additions

> You can install vagrant-hostsupdater plugins with the following command
> `$ vagrant plugin install vagrant-hostsupdater`


## Files

This repository is divided in three parts:

- `packer/`: run all **packer** commands from this directory
  - `coldfusion11`: the packer configuration for Adobe ColdFusion 11
- `vagrant/`: run all **vagrant** commands from this directory
  - `configs/`: configuration files for Nginx
  - `provisioners/`: the provisioning bash scripts for the box
  - `Vagrantfile`: the vagrant configuration file
- `www/`: code for the default sie that shows you the status of your configuration


## Installation

The first time you clone the repository and bring the box up, it make take
several minutes.

```bash
$ git clone git@github.com:murpg/centos-coldfusion-vagrant.git
$ cd centos-coldfusion-vagrant/vagrant && vagrant up
```

Once the Vagrant box finishes and is ready, you should see something like
this in your terminal:

```
==> default:
==> default: ========================================================================
==> default:
==> default: http://coldfusion.dev (192.168.140.100)
==> default:
==> default:
==> default: ColdFusion 11 Administrator UI
==> default: http://coldfusion.dev/CFIDE/administrator/index.cfm
==> default:
==> default:
==> default: ========================================================================
```

Once you see that, you should be able to browse to http://coldfusion.dev or
http://coldfusion.dev/CFIDE/administrator/index.cfm (it may take some minutes
the first time a page loads, subsequent requests should be much faster).


## Configuring Sites

This repo only ocntains the code and configuration for the default site that
displays information about your install. To add a new app to develop on, check
out the repo for that app into the same directory that this `centos-coldfusion-vagrant`
is located so sits along side it. Each app's repository will need to have a folder
in the root called `VagrantConfig` that contains configuration YAML file of any name.

### Sample YAML Configuration File

Here is an example YAML configuration file. It contains the configuration for
a single app. All properties are optional. `wwwroot` will default to the root
of the repository if not specified.

```yaml
# name of the app
name: my new awesome app

# Path to web root relative to the repo root
webroot: www/app

# List of domains to be added to the Host machine's and VM's "hosts" file hosts:
- awesome-app.local

```

> **Note**: Keys in a YAML file are case-sensitive.
