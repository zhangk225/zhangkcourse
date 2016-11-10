package com.chinasofti.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DbConn {
	private Connection conn;
	
	private static DbConn db;
	
	private DbConn(){
		
	}
	
	public static DbConn getInstance(){
		if(db == null){
			return new DbConn();
		}
		return db;
	}
	
	public Connection getConn(){
		//创建链接
		try {
			if(conn!=null&&!conn.isClosed()){
				return conn;
			}
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url ="jdbc:oracle:thin:@localhost:1521:XE";
			conn = DriverManager.getConnection(url,"system","zhangk");
			System.out.println("connection successful!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
		
	}
	
	public void closeConnAndPs(Connection conn,PreparedStatement ps){
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	

}
