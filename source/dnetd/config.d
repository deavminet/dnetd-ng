/**
* Configuration sub-system
*/
module dnetd.config;

import dnetd.app : logger;
import std.json : JSONValue, JSONException, parseJSON;
import dnetd.exceptions;
import std.stdio : File;
import std.string : cmp, strip;

/**
* In its instance-form this represents a read-in and parsed configuration
* of the configuration file in an OOP format, with the ability to write back
* any modifications made to it (TODO: Add this).
*
* In static use it provides the ability to translate between the JSON configuration
* file and the instance (OOP) form.
*/
public final class Configuration
{
	string configPath;
	NetworkInformation netInfo;

	public static Configuration getConfig(string configPath)
	{
		JSONValue jsonConfig = readConfig("config.json");
		Configuration config = Configuration.fromJSON(jsonConfig);

		/* Save the path so we can rehash later on */
		config.configPath = configPath;

		return config;
	}

	/**
	* Reads in the JSON from the given path to the configuration
	* file
	*
	* On error throws TODO
	*/
	private static JSONValue readConfig(string path)
	{
		File file;
		file.open(path); /* TODO:Check this for errors */
		/* TODO: Only open with read rights */

		/* Allocate a buffer for the file */
		byte[] contents;
		contents.length = file.size(); /* TODO: Check size here */

		/* TODO: Check this */
		/* TODO: Technically the below is fine */
		file.rawRead(contents);

		JSONValue config;

		try
		{
			config = parseJSON(cast(string)contents);
		}
		catch(JSONException e)
		{
			/* TODO: Get specific error here to show where config syntax is wrong */


			throw new ConfigurationError(e);
		}


		return config;
	}

	/**
	* Load the configuration from a JSON source, returning the
	* configuration as a Configuration object, on error, null (TODO: Throw exception rather)
	*
	* @param jsonConfig the JSONValue configuration
	*/
	private static Configuration fromJSON(JSONValue jsonConfig)
	{
		Configuration config = new Configuration();
		
		try
		{
			/* TODO: Parse config here */
			
			/* Retrieve the `network` block */
			JSONValue networkBlock = jsonConfig["network"];
			
			config.netInfo = confNetInfo(networkBlock["info"]);
			// TODO: Log the above logger.log()


			/* Retrieve the `accounting` block */
			JSONValue accountingBlock = jsonConfig["accounting"];
			
			/* Retrieve the `links` block */
			JSONValue linksBlock = jsonConfig["links"];
			
			
		}
		catch(JSONException e)
		{
			/* TODO: Throw proper error here saying which key is missing */
			throw new ConfigurationError(e);
		}
		
		return config;
	}

	private static NetworkInformation confNetInfo(JSONValue infoBlock)
	{
		NetworkInformation netInfo;

		/**
		* TODO (keycheck): Make sure that `serverName` is present
		* and `networkName`
		*
		* `motd` is optional
		*/
		bool foundNetworkName;
		bool foundServerName;

		string[] keys = infoBlock.object.keys();
		foreach(string key; keys)
		{
			if(cmp(key, "serverName") == 0)
			{
				foundServerName = true;
				netInfo.serverName = infoBlock[key].str();
			}
			else if(cmp(key, "networkName") == 0)
			{
				foundNetworkName = true;
				netInfo.networkName = infoBlock[key].str();
			}

		}


		/**
		* Make sure we found the required fields
		*
		* These are: serverName, networkName, sid (TODO: Finish these)
		*/
		if(!foundServerName)
		{
			throw new ConfigurationError("Missing server name");
		}
		else if(!foundNetworkName)
		{
			throw new ConfigurationError("Missing network name");
		}

		/**
		* Strip whitespace from the beginnings and endings of
		* `serverName`, `networkName`, (TODO: Complete list)
		*/
		netInfo.serverName = strip(netInfo.serverName);
		netInfo.networkName = strip(netInfo.networkName);

		/**
		* Make sure the required fields were set to a valid
		* value
		*/
		if(cmp(netInfo.networkName, "") == 0)
		{
			throw new ConfigurationError("Network name cannot be empty");
		}
		else if(cmp(netInfo.serverName, "") == 0)
		{
			throw new ConfigurationError("Server name cannot be empty");
		}

		/* TODO: Add handling for motd and motdFile */


		return netInfo;
	}

	private this()
	{
	}
}




/**
* Configuration error
*/
public final class ConfigurationError : GeneralException
{
	this(string message)
	{
		super(message);
	}

	this(JSONException e)
	{
		super("JSON configuration has a syntax error ("~e.msg~")");
	}
}


/**
* Network information
*
* This holds information that pertains to network-wide
* information (such as the network's name) and server-specific
* information such as the message-of-the-day or the server's
* name
*/
struct NetworkInformation
{
	string serverName;
	string motd;
	ushort sid;

	string networkName;

}

	
