package com.liang;

import com.googlecode.objectify.Objectify;
import com.googlecode.objectify.ObjectifyFactory;

// APT: this solves potential "not registered" failures, e.g., if we bringup app and immediately go to ViewAllStreams.jsp
// call to data store read via objectify service will fail even if stream class calls the register() method 
// See this for details: https://code.google.com/p/objectify-appengine/wiki/BestPractices#How_NOT_To_Register_Entities
public class OfyService {
	// if use OfyService, use factory().register(xx.class), but if in code, use objectifyService.register(xx.class)
    static {
    	factory().register(Baby.class);
    	factory().register(AppUser.class);
    }
// to use this in servlet, import static com.yourproject.OfyServer.ofy; be sure to include "static" 
    public static Objectify ofy() {
        return com.googlecode.objectify.ObjectifyService.ofy();
    }
 // to use this in servlet, import static com.yourproject.OfyServer.factory; be sure to include "static" 
    public static ObjectifyFactory factory() {
        return com.googlecode.objectify.ObjectifyService.factory();
    }
}
