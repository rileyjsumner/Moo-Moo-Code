package com.util;

import javax.servlet.http.HttpServletRequest;

public class Html {
	public static String encodeURL(HttpServletRequest request, String string)
	{
		return request.getContextPath()+string;
	}
	public static String encode(String string)
	{
		string = string.replace("\\","\\\\");
		string = string.replace("\n","\\n");
		string = string.replace("\t","\\t");
		string = string.replace("\"","\\\"");
		string = string.replace("\'","\\'");
		string = string.replace("\r","\\r");
		string = string.replace("\b","\\b");
		return string;
	}
	static String decode(String string)
	{
		string = string.replace("\\\\","\\");
		string = string.replace("\\n","\n");
		string = string.replace("\\t","\t");
		string = string.replace("\\\"","\"");
		string = string.replace("\\'","\'");
		string = string.replace("\\r","\r");
		return string;
	}
}
