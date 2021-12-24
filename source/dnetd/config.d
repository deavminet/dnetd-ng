/**
* Configuration sub-system
*/
module dnetd.config;

import dnetd.app : logger;
import std.json : JSONValue, JSONException, parseJSON;
import dnetd.exceptions;
import std.stdio : File;

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
			/* TODO: Throw proper error here saying which key is missing */
			throw new ConfigurationError(e);
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
