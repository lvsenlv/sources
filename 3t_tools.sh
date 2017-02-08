#!/bin/bash
LIB_PATH="tmp_tools/lib"
SBIN_PATH="tmp_tools/sbin"
USER_SBIN_PATH="tmp_tools/usr/sbin"
USER_BIN_PATH="tmp_tools/usr/bin"
ETC_ALT_PATH="tmp_tools/etc/alternatives"

mkdir -p $LIB_PATH
mkdir -p $SBIN_PATH
mkdir -p $USER_SBIN_PATH
mkdir -p $USER_BIN_PATH
mkdir -p $ETC_ALT_PATH

#cp iptables
cp sbin/iptables-save                       $SBIN_PATH
cp sbin/iptables-restore                    $SBIN_PATH
cp sbin/iptables-apply                      $SBIN_PATH
cp sbin/iptables                            $SBIN_PATH
cp sbin/xtables-multi                       $SBIN_PATH

cp lib/libip4tc.so.0                        $LIB_PATH
cp lib/libip4tc.so.0.1.0                    $LIB_PATH
cp lib/libip6tc.so.0                        $LIB_PATH
cp lib/libip6tc.so.0.1.0                    $LIB_PATH
cp lib/libxtables.so.10                     $LIB_PATH
cp lib/libxtables.so.10.0.0                 $LIB_PATH
cp -r lib/xtables                           $LIB_PATH

#cp tcpdump
cp usr/sbin/tcpdump                         $USER_SBIN_PATH

#cp traceroute
cp -d etc/alternatives/traceroute.sbin      $ETC_ALT_PATH
cp -d etc/alternatives/traceroute.1.gz      $ETC_ALT_PATH
cp -d etc/alternatives/tcptraceroute.8.gz   $ETC_ALT_PATH
cp -d etc/alternatives/tcptraceroute        $ETC_ALT_PATH
cp -d etc/alternatives/traceroute6          $ETC_ALT_PATH
cp -d etc/alternatives/traceroute6.1.gz     $ETC_ALT_PATH
cp -d etc/alternatives/traceroute           $ETC_ALT_PATH

cp usr/bin/traceroute.db                    $USER_BIN_PATH
cp usr/bin/traceroute-nanog                 $USER_BIN_PATH
cp -d usr/bin/traceroute6.db                $USER_BIN_PATH
cp -d usr/bin/traceroute6                   $USER_BIN_PATH
cp -d usr/bin/traceroute                    $USER_BIN_PATH

cp usr/sbin/tcptraceroute.db                $USER_SBIN_PATH
cp -d usr/sbin/tcptraceroute                $USER_SBIN_PATH
cp -d usr/sbin/traceroute                   $USER_SBIN_PATH

#cp dnsutils
cp usr/bin/dig                              $USER_BIN_PATH

#cp htop
cp usr/bin/htop                             $USER_BIN_PATH

#cp iptraf
cp usr/sbin/iptraf                          $USER_SBIN_PATH

#cp sysstat-pidstat
cp usr/bin/pidstat                          $USER_BIN_PATH

#cp sysstat-mpstat
cp usr/bin/mpstat                           $USER_BIN_PATH

#cp sysstat-sadf
cp usr/bin/sadf                             $USER_BIN_PATH

#cp sysstat-sar
mkdir -p tmp_tools/etc/init.d
mkdir -p tmp_tools/etc/cron.d
#mkdir -p tmp_tools/etc/rc4.d
#mkdir -p tmp_tools/etc/rc2.d
#mkdir -p tmp_tools/etc/rc5.d
#mkdir -p tmp_tools/etc/rc3.d
mkdir -p tmp_tools/etc/cron.daily
mkdir -p tmp_tools/etc/default
mkdir -p tmp_tools/usr/lib

cp etc/init.d/sysstat                       tmp_tools/etc/init.d
cp etc/cron.d/sysstat                       tmp_tools/etc/cron.d
#cp -d etc/rc4.d/S20sysstat                  tmp_tools/etc/rc4.d
cp -r etc/sysstat                           tmp_tools/etc/
cp etc/cron.daily/sysstat                   tmp_tools/etc/cron.daily
#cp -d etc/rc2.d/S20sysstat                  tmp_tools/etc/rc2.d
#cp -d etc/rc5.d/S20sysstat                  tmp_tools/etc/rc5.d
#cp -d etc/rc3.d/S20sysstat                  tmp_tools/etc/rc3.d
cp etc/default/sysstat                      tmp_tools/etc/default
cp -r usr/lib/sysstat                       tmp_tools/usr/lib

cp -d etc/alternatives/sar                  $ETC_ALT_PATH
cp -d usr/bin/sar                           $USER_BIN_PATH
cp usr/bin/sar.sysstat                      $USER_BIN_PATH

