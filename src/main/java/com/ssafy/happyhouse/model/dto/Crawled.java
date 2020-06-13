package com.ssafy.happyhouse.model.dto;

public class Crawled {
	private String doe; // 도
	private String privateSector; //민영, 국영
	private String parcel; // 분양, 임대
	private String city; // 시
	private String phone; //qjsgh
	
	public Crawled() {
		// TODO Auto-generated constructor stub
	}

	public String getDoe() {
		return doe;
	}

	public void setDoe(String doe) {
		this.doe = doe;
	}

	public String getPrivateSector() {
		return privateSector;
	}

	public void setPrivateSector(String privateSector) {
		this.privateSector = privateSector;
	}

	public String getParcel() {
		return parcel;
	}

	public void setParcel(String parcel) {
		this.parcel = parcel;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
