package com.icss.yierjia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 
 * 数据库连接
 * @author 
 *
 */
public class BaseDao {
	
	protected Connection conn;
	
	
	public void openConnection() throws Exception{
		try {
			if(this.conn == null){
				Class.forName("com.mysql.jdbc.Driver"); 
				conn = DriverManager.getConnection("jdbc:mysql://localhost/yierjia2?useUnicode=true&characterEncoding=utf-8", "root", "CHANGE");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	public void closeConnection() {
		if(this.conn != null ){
			try {
				this.conn.close();	
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}		
	}
	
	/**
	 * 打开事务
	 */
	public void beginTransaction() throws Exception{
		this.openConnection();
		this.conn.setAutoCommit(false);         //开启手动提交事务的模式		
	}
	
	/**
	 * 提交事务
	 * @throws Exception
	 */
	public void commit() throws Exception{		
		if(this.conn != null){			
			this.conn.commit();
		}		
	}
	
	/**
	 * 回滚事务
	 * @throws Exception
	 */
	public void rollback () throws Exception{
		if(this.conn != null){
			this.conn.rollback();
		}
	}

}
 