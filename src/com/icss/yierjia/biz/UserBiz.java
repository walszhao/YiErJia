package com.icss.yierjia.biz;




import java.util.List;

import com.icss.yierjia.dao.UserDao;
import com.icss.yierjia.entity.User;
import com.icss.yierjia.util.PageResult;

public class UserBiz {
	/**
	 * 根据用户名或email或手机号以及密码进行登录的方法
	 * @param username
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public User findUserByIdAndPwd(String username,String pwd) throws Exception{
		User user=null;
		UserDao ud=new UserDao();
		try {
			user=ud.findUserByIdAndPwd(username, pwd);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
		return user;
	}
	/**
	 * 根据输入的内容是email或者phone添加用户
	 * @param username
	 * @param email
	 * @param phone
	 * @param pwd
	 * @throws Exception
	 */
	public void addUser(String username,String email,String phone,String pwd) throws Exception{
		UserDao ud=new UserDao();
		try {
			if (email==null) {
				ud.addUserWithPhone(phone, username, pwd);
			}else if (phone==null) {
				ud.addUserWithEmail(email, username, pwd);
			}
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
		
	}
	/**
	 * 注册验证：用户名是否存在
	 * @return
	 * @throws Exception 
	 */
	public boolean checkUsername(String username) throws Exception{
		boolean flag=false;
		UserDao ud=new UserDao();
		try {
			flag=ud.checkUsername(username);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
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
		UserDao ud=new UserDao();
		try {
			flag=ud.checkUsername(email);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
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
		UserDao ud=new UserDao();
		try {
			flag=ud.checkUsername(phone);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
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
		UserDao ud=new UserDao();
		try {
			ud.saveUserInfo(uid, urealname, uphone, uemail);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
	}
	/**
	 * 保存用户头像
	 * @param uid
	 * @param img
	 * @throws Exception
	 */
	public void saveUserImg(int uid,String img) throws Exception{
		UserDao dao = new UserDao();
		try {
			dao.updateImg(uid, img);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
	}
	/**
	 * 修改密码的方法
	 * @param uid
	 * @param newPwd
	 * @throws Exception 
	 */
	public void changePwd(int uid,String newPwd) throws Exception {
		UserDao ud=new UserDao();
		try {
			ud.changePwd(uid, newPwd);
		} catch (Exception e) {
			throw e;
		}finally{
			 ud.closeConnection();
		}
	}
	
	/**
	 * 添加验证码
	 * @param uid
	 * @param checkCode
	 * @throws Exception
	 */
	public void addCheckCode(int uid,int checkCode) throws Exception{
		UserDao dao = new UserDao();
		try {
			dao.updateCheckCode(uid,checkCode);
		} catch (Exception e) {
			throw e;
		}finally{
			dao.closeConnection();
		}
	}
	
	/**
	 * 查找验证码
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public int findCheckCode(int uid) throws Exception{
		int checkCode = 0;
		UserDao dao = new UserDao();
		try {
			checkCode = dao.selectCheckCode(uid);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		return checkCode;
	}
	
	/**
	 * 修改邮箱
	 * @param uid
	 * @param email
	 * @throws Exception
	 */
	public void changeEmail(int uid,String email) throws Exception {
		UserDao dao = new UserDao();
		try {
			dao.updateEmail(uid,email);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		
	}
	
	/**
	 * 根据id查找用户
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	public User findByUid(int uid) throws Exception {
		User user = null;
		UserDao dao = new UserDao();
		try {
			user = dao.selectByUid(uid);
		} catch (Exception e) {
			throw e;
		} finally{
			dao.closeConnection();
		}
		return user;
	}
	
	/**
	 * 查询所有用户并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void userList(PageResult<User> pr,int pageMax) throws Exception{
		UserDao ud=new UserDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<User> list=ud.userList(start,pageMax);
			pr.setList(list);
			
			//获取总条数
			int totalCount=ud.getCount();
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
	}
	/**
	 * 根据状态查询用户并分页显示
	 * @return
	 * @throws Exception 
	 */
	public void userStateList(PageResult<User> pr,int pageMax,String ustate) throws Exception{
		UserDao ud=new UserDao();
		try {
			//获取当前页
			int currentPage=pr.getCurrentPage();
			//计算起始条数
			int start = (currentPage-1)*pageMax;
			//获取分页列表
			List<User> list=ud.userStateList(start,pageMax,ustate);
			pr.setList(list);
			
			//获取总条数
			int totalCount=ud.getStateCount(ustate);
			pr.setTotalCount(totalCount);
			
			//计算总页数
			int totalPage=totalCount%pageMax==0?totalCount/pageMax:totalCount/pageMax+1;
			pr.setTotalPage(totalPage);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
	}
	
	/**
	 * 根据状态查找用户列表
	 * @param state
	 * @return
	 * @throws Exception
	 */
	public List<User> findUsersByState(String state) throws Exception {
		List<User> list = null;
		UserDao dao = new UserDao();
		try {
			if (state.equals("2")) {
				list = dao.selectAllUsers();
			}else {
				list = dao.selectAllUsersByState(state);
			}
			
		} catch (Exception e) {
			throw e;
		}finally{
			dao.closeConnection();
		}
		return list;
	}
	
	/**
	 * 更改指定用户状态
	 * @param uid
	 * @param state
	 * @throws Exception 
	 */
	public void changeUserState(int uid,String state) throws Exception{
		UserDao ud=new UserDao();
		try {
			ud.changeUserState(uid, state);
		} catch (Exception e) {
			throw e;
		}finally{
			ud.closeConnection();
		}
	}
	
}
