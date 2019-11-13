package com.web.service.impl._06;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.web.model._06.PetBean;



@Service

public class Pet_UserDao {

	private Connection conn;

	public void createConn() {

		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connUrl = "jdbc:sqlserver://localhost:1433;databaseName=PetDB";
			conn = DriverManager.getConnection(connUrl, "sa", "password");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConn() {

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * �n�J���ұb�K
	 * 
	 * @param account  �b��
	 * @param password �K�X
	 * @return ���G�Otrue�٬Ofalse true�N�����Ҧ��\ false�N����
	 */
	public PetBean loginVerifi(String userName, String userPassword) {
		String qryStmt = "SELECT * FROM member WHERE member_Id=? and password=?";
		PreparedStatement stmt = null;

		try {
			stmt = conn.prepareStatement(qryStmt);
			stmt.setString(1, userName);
			stmt.setString(2, userPassword);
			ResultSet rs = stmt.executeQuery();
			PetBean emp = new PetBean();
			if (rs.next()) { // �p�GRS����ƪ���
				emp.setUserID(rs.getInt("member_Id"));
				emp.setUserName(rs.getString("name"));
				emp.setUserPassword(rs.getInt("password"));
				return emp;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;

	}

}
