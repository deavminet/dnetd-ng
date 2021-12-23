/**
* Configuration sub-system
*/
module dnetd.config;

import dnetd.app : logger;
import std.json : JSONValue, JSONException;

public final class Configuration
{
	/**
	* Load the configuration from a JSON source, returning the
	* configuration as a Configuration object, on error, null
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
