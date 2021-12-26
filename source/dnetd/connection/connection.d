/**
* Connection handling sub-system
*/
module dnetd.connection.connection;

import core.thread : Thread;

/**
* Represents a client's/server's connection to
* this server
*
* These are normally spawned by the `serviceLoop`
* of Listener sub-classes
*/
public abstract class Connection : Thread
{
	this()
	{
		super(&handler);
	}

	/**
	* Connection handler
	*
	* This is to be implemented by sub-classes
	*/
	public abstract void handler();
}
