package com.ssafy.happyhouse.controller;

// 지정된 방식으로 지정된 페이지로 이동할수있는 정보를 담는 객체
public class PageInfo {

	private boolean isForward;
	private String url;
	
	public PageInfo(boolean isForward, String url) {
		super();
		this.isForward = isForward;
		this.url = url;
	}

	public boolean isForward() {
		return isForward;
	}

	public void setForward(boolean isForward) {
		this.isForward = isForward;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
