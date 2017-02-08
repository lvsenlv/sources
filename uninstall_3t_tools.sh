#!/bin/bash

rm sbin/iptables-save                       
rm sbin/iptables-restore                    
rm sbin/iptables-apply                      
rm sbin/iptables                            
rm sbin/xtables-multi                       

rm lib/libip4tc.so.0                        
rm lib/libip4tc.so.0.1.0                    
rm lib/libip6tc.so.0                        
rm lib/libip6tc.so.0.1.0                    
rm lib/libxtables.so.10                     
rm lib/libxtables.so.10.0.0                 
rm -r lib/xtables                           

rm usr/sbin/tcpdump                         

rm  etc/alternatives/traceroute.sbin      
rm  etc/alternatives/traceroute.1.gz      
rm  etc/alternatives/tcptraceroute.8.gz   
rm  etc/alternatives/tcptraceroute        
rm  etc/alternatives/traceroute6          
rm  etc/alternatives/traceroute6.1.gz     
rm  etc/alternatives/traceroute           

rm usr/bin/traceroute.db                    
rm usr/bin/traceroute-nanog                 
rm  usr/bin/traceroute6.db                
rm  usr/bin/traceroute6                   
rm  usr/bin/traceroute                    

rm usr/sbin/tcptraceroute.db                
rm  usr/sbin/tcptraceroute                
rm  usr/sbin/traceroute                   

rm usr/bin/dig                              

rm usr/bin/htop                             

rm usr/sbin/iptraf                          

rm usr/bin/pidstat                          
rm usr/bin/mpstat                           
rm usr/bin/sadf                             

rm etc/init.d/sysstat
#rm etc/rc2.d/S20sysstat
#rm etc/rc3.d/S20sysstat
#rm etc/rc4.d/S20sysstat
#rm etc/rc5.d/S20sysstat
rm etc/cron.d/sysstat                       
rm -r etc/sysstat                           
rm etc/cron.daily/sysstat                   
rm etc/default/sysstat                      
rm -r usr/lib/sysstat                       

rm  etc/alternatives/sar                  
rm  usr/bin/sar                           
rm usr/bin/sar.sysstat                      
