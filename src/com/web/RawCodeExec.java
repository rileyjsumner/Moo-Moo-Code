package com.web;

import com.code.CodeEngine;
import com.code.CodeOutput;
import com.util.Html;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


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
		String code = request.getParameter("code");
		CodeEngine engine = new CodeEngine();
		CodeOutput output = engine.Exec(code);
		if(output.Error)
		{
			String errorMessage = "ERROR: " + output.Text;
			
			request.setAttribute("data", "{\"data\":\""+Html.encode(errorMessage)+"\",\"error\":true}");
		}
		else
		{
			request.setAttribute("data", "{\"data\":\""+Html.encode(output.Text)+"\",\"error\":false}");
		}
		request.getRequestDispatcher("/WEB-INF/data.jsp").forward(request, response);
	}
}