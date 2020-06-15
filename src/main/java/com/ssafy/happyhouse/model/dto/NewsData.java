package com.ssafy.happyhouse.model.dto;

public class NewsData {
	private String headUrl;
	private String headText;
	private String contentUrl;
	private String contentText;
	private String image;
	
	public NewsData() {
		// TODO Auto-generated constructor stub
	}

	public NewsData(String headUrl, String headText, String contentUrl, String contentText, String image) {
		super();
		this.headUrl = headUrl;
		this.headText = headText;
		this.contentUrl = contentUrl;
		this.contentText = contentText;
		this.image = image;
	}

	public String getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String headUrl) {
		this.headUrl = headUrl;
	}

	public String getHeadText() {
		return headText;
	}

	public void setHeadText(String headText) {
		this.headText = headText;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getContentText() {
		return contentText;
	}

	public void setContentText(String contentText) {
		this.contentText = contentText;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "NewsData [headUrl=" + headUrl + ", headText=" + headText + ", contentUrl=" + contentUrl
				+ ", contentText=" + contentText + ", image=" + image + "]";
	}
	
}
