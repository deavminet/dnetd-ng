/**
* Configuration sub-system
*/
module dnetd.config;

import dnetd.app : logger;
import std.json : JSONValue, JSONException;
import dnetd.exceptions;

/**
*
*/
public final class Configuration
{
	/**
	* Load the configuration from a JSON source, returning the
	* configuration as a Configuration object, on error, null (TODO: Throw exception rather)
	*
	* @param jsonConfig the JSONValue configuration
	*/
	public static Configuration fromJSON(JSONValue jsonConfig)
	{
		Configuration config;
		
		try
		{
			/* TODO: Parse config here */
			
			/* Retrieve the `network` block */
			JSONValue networkBlock = jsonConfig["network"];
			
			/* Retrieve the `accounting` block */
			JSONValue accountingBlock = jsonConfig["accounting"];
			
			/* Retrieve the `links` block */
			JSONValue linksBlock = jsonConfig["links"];
			
			
		}
		catch(JSONException e)
		{
			logger.log("Error whilst parsing the configuration: "~e.toString());
		}
		
		return config;
	}
}

/**
* Reads in the JSON from the given path to the configuration
* file
*
* On error throws TODO
*/
public JSONValue readConfig(string path)
{
	JSONValue config;


	return config;
}


/**
* Configuration error
*/
public final class ConfigurationError : GeneralException
{
	this()
	{
	}
}
