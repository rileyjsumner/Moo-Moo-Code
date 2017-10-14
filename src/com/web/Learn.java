package com.web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;


public class Learn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Learn() {
		super();
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward;
		URL url;
		InputStream is = null;
		BufferedReader br;
		String line;
		String data = "";
		
		//VERIFY A GET REQUEST IS HAPPENING
		System.out.println("GET REQUEST!");
	    /*
        // FETCH DATA FROM GOOGLE API
        try {
            url = new URL("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=500&type=restaurant&keyword=cruise&key=AIzaSyDFnRgp5wG3WNEKiLZg8Cjk5vjSyvL86_8");
            is = url.openStream();
            br = new BufferedReader(new InputStreamReader(is));

            // READ DATA INTO STRING
            while ((line = br.readLine()) != null) {
                data += line + "\n";
                System.out.println(line);
            }
        }
        catch (MalformedURLException mue)
        {
            mue.printStackTrace();
        }
        catch (IOException ioe)
        {
            ioe.printStackTrace();
        }
        finally
        {
            try
            {
                if (is != null) is.close();
            }
            catch (IOException ioe)
            {

            }
        }
        request.setAttribute("data", data);*/
		forward = "/WEB-INF/learn.jsp";
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		
		Enumeration<String> test = request.getParameterNames();
		String h = "";
		while (test.hasMoreElements()) {
			h = test.nextElement();
			System.out.println("PARAMETER: " + h + " : " + request.getParameter(h));
		}
		
		String action = request.getParameter("action");
		System.out.println("Post action is: " + action);
		
		String forward = "/WEB-INF/learn.jsp";
		
		//LOGIC HERE
		
		if (action.equals("home")) {
			forward = "/WEB-INF/learn.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}