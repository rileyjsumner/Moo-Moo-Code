package com.web.Admin;
import com.dao.LevelsDao;
import com.dao.MapsDao;
import com.data.MapData;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class LevelEditor extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LevelEditor() {super();}
	
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
			if(request.getParameterMap().containsKey("level"))
			{
				try
				{
					int level = Integer.parseInt(request.getParameter("level"));
					
					MapData mapData = MapsDao.GetMap(level);
					
					if(mapData.Valid)
					{
						request.setAttribute("map_data", MapsDao.GetMap(level));
						
						request.getRequestDispatcher("/WEB-INF/admin/level_editor.jsp").forward(request, response);return;
					}
				}
				catch(NumberFormatException ex){/*Invalid level*/}
			}
			response.sendRedirect("/Admin/Home");
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
		if(LoginUtil.TestAdmin(request,response,false))
		{
			if(request.getParameterMap().containsKey("action"))
			{
				String action = request.getParameter("action");
				if(action.equals("tile"))
				{
					try{
						int tileX = Integer.parseInt(request.getParameter("x"));
						int tileY = Integer.parseInt(request.getParameter("y"));
						int tileType = Integer.parseInt(request.getParameter("type"));
						int mapId = Integer.parseInt(request.getParameter("map"));
						MapsDao.SetMapTile(mapId,tileX,tileY,tileType);
					}
					catch(NumberFormatException ex){/**/}
				}
			}
		}
	}
}