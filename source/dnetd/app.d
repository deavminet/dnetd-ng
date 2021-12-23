/**
* Main module
*/
module dnetd.app;

import dlog;

public Logger logger;
string VERSION = "v0.0.1";

void main()
{
	/* Setup the logger */
	logger = new DefaultLogger();
	
	logger.log("Welcome to dnetd v"~VERSION);
}
