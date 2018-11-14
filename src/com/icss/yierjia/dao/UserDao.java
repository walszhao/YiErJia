package com.icss.yierjia.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.icss.yierjia.entity.User;

public class UserDao  extends BaseDao{
	/**
	 * 根据用户名或email或手机号以及密码进行登录的方法
	 * @param username
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public User findUserByIdAndPwd(String username,String pwd) throws Exception{
		User user=null;
		this.openConnection();
		String sql="select * from user where (u_username=? or u_email=? or u_phone=?) and u_pwd=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, username);
		pst.setString(3, username);
		pst.setString(4, pwd);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
		}
		pst.close();
		rs.close();
		return user;
	}
	/**
	 * 添加用户并添加手机号
	 * @param phone
	 * @param username
	 * @param pwd
	 * @throws Exception
	 */
	public void addUserWithPhone(String phone,String username,String pwd) throws Exception{
		this.openConnection();
		String sql="insert into user(u_username,u_phone,u_pwd) value(?,?,?)";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, phone);
		pst.setString(3, pwd);
		pst.execute();
		pst.close();
		}

	/**
	 * 添加用户并添加电子邮箱
	 * @param email
	 * @param username
	 * @param pwd
	 * @throws Exception
	 */
	public void addUserWithEmail(String email,String username,String pwd) throws Exception{
		this.openConnection();
		String sql="insert into user(u_username,u_email,u_pwd) value(?,?,?)";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, email);
		pst.setString(3, pwd);
		pst.execute();
		pst.close();
	}
	/**
	 * 注册验证：用户名是否存在
	 * @return
	 * @throws Exception 
	 */
	public boolean checkUsername(String username) throws Exception{
		boolean flag=false;
		this.openConnection();
		String sql="select * from user where u_username=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, username);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			flag=true;
		}
		return flag;
	}
	/**
	 * 注册验证：电子邮箱是否存在
	 * @return
	 * @throws Exception 
	 */
	public boolean checkEmail(String email) throws Exception{
		boolean flag=false;
		this.openConnection();
		String sql="select * from user where u_email=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, email);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			flag=true;
		}
		return flag;
	}
	/**
	 * 注册验证：电话号码是否存在
	 * @return
	 * @throws Exception 
	 */
	public boolean checkPhone(String phone) throws Exception{
		boolean flag=false;
		this.openConnection();
		String sql="select * from user where u_phone=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, phone);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			flag=true;
		}
		return flag;
	}
	
	/**
	 * 修改用户信息保存
	 * @param uid
	 * @param urealname
	 * @param uphone
	 * @param uemail
	 * @throws Exception 
	 */
	public void saveUserInfo(int uid,String urealname,String uphone,String uemail) throws Exception {
		this.openConnection();
		String sql="update user set u_realname=?,u_phone=?,u_email=? where u_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, urealname);
		pst.setString(2, uphone);
		pst.setString(3, uemail);
		pst.setInt(4, uid);
		pst.execute();
		pst.close();
	}
	/**
	 * 耿勋图片信息
	 * @param uid
	 * @param img
	 * @throws Exception
	 */
	public void updateImg(int uid,String img) throws Exception{
		openConnection();
		String sql = "update user set u_img=? where u_id=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, img);
		pst.setInt(2, uid);
		pst.execute();
		pst.close();
	}
	
	/**
	 * 修改密码的方法
	 * @param uid
	 * @param newPwd
	 * @throws Exception 
	 */
	public void changePwd(int uid,String newPwd) throws Exception {
		this.openConnection();
		String sql="update user set u_pwd=? where u_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, newPwd);
		pst.setInt(2, uid);
		pst.execute();
		pst.close();
	}
	
	/**
	 * 添加验证码
	 * @param uid
	 * @param checkCode
	 * @throws Exception
	 */
	public void updateCheckCode(int uid, int checkCode) throws Exception {
		this.openConnection();
		String sql = "update user set u_code=? where u_id=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, checkCode);
		pst.setInt(2, uid);
		pst.execute();
		pst.close();
		
	}
	
	/**
	 * 查找验证码
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public int selectCheckCode(int uid) throws Exception{
		int checkCode = 0;
		openConnection();
		String sql = "select u_code from user where u_id=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setInt(1, uid);
		ResultSet rs = pst.executeQuery();
		if(rs.next()){
			checkCode = rs.getInt(1);
		}
		rs.close();
		pst.close();
		return checkCode;
	}
	
	/**
	 * 更新Email
	 * @param uid
	 * @param email
	 * @throws Exception
	 */
	public void updateEmail(int uid,String email) throws Exception {
		openConnection();
		String sql = "update user set u_email=? where u_id=?";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, email);
		pst.setInt(2, uid);
		pst.execute();
		pst.close();
	}
	
	/**
	 * 根据id查找用户
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public User selectByUid(int uid) throws Exception {
		User user=null;
		this.openConnection();
		String sql="select * from user where u_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, uid);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
		}
		pst.close();
		rs.close();
		return user;
	}
	
	/**
	 * 管理员数量
	 * @return
	 * @throws Exception
	 */
	public int selectAdminCount() throws Exception {
		openConnection();
		int count = 0;
		String sql = "select count(*) from user where u_role=1";
		PreparedStatement pst = conn.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		pst.close();
		return count;
	}
	
	
	/**
	 * 管理员登录验证
	 * @param username
	 * @param pwd
	 * @return
	 * @throws Exception 
	 */
	public User selectUserByUsernameWhithRole(String username,String pwd) throws Exception{
		User user=new User();
		this.openConnection();
		String sql="select * from user where u_username=? and u_pwd=? and u_role=1";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, username);
		pst.setString(2, pwd);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
		}
		rs.close();
		pst.close();
		return user;
	}
	
	/**
	 * 查询所有用户并分页显示
	 * @return
	 * @throws Exception 
	 */
	public List<User> userList(int start,int pageMax) throws Exception{
		List<User> list=new ArrayList<User>();
		this.openConnection();
		String sql="select * from user where u_role=0 limit ?,?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setInt(1, start);
		pst.setInt(2, pageMax);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			User user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
			list.add(user);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取所有用户条数
	 * @return
	 * @throws Exception
	 */
	public int getCount() throws Exception{
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from user where u_role=0";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		return totalCount;
	}
	
	/**
	 * 查询指定状态用户并分页显示
	 * @return
	 * @throws Exception 
	 */
	public List<User> userStateList(int start,int pageMax,String state) throws Exception{
		List<User> list=new ArrayList<User>();
		this.openConnection();
		String sql="select * from user where u_state=? and u_role=0 limit ?,?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		pst.setInt(2, start);
		pst.setInt(3, pageMax);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			User user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
			list.add(user);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 获取指定状态用户条数
	 * @return
	 * @throws Exception
	 */
	public int getStateCount(String state) throws Exception{
		int totalCount=0;
		this.openConnection();
		String sql="select count(*) from user where u_state=? and u_role=0";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		ResultSet rs=pst.executeQuery();
		if (rs.next()) {
			totalCount=rs.getInt(1);
		}
		return totalCount;
	}
	
	/**
	 * 查询所有用户
	 * @return
	 * @throws Exception 
	 */
	public List<User> selectAllUsers() throws Exception{
		List<User> list=new ArrayList<User>();
		this.openConnection();
		String sql="select * from user where u_role=0";
		PreparedStatement pst=conn.prepareStatement(sql);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			User user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
			list.add(user);
		}
		rs.close();
		pst.close();
		return list;
	}
	/**
	 * 查询指定状态用户
	 * @return
	 * @throws Exception 
	 */
	public List<User> selectAllUsersByState(String state) throws Exception{
		List<User> list=new ArrayList<User>();
		this.openConnection();
		String sql="select * from user where u_state=? and u_role=0";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		ResultSet rs=pst.executeQuery();
		while (rs.next()) {
			User user=new User();
			user.setUid(rs.getInt("u_id"));
			user.setUusername(rs.getString("u_username"));
			user.setUemail(rs.getString("u_email"));
			user.setUphone(rs.getString("u_phone"));
			user.setUpwd(rs.getString("u_pwd"));
			user.setUrealname(rs.getString("u_realname"));
			user.setUaddress(rs.getString("u_address"));
			user.setUbalance(rs.getDouble("u_balance"));
			user.setUrole(rs.getString("u_role"));
			user.setUstate(rs.getString("u_state"));
			user.setUcode(rs.getString("u_code"));
			user.setUimg(rs.getString("u_img"));
			user.setUpaypwd(rs.getString("u_paypwd"));
			list.add(user);
		}
		rs.close();
		pst.close();
		return list;
	}
	
	/**
	 * 更改指定用户状态
	 * @param uid
	 * @param state
	 * @throws Exception 
	 */
	public void changeUserState(int uid,String state) throws Exception{
		this.openConnection();
		String sql="update user set u_state=? where u_id=?";
		PreparedStatement pst=conn.prepareStatement(sql);
		pst.setString(1, state);
		pst.setInt(2, uid);
		pst.execute();
		pst.close();
	}
}
