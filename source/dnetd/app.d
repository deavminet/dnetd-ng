/**
* Main module
*/
module dnetd.app;

import dlog;
import dnetd.exceptions : GeneralException;
import std.json : JSONValue;
import dnetd.config : readConfig, Configuration;
import dnetd.server : Server;

public Logger logger;
string VERSION = "v0.0.1";

void main()
{
	/* Setup the logger */
	logger = new DefaultLogger();
	
	logger.log("Welcome to dnetd v"~VERSION);

	/* TODO: Add jcli handling here */

	try
	{
		JSONValue jsonConfig = readConfig("config.json");
		Configuration config = Configuration.fromJSON(jsonConfig);

		/* TODO: Server init with config here */
		Server server = new Server(config);

	}
	catch(GeneralException e)
	{
		logger.log(e.toString());
	}
}
