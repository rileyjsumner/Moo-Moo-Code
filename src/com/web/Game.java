package com.web;

import com.code.CodeGame;
import com.dao.*;
import com.data.Game.GameOutput;
import com.data.Map.MapData;
import com.util.LoginUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import java.util.Objects;


public class Game extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Game() {
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
		// If the user is logged in
		HttpSession session = request.getSession();
		if(LoginUtil.TestLogin(session))
		{
			if(request.getParameterMap().containsKey("level")) // If they request a level
			{
				String levelRequested = request.getParameter("level");
				try
				{
					int levelIntRequested = Integer.parseInt(levelRequested);
					int userId = (int)session.getAttribute("user_id");
					if(UserLevelsDao.UserCanAccessLevel(userId,levelIntRequested))
					{
						String userCode = UserLevelsDao.GetUserCode(userId,levelIntRequested);
						MapData mapData = MapsDao.GetMap(levelIntRequested);
						
						request.setAttribute("level_data",mapData);
						if(Objects.equals(userCode, "")){
							request.setAttribute("code",mapData.Map.Code);
						}
						else{
							request.setAttribute("code",userCode);
						}
						request.setAttribute("desc",!request.getParameterMap().containsKey("retry"));
						request.setAttribute("exec", false);
						
						request.getRequestDispatcher("/WEB-INF/game.jsp").forward(request, response);return;
					}
				}
				catch (NumberFormatException ex){/* level isn't an integer */}
			}
			response.sendRedirect("/LevelSelect");
		}
		else
		{
			request.setAttribute("action_text","play");
			request.setAttribute("action","LevelSelect");
			request.getRequestDispatcher("/WEB-INF/login_required.jsp").forward(request, response);
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
		HttpSession session = request.getSession();
		if(LoginUtil.TestLogin(session))
		{
			Map<String, String[]> keys = request.getParameterMap();
			if (keys.containsKey("player-code") && keys.containsKey("level"))
			{
				String code = request.getParameter("player-code");
				String level = request.getParameter("level");
				try
				{
					int levelIntRequested = Integer.parseInt(level);
					int userId = (int)session.getAttribute("user_id");
					if(UserLevelsDao.UserCanAccessLevel(userId,levelIntRequested))
					{
						// Everything is valid, now we run the code:
						MapData map = MapsDao.GetMap(levelIntRequested);
						
						GameOutput output = CodeGame.RunGame(code,map);
						
						if(output.Success) // If they beat the level, unlock it
						{
							UserLevelsDao.UnlockLevel(userId,levelIntRequested,output.time,code);
						}
						else
						{
							UserLevelsDao.FailedLevel(userId,levelIntRequested,code);
						}
						request.setAttribute("game_data", output);
						request.setAttribute("level_data", map);
						request.setAttribute("code", code);
						request.setAttribute("exec", true);
						request.getRequestDispatcher("/WEB-INF/game.jsp").forward(request, response);return;
					}
				}
				catch (NumberFormatException ex){/* level isn't an integer */}
			}
			response.sendRedirect("/Game");
		}
		else
		{
			request.setAttribute("action_text","play");
			request.setAttribute("action","LevelSelect");
			request.getRequestDispatcher("/WEB-INF/login_required.jsp").forward(request, response);
		}
	}
}