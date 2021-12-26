/**
* Socket-based connection handler sub-system
*/

import dnetd.connection.connection : Connection;
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
