build-buildroot
===========

This subproject of [easy-build](https://github.com/tiiuae/easy-build) provides a quick and easy way
for creating embedded Linux distributions using the [Buildroot](https://buildroot.uclibc.org/) tools.

Building the Docker image
-------------------------

    $ cd .../easy-build
    $ docker build -t tiiuae/build-buildroot build-buildroot/

Running the Docker image
------------------------

Type the following command to instantiate a clean development environment for the Yocto Project:

    $ docker run -ti tiiuae/build-buildroot

Optionally, you may use the `--volume=[host-src:]container-dest` option to share a directory between the host and the container, as in the following example

    $ docker run -ti --volume=${PWD}/shared:/home/build/shared tiiuae/build-buildroot

Please refer to https://docs.docker.com/engine/reference/run/#volume-shared-filesystems for details

Congratulations! You can now execute the Yocto Project tools to create your own embedded Linux distribution.

Using Buildroot
-----------

This section shows a few commands to make sure that the Buildroot build environment is properly installed.
Please refer to the [Buildroot documentation](https://buildroot.uclibc.org/docs.html) for details.

### Clone the Buildroot repository

Clone the Buildroot repository (in our example, revision "2021.08" )

    $ mkdir -p ~/shared && sudo chown build.build ~/shared
    $ cd ~/shared
    $ git clone --depth 1 --branch 2021.08 git://git.busybox.net/buildroot

### Create the build environment

    $ cd ~/shared/buildroot
    $ make <target-config>

<!-- EOF -->
