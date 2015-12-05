#!/bin/bash
POS=-p0
echo 'clear and set RxPdo'
ethercat $POS --type uint8 download 0x1C12 0 0
ethercat $POS --type uint8 download 0x1600 0 0
ethercat $POS --type uint8 download 0x1601 0 0
ethercat $POS --type uint8 download 0x1602 0 0
ethercat $POS --type uint8 download 0x1603 0 0
ethercat $POS --type uint32 download 0x1600 1 0x60400010
ethercat $POS --type uint32 download 0x1600 2 0x60ff0020
ethercat $POS --type uint8 download 0x1600 0 2
ethercat $POS --type uint16 download 0x1C12 1 0x1600
ethercat $POS --type uint8  download 0x1C12 0 1
#cml@debian-cml2:~$ ethercat rescan
#cml@debian-cml2:~$ ethercat pdos

echo 'clear and set TxPdo'
ethercat $POS --type uint8  download 0x1C13 0 0
ethercat $POS --type uint8 download 0x1A00 0 0
ethercat $POS --type uint8 download 0x1A01 0 0
ethercat $POS --type uint8 download 0x1A02 0 0
ethercat $POS --type uint8 download 0x1A03 0 0
ethercat $POS --type uint32 download 0x1A00 1 0x60410010
ethercat $POS --type uint32 download 0x1A00 2 0x606c0020 # act velocity
ethercat $POS --type uint8 download 0x1A00 0 2 # number of var in this PDO
ethercat $POS --type uint16  download 0x1C13 1 0x1A00 # list TxPdo
ethercat $POS --type uint8  download 0x1C13 0 1 # number of TxPdo
ethercat rescan
sleep 3
ethercat pdos
#dmesg | tail -50