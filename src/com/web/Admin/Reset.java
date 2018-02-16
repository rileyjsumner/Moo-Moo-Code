package com.web.Admin;

import com.util.DbUtil;
import com.util.Html;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class Reset extends HttpServlet {
	// Controller for /Home
	private static final long serialVersionUID = 1L;
	
	public Reset() {super();}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(LoginUtil.TestAdmin(request,response))
		{
			try
			{
				Connection conn = DbUtil.getConnection();
				PreparedStatement statement = conn.prepareStatement("CALL reset_procedure");
				statement.execute();
			}
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			
			response.sendRedirect(Html.encodeURL(request,"/Home"));
		}
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}