package com.chinasofti.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.chinasofti.Actions.MusicBean;

public class MusicDAO {

	private DbConn db = DbConn.getInstance();

	public boolean updateUser(MusicBean music) {
		boolean flag = false;
		Connection conn = db.getConn();
		// 预编译的SQL语句
		String sql = "update musics set MUSIC_NAME=?,MUSIC_SINGER=?,MUSIC_SIZE=? where MUSIC_NO=?";
		// 创建用来执行预编译SQL语句的对象
		PreparedStatement ps = null;
		try {
			// SQL语句的预编译
			ps = conn.prepareStatement(sql);
			ps.setString(1, music.getMusicName());
			ps.setString(2, music.getMusicSinger());
			ps.setString(3, music.getMusicSize());
			ps.setInt(4, music.getMusicNo());
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

	public boolean deleteUser(int musicNo) {
		boolean flag = false;
		String sql = "delete from musics where MUSIC_NO=?";
		PreparedStatement ps = null;
		Connection conn = db.getConn();
		try {
			// SQL语句的预编译
			ps = conn.prepareStatement(sql);
			ps.setInt(1, musicNo);
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

	public List<MusicBean> findUser() {
		List<MusicBean> musics = new ArrayList<MusicBean>();
		Connection conn = db.getConn();
		String sql = "select * from musics";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MusicBean m = new MusicBean();
				// 取结果集中的数据，一条一条的放入集合中
				m.setMusicNo(rs.getInt("MUSIC_NO"));
				m.setMusicName(rs.getString("MUSIC_NAME"));
				m.setMusicSinger(rs.getString("MUSIC_SINGER"));
				m.setMusicSize(rs.getString("MUSIC_SIZE"));
				musics.add(m);
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

		return musics;
	}
}
