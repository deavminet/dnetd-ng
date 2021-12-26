/**
* Socket-based connection handler sub-system
*/

import dnetd.connection.connection : Connection;
import std.socket;
import dnetd.server : Server;

/**
* FIXME: When we do anything so far, I am assuming
* a streaming socket so we shouldn't let the
* SocketListener use any SocketType that isn't STREAM
*/
public final class SocketConnection : Connection
{
	private Socket socket;

	this(Server server, Socket socket)
	{
		super(server);
		this.socket = socket;
	}

	public override void handler()
	{
		while(true)
		{
		}
	}
}
