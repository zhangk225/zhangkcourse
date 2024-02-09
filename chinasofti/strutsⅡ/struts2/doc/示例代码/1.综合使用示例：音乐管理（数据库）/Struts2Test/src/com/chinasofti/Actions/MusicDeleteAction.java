package com.chinasofti.Actions;

import com.chinasofti.db.MusicDAO;

public class MusicDeleteAction {

	private int musicNo;

	public String execute() {
		MusicDAO mDao = new MusicDAO();
		boolean flag = mDao.deleteUser(musicNo);
		if (flag) {
			return "success";
		} else {
			return "false";
		}
	}

	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

}
