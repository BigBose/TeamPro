package com.team.sharemap.vo;

public class tripList {
	String catName;
	String location;
	String id;
	String wdate;
	int catNum;
	int onOff;
	int likeNum;
	
	
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public int getCatNum() {
		return catNum;
	}
	public void setCatNum(int catNum) {
		this.catNum = catNum;
	}
	public int getOnOff() {
		return onOff;
	}
	public void setOnOff(int onOff) {
		this.onOff = onOff;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	
}
