package com.dao;

import com.util.DbUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDao {
	public static boolean TestLogin(String username,String password)
	{
		Connection con = DbUtil.getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = con.prepareStatement("SELECT id FROM users WHERE username = ? AND password = ?");
			preparedStatement.setString(1, username);
			preparedStatement.setString(1, password);
			ResultSet set = preparedStatement.executeQuery();
			if(set.first()){
				return true;
			}
		}
		catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
}
