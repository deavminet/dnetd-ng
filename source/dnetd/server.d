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
import dnetd.config : ConfigurationError, Configuration;
import std.container.slist : SList;
import dnetd.listeners.listeners : Listener;
import dnetd.connection.connection : Connection;
import core.sync.mutex : Mutex;

/**
* Represents an instance of a dnet server
*/
public final class Server
{
	/* Server Configuration */
	private Configuration config;

	/**
	* Listeners
	*/
	private SList!(Listener) listeners;
	private Mutex listenersMutex;

	/**
	* Connected clients and servers
	*
	* Inbound and outbound
	*/
	private SList!(Connection) conns;
	private Mutex connsMutex;




	this(Configuration config)
	{
		logger.log("Server instance '"~"PUT ID HERE"~"' starting up...");
		this.config = config;

		/**
		* Initialize all locks for data
		* structures
		*/
		connsMutex = new Mutex();
		listeners = new Mutex();
	}

	/* Rehash server configuration */
	public void rehash()
	{
		try
		{
			config = Configuration.getConfig(config.configPath);
		}
		catch(ConfigurationError e)
		{
			/* TODO: Handle the error here by sending a server message */
			logger.log("Error whilst rehashing the configuration");
		}
	}
}
