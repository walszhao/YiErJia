package com.icss.yierjia.dao;

import redis.clients.jedis.Jedis;

public class RedisDao {
	
	protected Jedis jedis;
	
	public void openRedis(){
		if (jedis == null) {
			jedis=new Jedis("127.0.0.1", 6379);
		}
	}
}
