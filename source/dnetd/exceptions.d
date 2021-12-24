/**
* Exceptions sub-system
*/
module dnetd.exceptions;

import std.exception;

/**
* Base class for all DNETD exceptions
*/
public class GeneralException : Exception
{
	/* Name of exception type and description */
	private string errorTypeName;
	private string message;

	/**
	* TODO: Make this take in a `string message`
	*/
	this(string message)
	{
		import std.string : split;
		string[] fragments = split(this.classinfo.name, ".");
		errorTypeName = fragments[fragments.length-1];
		this.message = message;
		super(null);
	}

	public override string toString()
	{
		return errorTypeName~": "~message;
	}
}
