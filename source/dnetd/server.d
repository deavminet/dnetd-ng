/**
* Server sub-system
*
* This module pertains to the code required to stand-up a
* singular instance of a server and all the state that
* relates to it, such as users, server links and processing/handling
* of messages and commands.
*/
module dnetd.server;

import dnetd.app : logger;
import dnetd.config : Configuration;

/**
* Represents an instance of a dnet server
*/
public final class Server
{
	this(Configuration config)
	{
		logger.log("Server instance '"~"PUT ID HERE"~"' starting up...");
	}
}
