package com.ssafy.happyhouse.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * 클래스를 메모리에 로딩시키는 방법 
 * 1. 객체 생성    		=> JVM에서 사용하는 ClassLoader를 이용해서 클래스를 로딩 
 * 2. static에 접근      => JVM에서 사용하는 ClassLoader를 이용해서 클래스를 로딩
 * 3. Class.forName("패지키를 포함한 클래스이름"); => JVM에서 사용하는 ClassLoader를 이용해서 클래스를 로딩
 * 3. ClassLoader를 통해 직접 로딩. 
 */
public class DBUtil {
	
	public static Connection getConnection() throws SQLException {
		DataSource dataSource = null;
		
		try {
			Context iCtx = new InitialContext();
			Context ctx = (Context) iCtx.lookup("java:comp/env");
			dataSource = (DataSource) ctx.lookup("jdbc/ssafy");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		
		return dataSource.getConnection();
	}
	
	
	public static void close(AutoCloseable c) {
		if (c != null) {
			try {
				c.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}










