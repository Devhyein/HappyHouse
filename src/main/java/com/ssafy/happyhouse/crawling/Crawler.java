package com.ssafy.happyhouse.crawling;

import java.io.IOException;
import java.util.Arrays;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	private String[] headUrl;
	private String[] headText;
	private String[] contentUrl;
	private String[] contentText;
	private String[] image;
	private int count = 0;
	public Crawler() throws IOException {
		// TODO Auto-generated constructor stub

		NewsCrawling();
	}

	public void NewsCrawling() throws IOException {
		String url = "https://land.naver.com/news/";
		Document rawData = Jsoup.connect(url)
                .timeout(5000)
                .get();
		Elements headlineUrl = rawData.select("li a.headline");
		Elements articleUrl = rawData.select("div.wrap li a:not(.headline)");
		count = 6;
		headUrl = new String[count];
		headText = new String[count];
		contentUrl = new String[count];
		contentText = new String[count];
		image = new String[count];
		for (int i = 0; i < count; i++) {
			headUrl[i] = headlineUrl.get(i).attr("abs:href");
			headText[i] = headlineUrl.get(i).text();
			contentUrl[i] = articleUrl.get(i).attr("abs:href");
			contentText[i] = articleUrl.get(i).text();
			Elements imagedata = Jsoup.connect(headUrl[i])
	                .timeout(5000)
	                .get().select("dt.photo img");
			image[i] = imagedata.get(0).attr("src");
			
		}
//		String url = "https://land.naver.com/news/hotIssue.nhn";
//		Document rawData = Jsoup.connect(url).timeout(10000).get();
//		Elements link = rawData.select("div.hot_list dl.hot_issue dt.photo a" ); 
//		Elements link2 = rawData.select("div.hot_list dl.hot_issue dt:not(.photo) a" ); 
//		Elements link3 = rawData.select("div.hot_list dl.hot_issue dd" ); 
//		String temp = link.get(0).attr("abs:href");
//		String temp2 = link2.get(0).attr("abs:href");
//		String temp3 = link3.get(0).text();
//		
//		System.out.println(temp);
//		System.out.println(temp2);
//		System.out.println(temp3);

	}

	public String[] getHeadUrl() {
		return headUrl;
	}

	public void setHeadUrl(String[] headUrl) {
		this.headUrl = headUrl;
	}

	public String[] getHeadText() {
		return headText;
	}

	public void setHeadText(String[] headText) {
		this.headText = headText;
	}

	public String[] getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String[] contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String[] getContentText() {
		return contentText;
	}

	public void setContentText(String[] contentText) {
		this.contentText = contentText;
	}

	@Override
	public String toString() {
		return "Crawler [headUrl=" + Arrays.toString(headUrl) + ", headText=" + Arrays.toString(headText)
				+ ", contentUrl=" + Arrays.toString(contentUrl) + ", contentText=" + Arrays.toString(contentText) + "]";
	}
	
	public String[] getImage() {
		return image;
	}

	public void setImage(String[] image) {
		this.image = image;
	}

	public static void main(String[] args) throws IOException {
		Crawler c = new Crawler();
	}
}
