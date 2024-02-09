package com.chinasofti.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.chinasofti.Actions.UserBean;

public class UserDAO {

	private DbConn db = DbConn.getInstance();

	public boolean saveUser(UserBean user) {
		boolean flag = false;
		// 建立连接
		Connection conn = db.getConn();
		// 创建statement对象
		Statement stmt = null;
		try {
			// SQL语句
			String sql = "insert into testuser(account,identityId,name,password,sex,phone) values('" + user.getAccount()
					+ "','" + user.getIdentityId() + "','" + user.getName() + "','" + user.getPassword() + "','"
					+ user.getSex() + "','" + user.getPhone() + "')";
			System.out.println(sql);
			stmt = conn.createStatement();

			// 执行SQL语句
			if (stmt.executeUpdate(sql) > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	public boolean updateUser(UserBean user) {
		boolean flag = false;
		Connection conn = db.getConn();
		// 预编译的SQL语句
		String sql = "update testuser set identityId=?,name=?,password=?,sex=?,phone=? where account=?";
		// 创建用来执行预编译SQL语句的对象
		PreparedStatement ps = null;
		try {
			// SQL语句的预编译
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.getIdentityId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getSex());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getAccount());
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConnAndPs(conn, ps);
		}
		return flag;
	}

	public boolean deleteUser(String account) {

		boolean flag = false;
		String sql = "delete from testuser where account=?";
		PreparedStatement ps = null;
		Connection conn = db.getConn();
		try {
			// SQL语句的预编译
			ps = conn.prepareStatement(sql);
			ps.setString(1, account);
			if (ps.executeUpdate() > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeConnAndPs(conn, ps);
		}
		return flag;
	}

	public List<UserBean> findUser() {
		List<UserBean> users = new ArrayList<UserBean>();
		Connection conn = db.getConn();
		String sql = "select * from testuser";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				UserBean u = new UserBean();
				// 取结果集中的数据，一条一条的放入集合中
				u.setAccount(rs.getString("account"));
				u.setIdentityId(rs.getString("identityId"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setSex(rs.getString("sex"));
				u.setPhone(rs.getString("phone"));
				users.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.closeConnAndPs(conn, ps);
		}

		return users;
	}
	
	public UserBean findUserByAccount(String account) {
		Connection conn = db.getConn();
		String sql = "select * from testuser where account=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		UserBean u =null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, account);
			rs = ps.executeQuery();
			if (rs.next()) {
				u = new UserBean();
				// 取结果集中的数据，一条一条的放入集合中
				u.setAccount(rs.getString("account"));
				u.setIdentityId(rs.getString("identityId"));
				u.setName(rs.getString("name"));
				u.setPassword(rs.getString("password"));
				u.setSex(rs.getString("sex"));
				u.setPhone(rs.getString("phone"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			db.closeConnAndPs(conn, ps);
		}

		return u;
	}

	public static void main(String[] args) {
		UserDAO udao = new UserDAO();
		UserBean u = new UserBean();
		String account="111111";
		u.setAccount(account);
		u.setName("11111");
		u.setPassword("111111");
		u.setPhone("1111111");
		u.setSex("man");
		u.setIdentityId("111111111");
		udao.deleteUser(account);
		udao.saveUser(u);
		UserBean user=udao.findUserByAccount(account);
		System.out.println(user.getName());
		u.setPassword("2222");
		u.setName("222");
		udao.updateUser(u);
		List<UserBean> users = udao.findUser();
		for (UserBean us : users) {
			System.out.println(us.getName());
		}
		
	}
}
