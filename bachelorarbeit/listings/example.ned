package inet.examples.seapp.example;

import inet.nodes.inet.StandardHost;
import inet.nodes.ethernet.Eth1G;
import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.globalfilter.GlobalFilter;
import inet.exmachina.ExMachina;
import inet.nodes.inet.Router;

network Example
{
	parameters:
		string attackConfigurationFile = default("none");
	submodules:
		configurator: IPv4NetworkConfigurator;
		globalFilter: GlobalFilter;
		alice: StandardHost;
		bob: StandardHost;
		eve: StandardHost;
		router: Router;
		exmachina: ExMachina;

	connections allowunconnected:
		router.ethg++  <--> Eth1G <--> alice.ethg++;
		router.ethg++  <--> Eth1G <--> bob.ethg++;
		router.ethg++  <--> Eth1G <--> eve.ethg++;

		globalFilter.nodes++ <--> alice.global_filter;
		globalFilter.nodes++ <--> bob.global_filter;
		globalFilter.nodes++ <--> eve.global_filter;
		globalFilter.nodes++ <--> router.global_filter;
}
