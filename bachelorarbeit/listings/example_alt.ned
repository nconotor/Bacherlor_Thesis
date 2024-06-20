package inet.examples.ba_example;

import inet.nodes.ethernet.Eth10G;
import inet.nodes.ethernet.Eth40G;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.nodes.ethernet.EtherSwitch;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;


module PcRoom
{
    parameters:
        int clientCount;
        @display("i=block/users;bgb=600,336;bgl=2");

    gates:
        inout ethg;

    submodules:
        client[clientCount]: StandardHost {
            @display("p=290,144");
        }
        switch: EtherSwitch {
            parameters:
                @display("p=117,143");
        }

    connections allowunconnected:
        for k=0..clientCount-1 {
            client[k].ethg++ <--> Eth10G <--> switch.ethg++;
        }

        switch.ethg++ <--> ethg;
}


network ExampleNetwork
{
    @display("bgb=651,415;bgl=2");

    submodules:
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=40,40");
        }
        standardHost: PcRoom {
            @display("p=575,170");
        }
        router: Router {
            @display("p=367,170");
        }
        server: StandardHost {
            @display("p=169,170");
        }
        
    connections:
        server.ethg++ <--> Eth40G <--> router.ethg++;
        router.ethg++ <--> Eth10G <--> standardHost.ethg;
}
