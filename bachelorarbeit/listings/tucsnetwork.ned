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


module OrganisationsEinheit
{
    parameters:
        string attackConfigurationFile = default("none");
        int hostCount = default(4);
        int serverCount = default(0);
        @display("bgl=2;bgb=1000,500");
   
    gates:
        inout global_filter[hostCount+serverCount];
        inout ethg;

    types:
        channel EthRaumKabel extends Eth1G
        {
            parameters:
                length = 100m;
        }

        channel EthServerKabel  extends Eth10G
        {
            parameters:
                length = 50m;
        }

    submodules:
        switch : EtherSwitch{
            @display("p=200,100");
        }

        host[hostCount] : StandardHost{
            @display("p=400,200,r,100 ");
        }

        server[serverCount] : StandardHost{
            @display("p=300,100,r,100");
        }

    connections allowunconnected:
        for k = 0..sizeof(host)-1{
            host[k].ethg++ <--> EthRaumKabel <--> switch.ethg++;
            host[k].global_filter <-->  global_filter++;
        }
        for k = 0..sizeof(server)-1{
            server[k].ethg++ <--> EthServerKabel <--> switch.ethg++;
            server[k].global_filter <-->  global_filter++;
        }
        switch.ethg++ <--> ethg;
}


network TuCsNet
{
    parameters:
        //@display("bgl=2;bgb=194,264");
        string attackConfigurationFile = default("none");
 
    types: 
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

    submodules:
        exmachina: ExMachina{
            @display("p=15,50");
        }
        globalFilter: GlobalFilter{
            @display("p=600,250");
        }
        configurator: IPv4NetworkConfigurator{
            @display("p=50,50");
        }
        internet : InternetCloud{
            @display("p=100,550");
        }
        eve : StandardHost{
            @display("p=100,650");
        }

        alice : StandardHost{
            @display("p=200,650");
        }
        
        // ls1,ls2,ls4,ls5,ls6,ls7,ls8,ls9,ls11,ls12,ls13,ls14 + StudentenPcs und IRB Server

        //
        // OH12
        //
        itmcRouter : Router{
            @display("p=100,450");
        }

        irbRouter : Router{
            @display("p=100,250");
        }
        
        irb : OrganisationsEinheit{
            @display("p=300,100");
            hostCount = 0;
            serverCount = 10;
        }

        ls1 : OrganisationsEinheit{
            @display("p=300,200");
        }
        ls8 : OrganisationsEinheit{
            @display("p=300,300");
        }
        ls13 : OrganisationsEinheit{
            @display("p=300,400");
        }
        ls14 : OrganisationsEinheit{
            @display("p=300,500");
        }   

        //
        // OH14
        //
        ls2 : OrganisationsEinheit{
            @display("p=400,200");
        }
        ls5 : OrganisationsEinheit{
            @display("p=400,300");
        }
        ls6 : OrganisationsEinheit{
            @display("p=400,400");
        }
        ls9 : OrganisationsEinheit{
            @display("p=400,500");
        }     
        ls11 : OrganisationsEinheit{
            @display("p=400,600");
        }    
        studentischeArbeitsplaetze : OrganisationsEinheit{
            @display("p=400,100");
        }

        //
        // OH16
        // 
        ls4 : OrganisationsEinheit{
            @display("p=500,200");
        }
        ls7 : OrganisationsEinheit{
            @display("p=500,300");
        }
        ls12 : OrganisationsEinheit{
            @display("p=500,400");
        }
        
    connections allowunconnected:
        irb.ethg <--> EthGebaeudeKabel <-->  irbRouter.ethg++;
        irb.global_filter++ <-->  globalFilter.nodes++;
        ls1.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls1.global_filter++ <-->  globalFilter.nodes++;
        ls8.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls8.global_filter++ <-->  globalFilter.nodes++;
        ls13.ethg <-->  EthGebaeudeKabel <--> irbRouter.ethg++;
        ls13.global_filter++ <-->  globalFilter.nodes++;
        ls14.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls14.global_filter++ <-->  globalFilter.nodes++;
        ls2.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls2.global_filter++ <-->  globalFilter.nodes++;
        ls5.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls5.global_filter++ <-->  globalFilter.nodes++;
        ls6.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls6.global_filter++ <-->  globalFilter.nodes++;
        ls9.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls9.global_filter++ <-->  globalFilter.nodes++;
        ls11.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls11.global_filter++ <-->  globalFilter.nodes++;
        ls4.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls4.global_filter++ <-->  globalFilter.nodes++;
        ls7.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls7.global_filter++ <-->  globalFilter.nodes++;
        ls12.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        ls12.global_filter++ <-->  globalFilter.nodes++;
        studentischeArbeitsplaetze.ethg <--> EthGebaeudeKabel <--> irbRouter.ethg++;
        studentischeArbeitsplaetze.global_filter++ <-->  globalFilter.nodes++;
  

        //
        // Uni Netzwerk
        //
        irbRouter.ethg++ <--> Eth40G <--> itmcRouter.ethg++;
        itmcRouter.pppg++ <--> Eth10G <--> internet.pppg++;
        eve.pppg++ <--> IdealChannel <--> internet.pppg++;
        alice.pppg++ <--> IdealChannel <--> internet.pppg++;
        
        irbRouter.global_filter <-->  globalFilter.nodes++;
        itmcRouter.global_filter <-->  globalFilter.nodes++;
        eve.global_filter <-->  globalFilter.nodes++;
        alice.global_filter <-->  globalFilter.nodes++;
}
