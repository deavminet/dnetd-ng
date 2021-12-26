/**
* Socket-based listener for supporting any
* network protocol that Linux supports, such as
* TCP (STREAM-based) on IPv4 and IPv6 and UNIX
* domain sockets... to name a few.
*/
module dnetd.listeners.socket;

import dnetd.listeners.listeners;
import dnetd.server : Server;
import std.socket;
import std.conv : to;

public final class SocketListenerException : ListenerException
{
	this(SocketListener e)
	{
		string msg = to!(string)(e.getAddress().addressFamily)
		~
		"-type socket listener error";

		super(e, msg);
	}
}

public final class SocketListener : Listener
{
	private Socket socket;
	private Address address;

	this(Server server, Address address, SocketType type, ProtocolType proto)
	{
		super(server);
		this.address = address;

		try
		{
			socket = new Socket(address.addressFamily, type, proto);
			socket.bind(address);
		}
		catch(SocketOSException e)
		{
			throw new SocketListenerException(this);
		}
	}

	/**
	* Socket accept-and-connection spawner
	* loop
	*/
	public override void serviceLoop()
	{
		while(true)
		{
			Socket clientSock = socket.accept();

			//TODO
		}
	}

	public Address getAddress()
	{
		return address;
	}
}
