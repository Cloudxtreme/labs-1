# -*- mode: ruby -*-
# vi: set ft=ruby :

# Mountpoints between host and guests
MOUNTS = { :saltmaster => { :mountpoint => "/srv/salt", :localdir => "salt", :nfs => false },
           :docker => { :mountpoint => "/vagrant", :localdir => "./", :nfs => false },
           :chrome => { :mountpoint => "/home/ubuntu/.google-profile", :localdir => "/home/wiktor/workspaces/STX/tools/chrome/.google-profile", :nfs => false },
           :webcam => { :mountpoint => "/dev/video0", :localdir => "/dev/video0", :nfs => false }
         }

# Supported providers
PROVIDERS = { :vbox => "virtualbox", :docker => "docker" }

# Supported boxes
BOXES = { :snappy1504 => {
            :path => "http://cloud-images.ubuntu.com/snappy/15.04/core/stable/current/core-stable-amd64-vagrant.box",
            :creds => { :username => "ubuntu", :password => "ubuntu" },
            :prov => PROVIDERS[:vbox]
          }, 
          :vivid => {
            :path => "https://cloud-images.ubuntu.com/vagrant/vivid/current/vivid-server-cloudimg-amd64-vagrant-disk1.box",
            :creds => { :username => "vagrant", :password => "vagrant" },
            :prov => PROVIDERS[:vbox]
          },
          :debian78 => {
            :path => "chef/debian-7.8",
            :creds => { :username => "vagrant", :password => "vagrant" },
            :prov => PROVIDERS[:vbox]
          },
          :d_ubu1204 => {
            :path => "ubuntu:12.04.5",
            :creds => { :username => "ubuntu", :password => "ubuntu" },
            :prov => PROVIDERS[:docker]
          },
          :d_ubu1504 => {
            :path => "ubuntu:15.04",
            :creds => { :username => "ubuntu", :password => "password" },
            :prov => PROVIDERS[:docker]
          },
          :d_ubu1504chrome => {
            :path => "ubuntu:chrome",
            :creds => { :username => "ubuntu", :password => "password" },
            :prov => PROVIDERS[:docker]
          },
          :atomic22 => {
            :path => "Fedora-Cloud-Atomic-Vagrant-22",
            :creds => { :username => "vagrant", :password => "vagrant" },
            :prov => PROVIDERS[:vbox]
          }
        }


# Servers
SERVERS = [
  { :ip => "192.168.123.2", :host => "salt-master", :mem => 512, :mounts => [:saltmaster], :saltmaster => true, :box => BOXES[:vivid], :pfwd => ["4505", "4506"]  },
  # TODO Snappy has fucked inet ordering ... { :ip => "192.168.123.3", :host => "snap01", :box => BOXES[:snappy1504] },
  # TODO Fedora bootstrap not supported yet  { :ip => "192.168.123.4", :host => "atom01", :box => BOXES[:atomic22] },
  { :ip => "192.168.123.5", :host => "vivi01", :box => BOXES[:vivid] },
  { :ip => "192.168.123.6", :host => "deb01", :box => BOXES[:debian78] },
  { :ip => "192.168.123.7", :host => "d_ubu01", :box => BOXES[:d_ubu1204], :mounts => [:docker] },
  { :ip => "192.168.123.8", :host => "d_ubu02", :box => BOXES[:d_ubu1504], :mounts => [:docker] },
  { :ip => "192.168.123.9", :host => "d_ubu03", :box => BOXES[:d_ubu1504chrome], :mounts => [:docker, :chrome], :privil => true, :cargs => [ "-v", "/dev/video0:/dev/video0"] }
]
