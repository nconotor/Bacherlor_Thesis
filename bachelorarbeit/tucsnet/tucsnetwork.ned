package inet.examples.seapp.tucsnet;

import inet.nodes.ethernet.Eth40G;
import inet.nodes.ethernet.Eth10G;
import inet.nodes.ethernet.Eth1G;
import inet.nodes.internetcloud.InternetCloud;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.ethernet.EtherSwitch;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.nodes.internetcloud.InternetCloud;
import inet.globalfilter.GlobalFilter;
import inet.util.ThruputMeteringChannel;
import inet.exmachina.ExMachina;
import ned.DatarateChannel;

//
// Modell des Netzwerks der Fakultät für Informatik an der TU-Dortmund
//
network TuCsNet
{
    parameters:
        @display("bgl=2;bgb=12000,2000");
        // Wird für den GlobalFilter benögit. Kann mit richtigen Angriffen überschrieben werden.
        string attackConfigurationFile = default("none");
        // Bestimmt die Anzahl der Rechner in jedem Lehrstuhl
        int hostCount = default(40);
        // Bestimmt die Anzahl an Servern
        int serverCount = default(10);
        // Bestimmt die Anzahl an studentischen Rechnern
        int studentCount = default(100);

    types: 
        // 
        // Gebäudeverkabelung
        // 
        channel IdealChannel extends DatarateChannel
        {
            parameters:
                delay = 0;
        }

        channel EthGebaeudeKabel  extends Eth10G
        {
            parameters:
                length = 500m;
        }

        channel EthRaumKabel extends Eth1G
        {
            parameters:
                length = 100m;
        }

        channel EthIrbServerKabel  extends Eth10G
        {
            parameters:
                length = 50m;
        }

        channel EthServerRaumKabel  extends Eth40G
        {
            parameters:
                length = 50m;
        }

    submodules:
        //
        // Jeweils Paare aus Switch und StandardHost für alle Server und Studentische Rechner
        //
        switchIrb : EtherSwitch{
            @display("p=300,200");
        }
        irbServer[serverCount] : StandardHost{
            @display("p=400,200,r,100");
        }

        switchStudent : EtherSwitch{
            @display("p=300,300");
        }
        studentHost[studentCount] : StandardHost{
            @display("p=400,300,r,100");
        }
        
        //
        // Jeweils Paare aus Switch und StandardHost[$hostCount] für alle Lehrstühle
        //
        switchLs1 : EtherSwitch{
            @display("p=300,400");
        }
        ls1Host[hostCount] : StandardHost{
            @display("p=400,400,r,100");
        }
        
        switchLs2 : EtherSwitch{
            @display("p=300,500");
        }
        ls2Host[hostCount] : StandardHost{
            @display("p=400,500,r,100");
        }
        
        switchLs4 : EtherSwitch{
            @display("p=300,600");
        }
        ls4Host[hostCount] : StandardHost{
            @display("p=400,600,r,100");
        }
        
        switchLs5 : EtherSwitch{
            @display("p=300,700");
        }
        ls5Host[hostCount] : StandardHost{
            @display("p=400,700,r,100");
        }
        
        switchLs6 : EtherSwitch{
            @display("p=300,800");
        }
        ls6Host[hostCount] : StandardHost{
            @display("p=400,800,r,100");
        }
        
        switchLs7 : EtherSwitch{
            @display("p=300,900");
        }
        ls7Host[hostCount] : StandardHost{
            @display("p=400,900,r,100");
        }
        
        switchLs8 : EtherSwitch{
            @display("p=300,1000");
        }
        ls8Host[hostCount] : StandardHost{
            @display("p=400,1000,r,100");
        }
        
        switchLs9 : EtherSwitch{
            @display("p=300,1100");
        }
        ls9Host[hostCount] : StandardHost{
            @display("p=400,1100,r,100");
        }
        
        switchLs11 : EtherSwitch{
            @display("p=300,1200");
        }
        ls11Host[hostCount] : StandardHost{
            @display("p=400,1200,r,100");
        }
        
        switchLs12 : EtherSwitch{
            @display("p=300,1300");
        }
        ls12Host[hostCount] : StandardHost{
            @display("p=400,1300,r,100");
        }
        
        switchLs13 : EtherSwitch{
            @display("p=300,1400");
        }
        ls13Host[hostCount] : StandardHost{
            @display("p=400,1400,r,100");
        }
        
        switchLs14 : EtherSwitch{
            @display("p=300,1500");
        }
        ls14Host[hostCount] : StandardHost{
            @display("p=400,1500,r,100");
        }
        
        //
        // Außerfakultäre Netzwerkgeräte
        //
        aliceServer[serverCount] : StandardHost{
            @display("p=400,1600,r,100");
        }

        internet : InternetCloud{
            @display("p=200,1000");
        }

        eve : StandardHost{
            @display("p=200,1800");
        }
        
        irbRouter : Router{
            @display("p=200,500");
        }

        itmcRouter : Router{
            @display("p=200,700");
        }

        exmachina: ExMachina{
            @display("p=50,50");
        }

        globalFilter: GlobalFilter{
            @display("p=11000,800");
        }

        configurator: IPv4NetworkConfigurator{
            @display("p=50,150");
        }

    connections allowunconnected:
        //
        // Innerfakultäre Verbindungen
        //
        for k = 0..sizeof(ls1Host)-1{
            ls1Host[k].ethg++ <--> EthRaumKabel <--> switchLs1.ethg++;
            ls1Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls2Host)-1{
            ls2Host[k].ethg++ <--> EthRaumKabel <--> switchLs2.ethg++;
            ls2Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls4Host)-1{
            ls4Host[k].ethg++ <--> EthRaumKabel <--> switchLs4.ethg++;
            ls4Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls5Host)-1{
            ls5Host[k].ethg++ <--> EthRaumKabel <--> switchLs5.ethg++;
            ls5Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls6Host)-1{
            ls6Host[k].ethg++ <--> EthRaumKabel <--> switchLs6.ethg++;
            ls6Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls7Host)-1{
            ls7Host[k].ethg++ <--> EthRaumKabel <--> switchLs7.ethg++;
            ls7Host[k].global_filter <-->  globalFilter.nodes++;
        }
        
        for k = 0..sizeof(ls8Host)-1{
            ls8Host[k].ethg++ <--> EthRaumKabel <--> switchLs8.ethg++;
            ls8Host[k].global_filter <-->  globalFilter.nodes++;
        }
        
        for k = 0..sizeof(ls9Host)-1{
            ls9Host[k].ethg++ <--> EthRaumKabel <--> switchLs9.ethg++;
            ls9Host[k].global_filter <-->  globalFilter.nodes++;
        }
        
        for k = 0..sizeof(ls11Host)-1{
            ls11Host[k].ethg++ <--> EthRaumKabel <--> switchLs11.ethg++;
            ls11Host[k].global_filter <-->  globalFilter.nodes++;
        }
        
        for k = 0..sizeof(ls12Host)-1{
            ls12Host[k].ethg++ <--> EthRaumKabel <--> switchLs12.ethg++;
            ls12Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls13Host)-1{
            ls13Host[k].ethg++ <--> EthRaumKabel <--> switchLs13.ethg++;
            ls13Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(ls14Host)-1{
            ls14Host[k].ethg++ <--> EthRaumKabel <--> switchLs14.ethg++;
            ls14Host[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(irbServer)-1{
            irbServer[k].ethg++ <--> EthIrbServerKabel <--> switchIrb.ethg++;
            irbServer[k].global_filter <-->  globalFilter.nodes++;
        }

        for k = 0..sizeof(studentHost)-1{
            studentHost[k].ethg++ <--> EthRaumKabel <--> switchStudent.ethg++;
            studentHost[k].global_filter <-->  globalFilter.nodes++;
        }

        switchIrb.ethg++ <--> EthServerRaumKabel <--> irbRouter.ethg++;
        switchStudent.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs1.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs2.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs4.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs5.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs6.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs7.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs8.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs9.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs11.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs12.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs13.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        switchLs14.ethg++ <--> EthGebaeudeKabel <--> irbRouter.ethg++;

        //
        // Außerfakultäre Verbindungen
        //
        for k = 0..sizeof(aliceServer)-1{
            aliceServer[k].pppg++ <--> IdealChannel <--> internet.pppg++;
            aliceServer[k].global_filter <-->  globalFilter.nodes++;
        } 
        
        eve.pppg++ <--> IdealChannel <--> internet.pppg++;

        irbRouter.ethg++ <--> Eth40G <--> itmcRouter.ethg++;
        itmcRouter.pppg++ <--> Eth10G <--> internet.pppg++;

        irbRouter.global_filter <-->  globalFilter.nodes++;
        itmcRouter.global_filter <-->  globalFilter.nodes++;
        eve.global_filter <--> globalFilter.nodes++;
}
