package com.web.Admin;
import com.dao.MapsDao;
import com.data.Map.MapData;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
				else if(action.equals("settings"))
				{
					try{
						int dimX = Integer.parseInt(request.getParameter("x"));
						int dimY = Integer.parseInt(request.getParameter("y"));
						int time = (int)(Float.parseFloat(request.getParameter("time"))*10);
						String desc = request.getParameter("desc");
						String help = request.getParameter("help");
						String code = request.getParameter("code");
						int mapId = Integer.parseInt(request.getParameter("map"));
						
						MapsDao.SetMapSettings(mapId,dimX,dimY,time,desc,help,code);
						
						response.sendRedirect("/Admin/LevelEditor?level="+mapId);
					}
					catch(NumberFormatException ex){response.sendRedirect("/Admin/Levels");}
				}
				else if(action.equals("entity_new"))
				{
					try{
						int type = Integer.parseInt(request.getParameter("type"));
						int mapId = Integer.parseInt(request.getParameter("map"));
						
						MapsDao.AddEntity(mapId,type);
						
						response.sendRedirect("/Admin/LevelEditor?level="+mapId+"&mode=1");
					}
					catch(NumberFormatException ex){response.sendRedirect("/Admin/Levels");}
				}
				else if(action.equals("entity"))
				{
					try{
						int id = Integer.parseInt(request.getParameter("id"));
						String name = request.getParameter("name");
						int type = Integer.parseInt(request.getParameter("type"));
						float spawn_x = Float.parseFloat(request.getParameter("spawn_x"));
						float spawn_y = Float.parseFloat(request.getParameter("spawn_y"));
						int mapId = Integer.parseInt(request.getParameter("map"));
						
						MapsDao.UpdateEntity(id,type,name,spawn_x,spawn_y);
						response.sendRedirect("/Admin/LevelEditor?level="+mapId+"&mode=1&selected_ent="+id);
					}
					catch(NumberFormatException ex){response.sendRedirect("/Admin/Levels");}
				}
				else if(action.equals("entity_delete"))
				{
					try{
						int id = Integer.parseInt(request.getParameter("id"));
						int mapId = Integer.parseInt(request.getParameter("map"));
						
						MapsDao.DeleteEntity(id);
						response.sendRedirect("/Admin/LevelEditor?level="+mapId+"&mode=1");
					}
					catch(NumberFormatException ex){response.sendRedirect("/Admin/Levels");}
				}
			}
		}
	}
}