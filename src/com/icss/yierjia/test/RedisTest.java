package com.icss.yierjia.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import redis.clients.jedis.Jedis;

public class RedisTest {
	private Jedis jedis;
	
	//D:\Redis-x64-3.2.100
	//redis-server.exe redis.windows.conf
	//redis-cli.exe -h 127.0.0.1 -p 6379
	
	@Before
	public void setup(){
		jedis = new Jedis("127.0.0.1",6379);
	}
	
	@Test
	public void TestRedis(){
		System.out.println(jedis.exists("name"));
		jedis.set("name", "xinxin");
		System.out.println(jedis.exists("name"));
		System.out.println(jedis.get("name"));
		jedis.append("name", "  is my lover");
		System.out.println(jedis.get("name"));
		jedis.del("name");
		System.out.println(jedis.get("name"));
	}
	
	@Test
	public void TestList(){
		//删除
		jedis.del("java");
		//添加
		jedis.lpush("java", "spring");
		jedis.lpush("java", "struts");
		jedis.lpush("java", "hibernate");
		//取出所有数据
		System.out.println(jedis.lrange("java", 0, -1));
		//删除
		jedis.del("java");
		jedis.rpush("java", "spring");
		jedis.rpush("java", "struts");
		jedis.rpush("java", "hibernate");
		//取出所有结果
		System.out.println(jedis.lrange("java", 0, -1));
	}
	
	@Test
	public void TestSet(){
		jedis.del("user");
		//添加
		jedis.sadd("user", "lin");
		jedis.sadd("user", "xin");
		jedis.sadd("user", "zhangsan");
		jedis.sadd("user", "who");
		//移除
		jedis.srem("user", "who");
		//获取所有
		System.out.println(jedis.smembers("user"));
		//是否存在
		System.out.println(jedis.sismember("user","who" ));
		//个数
		System.out.println(jedis.scard("user"));
	}
	
	@Test
	public void TestMap(){
		jedis.del("user");
		//添加数据
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", "xinxin");
		map.put("age", "22");
		map.put("qq", "123456");
		  
        
		//添加
		jedis.hmset("user", map);
		Iterator<String> iter=jedis.hkeys("user").iterator();
		while (iter.hasNext()){  
            String key = iter.next();  
            System.out.println(key+":"+jedis.hmget("user",key));  
        }
		//取出user中的name age
		List<String> rsmap = jedis.hmget("user", "name","age");
		System.out.println(rsmap);
		
		//删除某个键值
		jedis.hdel("user", "age");
		System.out.println(jedis.hmget("user", "age")); //因为删除了，所以返回的是null  
        System.out.println(jedis.hlen("user")); //返回key为user的键中存放的值的个数2 
        System.out.println(jedis.exists("user"));//是否存在key为user的记录 返回true  
        System.out.println(jedis.hkeys("user"));//返回map对象中的所有key  
        System.out.println(jedis.hvals("user"));//返回map对象中的所有value 
   
        while (iter.hasNext()){  
            String key = iter.next();  
            System.out.println(key+":"+jedis.hmget("user",key));  
        }
        
	}
	
	@Test
	public void testSort() throws InterruptedException{
		//先清除数据，再加入数据进行测试  
		jedis.del("a");
        jedis.rpush("a", "1");
        jedis.lpush("a","6");
        jedis.lpush("a","3");
        jedis.lpush("a","9");
        System.out.println(jedis.lrange("a",0,-1));// [9, 3, 6, 1]  
        System.out.println(jedis.sort("a")); //[1, 3, 6, 9]  //输入排序后结果  
    }
	
	@Test
    public void testMap2() {
    	//删除
        jedis.del("shopcar1");
        
        //-----添加数据----------  
        Map<String, String> map = new HashMap<String, String>();
        map.put("1", "良品铺子手撕面包,29.9,1");
        map.put("15", "小米Max2,1699,1");
        map.put("10", "圆领套头卫衣（男）,139.9,10");
        
        //添加
        jedis.hmset("shopcar1",map);
        System.out.println(jedis.exists("shopcar1"));//是否存在
        Iterator<String> iter=jedis.hkeys("shopcar1").iterator();
		while (iter.hasNext()){  
            String key = iter.next();
            System.out.println(key+":"+jedis.hmget("shopcar1",key));  
        }
        //System.out.println(jedis.hgetAll("shopcar1"));
        //判断shopcar1下存储的map中是否含有key为1的
        System.out.println(jedis.hexists("shopcar1", "1"));
        
        //拿出shopcar1下存储的map中key为1的值
        List<String> rsmap = jedis.hmget("shopcar1", "1");
        System.out.println(rsmap);
        
        //设置shopcar1下存储的map中的key为1的值
        jedis.hset("shopcar1", "1", "2");
        
        //拿出shopcar1下存储的map中key为1的值
        List<String> rsmap2 = jedis.hmget("shopcar1", "1");
        System.out.println(rsmap2); 
        
        //拿出shopcar1
        System.out.println(jedis.hgetAll("shopcar1"));
        //删除shopcar1
        jedis.del("shopcar1");
        System.out.println(jedis.hgetAll("shopcar1"));
        
    }
	
	@Test
	public void addShopcart(){
		/*Map<String, String> map=new HashMap<String,String>();
		map.put("3", "辣条,123,456,789");
		jedis.hmset("shopcart"+"2", map);*/
		//System.out.println(jedis.hmget("shopcart2", "3"));
		System.out.println(jedis.exists("shopcart1"));//是否存在
		List<String> list=new ArrayList<String>();
		Iterator<String> ite=jedis.hkeys("shopcart1").iterator();
		while (ite.hasNext()) {
			String key=ite.next();
			list.add(key+","+jedis.hmget("shopcart1",key));
		}
		System.out.println(list.toString());
	}
	
	@Test
	public void findShopcart(){
		List<String> itemArr = jedis.hmget("shopcart2","2");
		String item = itemArr.get(0);
		System.out.println(item);
	}


}
