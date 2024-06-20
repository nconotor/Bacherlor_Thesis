#!/bin/bash
for i in 0 1 2 3 4 ; do
    screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c PortScannerPassive -r $i > log/PortScannerPassive$i.txt" 
done

for i in 0 1 2 3 4 ; do
    screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c KeinAngriff -r $i > log/KeinAngriff$i.txt"
done

for i in 0 1 2 3 4 ; do
    screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c ARPAngriffServer -r $i > log/ARPAngriffServer$i.txt"
done

#for i in 0 1 2 3 4 ; do
    #screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c ARPAngriffServerLate -r $i > log/ARPAngriffServerLate$i.txt"&&
    #screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c ARPAngriffStudent -r $i > log/ARPAngriffStudent$i.txt" 
#done


screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffSmall -r 0 > log/DDOSAngriffSmall.txt"&&
screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffMedium -r  > log/DDOSAngriffMedium.txt"&&
screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffLarge  -r 0 > log/DDOSAngriffLarge.txt"&&
screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffSmallDisable -r 0 > log/DDOSAngriffSmallDisable.txt"&&
screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffMediumDisable -r 0 > log/DDOSAngriffMediumDisable.txt"&&
screen -dm bash -c "cd /opt/omnet/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c DDOSAngriffLargeDisable  -r 0 > log/DDOSAngriffLargeDisable.txt"



screen -dm bash -c "cd ~/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c KeinAngriffNoAttack  -r 0 > log/KeinAngriffNoAttack.txt"
screen -dm bash -c "cd ~/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c KeinAngriffEmptyAttack  -r 0 > log/KeinAngriffEmptyAttack.txt"
screen -dm bash -c "cd ~/seapp_stable/examples/seapp/tucsnet/; ../../../src/run_inet -u Cmdenv -f omnetpp.ini -c KeinAngriffLateAttack  -r 0 > log/KeinAngriffLateAttack.txt"
