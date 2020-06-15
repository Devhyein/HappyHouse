package com.ssafy.happyhouse.crawling;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.ssafy.happyhouse.model.dto.LatestParcel;
import com.ssafy.happyhouse.model.dto.NewsData;

public class Crawler {
	List<LatestParcel> plist;
	List<NewsData> nlist;
	private int count = 0;
	public Crawler() throws IOException {
		// TODO Auto-generated constructor stub
	}

	public List<NewsData> getNewsData() throws IOException {
		nlist = new ArrayList<NewsData>();
		String url = "https://land.naver.com/news/";
		Document rawData = Jsoup.connect(url)
                .timeout(5000)
                .get();
		Elements headlineUrl = rawData.select("li a.headline");
		Elements articleUrl = rawData.select("div.wrap li a:not(.headline)");
		count = 6;
		for (int i = 0; i < count; i++) {
			String headUrl = headlineUrl.get(i).attr("abs:href");
			String headText = headlineUrl.get(i).text();
			String contentUrl = articleUrl.get(i).attr("abs:href");
			String contentText = articleUrl.get(i).text();
			Elements imagedata = Jsoup.connect(headUrl)
	                .timeout(5000)
	                .get().select("dt.photo img");
			String image = imagedata.get(0).attr("src");
			nlist.add(new NewsData(headUrl, headText, contentUrl, contentText, image));
			System.out.println(nlist.get(i));
		}
		return nlist;
	}

	public List<LatestParcel> getParcel() throws IOException {
		plist = new ArrayList<LatestParcel>();
		String url = "https://www.boonyang24.com/?sub=boonyang_info/info_list";
		Document rawData = Jsoup.connect(url)
                .timeout(10000)
                .get();
		Elements parceldata1 = rawData.select("div.list_type_boonyang table tbody tr td span");
		Elements parceldata2 = rawData.select("div.list_type_boonyang table tbody tr td p");
		Elements parceldata4 = rawData.select("div.list_type_boonyang table tbody tr td strong");
		int count = parceldata4.size();
		for (int i = 0; i < count; i++) {
			String ptype = parceldata2.get(1+i*6).text();
			String pname = parceldata4.get(i).text();
			String location = parceldata1.get(i*2+1).text();
			String capacity = parceldata2.get(3+i*6).text();
			String ptime = parceldata2.get(4+i*6).text();
			String ltime = 	parceldata2.get(5+i*6).text();
			String price = parceldata2.get(2+i*6).text();
			plist.add(new LatestParcel(ptype,pname,location, price,
			 capacity, ptime, ltime));
			System.out.println(plist.get(i));
		}
		return plist;
	}
	public static void main(String[] args) throws IOException {
		Crawler c = new Crawler();
		c.getParcel();
		c.getNewsData();
	}
}
