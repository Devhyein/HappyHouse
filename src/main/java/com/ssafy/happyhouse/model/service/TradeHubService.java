package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.TradeHub;

public interface TradeHubService {
	public List<TradeHub> findShopByDongName(String dongName) throws Exception;
	
	public List<TradeHub> findShopByCategory(String bigCategoryName) throws Exception;
	
	public List<String> showShopCategorys() throws Exception;
	
	public List<String> showShopDongNames() throws Exception;
	
	public List<TradeHub> loadAllShops() throws Exception;
}
