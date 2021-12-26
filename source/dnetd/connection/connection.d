/**
* Connection handling sub-system
*/
module dnetd.connection.connection;

import core.thread : Thread;
import dnetd.server : Server;

/**
* Represents a client's/server's connection to
* this server
*
* These are normally spawned by the `serviceLoop`
* of Listener sub-classes
*/
public abstract class Connection : Thread
{
	/**
	* The server instance this Connection
	* is associated with
	*/
	private Server server;

	this(Server server)
	{
		super(&handler);
		this.server = server;
	}

	/**
	* Connection handler
	*
	* This is to be implemented by sub-classes
	*/
	public abstract void handler();
}
