/**
* Module for listeners
*
* These include the base listener class responsible
* for managing a connection with peers and some
* concrete classes implementing this for various
* network protocols
*/
module dnetd.listeners.listeners;

import dnetd.server : Server;
import dnetd.exceptions : GeneralException;
import std.exception;
import core.thread : Thread;

public abstract class Listener : Thread
{
	private Server server;

	this(Server server)
	{
		super(&serviceLoop);
		this.server = server;
	}

	/**
	* The connection accepting loop of which
	* is provided as the "worker" function to
	* the thread
	*/
	public abstract void serviceLoop();
}

public abstract class ListenerException : GeneralException
{
	/* TODO: Potentially remove `listener` */
	this(Listener listener, string msg)
	{
		/* TODO: Set message here */
		super(msg);
	}
}
