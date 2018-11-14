package com.icss.yierjia.test;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;





import com.icss.yierjia.dao.BaseDao;

public class DateTest extends BaseDao{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*DateTest dt =new DateTest();
		try {
			dt.openConnection();
			Date date =new Date();
			Timestamp tt=new Timestamp(date.getTime());
			String sql="insert into orders(u_id,s_id,o_date) value(1,1,?)";
			PreparedStatement pst=dt.conn.prepareStatement(sql);
			pst.setTimestamp(1, tt);
			pst.execute();
			pst.close();
			dt.conn.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMddhhmmss");
		String time=df.format(date);
		System.out.println(time);
		
	}

}
