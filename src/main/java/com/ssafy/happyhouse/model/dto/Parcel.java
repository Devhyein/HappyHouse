package com.ssafy.happyhouse.model.dto;

public class Parcel {
	private String area;
	private String loc;
	private int year;
	private int month;
	private int price;
	
	public Parcel() {
		// TODO Auto-generated constructor stub
	}



	public String getLoc() {
		return loc;
	}



	public void setLoc(String loc) {
		this.loc = loc;
	}



	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



	@Override
	public String toString() {
		return "Parcel [area=" + area + ", loc=" + loc + ", year=" + year + ", month=" + month + ", price=" + price
				+ "]";
	}


	
	
}
