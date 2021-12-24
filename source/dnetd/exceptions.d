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
	this()
	{
	}
}
