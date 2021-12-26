/**
*
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


import std.socket;
/**
* FIXME: When we do anything so far, I am assuming
* a streaming socket so we shouldn't let the
* SocketListener use any SocketType that isn't STREAM
*/
public final class SocketConnection : Connection
{
	private Socket clientSock;

	this(Socket socket)
	{
		clientSock = socket;
	}

	public override void handler()
	{
		while(true)
		{
		}
	}
}
