#! /bin/bash

function setPermanenet() {
  echo "vm.max_map_count=262144" >>/etc/sysctl.conf
  echo "net.ipv4.ip_local_port_range=\"15000 61000\"" >>/etc/sysctl.conf
  echo "net.ipv4.tcp_fin_timeout=30" >>/etc/sysctl.conf
  echo "net.core.somaxconn=1024" >>/etc/sysctl.conf
  echo "net.core.netdev_max_backlog=2000" >>/etc/sysctl.conf
  echo "net.ipv4.tcp_max_syn_backlog=2048" >>/etc/sysctl.conf
  echo "vm.overcommit_memory=1" >>/etc/sysctl.conf
}

function setTemporary() {
  sysctl -w vm.max_map_count=262144
  sysctl -w net.ipv4.ip_local_port_range="15000 61000"
  sysctl -w net.ipv4.tcp_fin_timeout=30
  sysctl -w net.core.somaxconn=1024
  sysctl -w net.core.netdev_max_backlog=2000
  sysctl -w net.ipv4.tcp_max_syn_backlog=2048
  sysctl -w vm.overcommit_memory=1
}

echo "set host params for ambar? (No/Temporary/Permanent)"
read -r input

case $input in
T | t)
  setTemporary
  ;;
P | p)
  setPermanenet
  ;;
*)
  exit
  ;;
esac
