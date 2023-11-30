package com.services.authentication;

import javax.servlet.http.HttpServletRequest;
public class Authentication {
	  public static boolean isAuthenticatedSuccess(HttpServletRequest request) {
	        return request.getSession().getAttribute("username") != null;
	    }
}
