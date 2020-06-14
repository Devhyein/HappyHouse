package com.ssafy.happyhouse.model.dto;

public class DongArea {
	private double area;
	private String dong;
	private int lampCnt;
	private double size;
	
	public DongArea() {

	}
	
	public DongArea(double area, String dong, int lampCnt, double size) {
		super();
		this.area = area;
		this.dong = dong;
		this.lampCnt = lampCnt;
		this.size = size;
	}
	public double getArea() {
		return area;
	}
	public void setArea(double area) {
		this.area = area;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public int getLampCnt() {
		return lampCnt;
	}
	public void setLampCnt(int lampCnt) {
		this.lampCnt = lampCnt;
	}
	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	@Override
	public String toString() {
		return "DongArea [area=" + area + ", dong=" + dong + ", lampCnt=" + lampCnt + "]";
	}
	
	
}
