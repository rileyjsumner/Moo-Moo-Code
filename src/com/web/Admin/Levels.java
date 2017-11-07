package com.web.Admin;
import com.dao.LevelsDao;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class Levels extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Levels() {super();}
	
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
			HttpSession session = request.getSession();
			request.setAttribute("levels",LevelsDao.GetAllLevels());
			request.getRequestDispatcher("/WEB-INF/admin/levels.jsp").forward(request, response);
		}
		
	}
	
	/**
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		if(LoginUtil.TestAdmin(request,response))
		{
			// Get request data
			String action = request.getParameter("action");
			String id_s = request.getParameter("id");
			String name = request.getParameter("name");
			String pos_x_s = request.getParameter("x_position");
			String pos_y_s = request.getParameter("y_position");
			String unlock_1_s = request.getParameter("unlock_1");
			String unlock_2_s = request.getParameter("unlock_2");
			String unlock_3_s = request.getParameter("unlock_3");
			
			// Parse the ints
			try {
				int id = Integer.parseInt(id_s);
				int pos_x = Integer.parseInt(pos_x_s);
				int pos_y = Integer.parseInt(pos_y_s);
				int unlock_1 = Integer.parseInt(unlock_1_s);
				int unlock_2 = Integer.parseInt(unlock_2_s);
				int unlock_3 = Integer.parseInt(unlock_3_s);
				
				if ("update".equals(action) || "editor".equals(action)) {
					LevelsDao.UpdateLevel(id, name, pos_x, pos_y, unlock_1, unlock_2, unlock_3);
					if ("editor".equals(action)) {
						response.sendRedirect("/Admin/LevelEditor?level=" + id);
						return;
					}
				} else if ("new".equals(action)) {
					LevelsDao.AddLevel(name, pos_x, pos_y, unlock_1, unlock_2, unlock_3);
				} else if ("delete".equals(action)) {
					if (id == 1) {
						response.sendRedirect("/Admin/Levels?failed=cant_delete_first_level");
						return;
					} else {
						LevelsDao.DeleteLevel(id);
					}
				} else {
					response.sendRedirect("/Admin/Levels?failed=no_action");
					return;
				}
				response.sendRedirect("/Admin/Levels");
			} catch (NumberFormatException ex) {
				response.sendRedirect("/Admin/Levels?failed=number_format");
			}
		}
	}
}