package com.ssafy.happyhouse.model.dto;

public class Lamp {
	private int no;
	private String name;
	private double lng;
	private double lat;
	
	public Lamp() {

	}

	public Lamp(int no, String name, double lng, double lat) {
		super();
		this.no = no;
		this.name = name;
		this.lng = lng;
		this.lat = lat;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	@Override
	public String toString() {
		return "Lamp [no=" + no + ", name=" + name + ", lng=" + lng + ", lat=" + lat + "]";
	}
	
	
	
}
