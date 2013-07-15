#!/bin/bash

echo ':::: Adding missing assembler support in configure.in ::::'
  sed -i '6i\ \ndnl Using GAS assembler program\nAM_PROG_AS' configure.in
echo ':::: Removing deprecated pentium pro option in configure.in ::::'
  sed -i 's/-mpentiumpro//g' configure.in
echo ':::: Removing deprecated assembler routines from the Makefile.am list (d_copy.S) ::::'
  sed -i '/d_copy.S/d' Makefile.am
echo ':::: Creating some misc files ::::'
  touch INSTALL NEWS README AUTHORS ChangeLog
echo ':::: Cleaning up some old files ::::'
  rm Makefile.in Makefile.linuxi386 Makefile.Solaris
  rm configure
echo ':::: Reconfiguring the compiling environment ::::'
  aclocal
  autoconf
  automake --add-missing
echo ':::: Finally, BUILD ::::'
  ./configure
  make
echo ':::: DONE ::::'
