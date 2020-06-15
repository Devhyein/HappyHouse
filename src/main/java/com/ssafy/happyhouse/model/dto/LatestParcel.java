package com.ssafy.happyhouse.model.dto;

public class LatestParcel {
	/**
	 * 분양종류 ptype 사업명 pname 위치 location 면적 area 가격 price 세대수 capacity 분양시기 ptime
	 * 입주시기 ltime
	 */
	private int no;
	private String ptype;
	private String pname;
	private String location;
	private String price;
	private String capacity;
	private String ptime;
	private String ltime;

	public LatestParcel() {
		// TODO Auto-generated constructor stub
	}

	public LatestParcel(int no, String ptype, String pname, String location, String price, String capacity,
			String ptime, String ltime) {
		super();
		this.no = no;
		this.ptype = ptype;
		this.pname = pname;
		this.location = location;
		this.price = price;
		this.capacity = capacity;
		this.ptime = ptime;
		this.ltime = ltime;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCapacity() {
		return capacity;
	}

	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}

	public String getPtime() {
		return ptime;
	}

	public void setPtime(String ptime) {
		this.ptime = ptime;
	}

	public String getLtime() {
		return ltime;
	}

	public void setLtime(String ltime) {
		this.ltime = ltime;
	}

	@Override
	public String toString() {
		return "LatestParcel [no=" + no + ", ptype=" + ptype + ", pname=" + pname + ", location=" + location
				+ ", price=" + price + ", capacity=" + capacity + ", ptime=" + ptime + ", ltime=" + ltime + "]";
	}

}
