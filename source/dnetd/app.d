/**
* Main module
*/
module dnetd.app;

import dlog;
import dnetd.exceptions : GeneralException;
import std.json : JSONValue;
import dnetd.config : Configuration;
import dnetd.server : Server;

public Logger logger;
string VERSION = "0.0.1";

void main()
{
	/* Setup the logger */
	logger = new DefaultLogger();
	
	logger.log("Welcome to dnetd v"~VERSION);

	/* TODO: Add jcli handling here */

	try
	{

		Configuration config = Configuration.getConfig("config.json");

		/* TODO: Server init with config here */
		Server server = new Server(config);

	}
	catch(GeneralException e)
	{
		logger.log(e.toString());
	}
}
