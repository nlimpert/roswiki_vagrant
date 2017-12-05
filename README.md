Note: this readme is a modified version of the original one to test ci badge enhancements locally
(in reference to https://github.com/ros-infrastructure/roswiki/issues/232)

The original setup of roswiki_vagrant makes use of Ubuntu Trusty. This is a patched version running Xenial.

roswiki_vagrant
===============
A set of Vagrant and Puppet scripts to deploy and test roswiki in a VM.

Requirements
============

The only requirements of roswiki_vagrant are just Vagrant and Virtualbox.

Virtualbox
----------
The most recent version of Virtualbox can be installed from
https://www.virtualbox.org/wiki/Downloads, make sure to install VirtualBox Extension Pack too.


Vagrant
-------
The Vagrant team provides Debian packages available from their
website: http://www.vagrantup.com/downloads.html


Usage with sample data
===
Clone the following repositories to setup a sample ROSWiki instance:

```
$ git clone https://github.com/nlimpert/roswiki.git -b nlimpert/ci_enhancements
$ git clone https://github.com/nlimpert/roswiki_vagrant.git -b nlimpert/current
$ git clone https://github.com/nlimpert/roswiki_dev_sample_data.git -b nlimpert/sample_yaml
```

Afterwards startup the virtual machine:
```
$ cd roswiki_vagrant
$ vagrant up
```

After a few minutes, the VM should be running and fully provisioned with an empty wiki.
To access the wiki, point your web browser to http://localhost:8080, If desired, the port
can be changed in Vagrantfile:

```
config.vm.network "forwarded_port", guest: 8080, host: 8080
```
where guest is the port where Apache listens inside the VM and host the port that is
accessible from the web browser.

According to the Vagrantfile there are three directories passed to the VM:
- roswiki: containing the macros and the ROSWiki additions to the MoinMoin wiki
- roswiki_dev_sample_data/docs/: a path to represent the manifest.yaml for each package:
```
docs/<distro>/api/<packagename>/manifest.yaml
```
- roswiki_dev_sample_data/devel_jobs/: a path to represent the devel_jobs.yaml for each package:
```
devel_jobs/<distro>/api/<packagename>/devel_jobs.yaml
```


The wiki should contain a sample page called "actionlib", which is accessible via http://localhost:8080/actionlib.
It also contains a "TestUser" with the password "TestUser" (without quotation marks). This user is allowed to create and modify pages.

Please note that new pages have to contain the following macro calling line in order to load the Package Header:
```
<<PackageHeader(<packagename>)>>
```
