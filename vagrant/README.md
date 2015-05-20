# Vagrant

Structure
-----

    ├── bootstrap # bootstrapping scripts
    │   ├── salt  # bootstrap for salt
    │   └── ...
    ├── config    # Vagrant config files, servers definition 
    └── docker    # Dockerfiles for each image
         

Setting boxes
-----

  1. Define machine in config/servers.rb
    * if virtual machine add it it to the list of `SERVERS`
    * if a docker container, additionally prepare a Dockerfile in `docker/<name>/Dockerfile`

  2. Create and run machine
    * if vm: `vagrant up <machine>`
    * if container: `vagrant up --provider=docker <machine>`
  
