package com.web;

import com.code.CodeExec;
import com.util.Html;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;


public class RawCodeExec extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public RawCodeExec() {
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
		response.sendRedirect("/Home");
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = (String)request.getParameter("code");
		HashMap output = CodeExec.Exec(code);
		if((boolean)output.get("error"))
		{
			String errorMessage = "ERROR: " + output.get("message") + "\nOn line: "+output.get("line");
			
			errorMessage = Html.encode(errorMessage);
			
			request.setAttribute("data", "{\"data\":\""+errorMessage+"\",\"error\":true}");
		}
		else
		{
			String out = (String)output.get("output");
			out = Html.encode(out);
			request.setAttribute("data", "{\"data\":\""+out+"\",\"error\":false}");
		}
		request.getRequestDispatcher("/WEB-INF/data.jsp").forward(request, response);
	}
}