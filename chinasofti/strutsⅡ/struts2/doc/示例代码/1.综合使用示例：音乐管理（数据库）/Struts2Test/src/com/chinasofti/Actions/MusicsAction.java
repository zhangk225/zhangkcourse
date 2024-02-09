package com.chinasofti.Actions;

import java.util.List;


import com.chinasofti.db.MusicDAO;

public class MusicsAction {

	private List<MusicBean> musics;

	public String execute() {
		MusicDAO mDao = new MusicDAO();
		musics = mDao.findUser();
		return "success";
	}

	public List<MusicBean> getMusics() {
		return musics;
	}

	public void setMusics(List<MusicBean> musics) {
		this.musics = musics;
	}

}
