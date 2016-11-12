package com.chinasofti.Actions;

import java.util.List;


import com.chinasofti.db.MusicDAO;

public class MusicsAction {

	private List<MusicBean> musics;
	
	private int musicNo;

	public String queryMusic() {
		MusicDAO mDao = new MusicDAO();
		musics = mDao.findUser();
		return "success";
	}
	
	public String deleteMusic() {
		MusicDAO mDao = new MusicDAO();
		boolean flag = mDao.deleteUser(musicNo);
		if (flag) {
			return "deletesuccess";
		} else {
			return "false";
		}
	}

	public List<MusicBean> getMusics() {
		return musics;
	}

	public void setMusics(List<MusicBean> musics) {
		this.musics = musics;
	}
	
	public int getMusicNo() {
		return musicNo;
	}

	public void setMusicNo(int musicNo) {
		this.musicNo = musicNo;
	}

}
