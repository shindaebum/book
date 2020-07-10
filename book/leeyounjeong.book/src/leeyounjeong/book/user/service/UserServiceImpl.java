package leeyounjeong.book.user.service;

import java.util.List;

import leeyounjeong.book.user.dao.UserDao;
import leeyounjeong.book.user.dao.UserDaoImpl;
import leeyounjeong.book.user.domain.User;

public class UserServiceImpl implements UserService{
	private UserDao userDao;
	
	public UserServiceImpl() {
		this.userDao = new UserDaoImpl();
	}
	
	@Override
	public List<User> listUsers(){
		return userDao.getUsers();
	}
	
	@Override
	public List<User> listUserIds(){
		return userDao.getUserIds();
	}
	
	@Override
	public User findUser(String userId) {
		return userDao.getUser(userId);
	}
	
	@Override
	public boolean join(User user) {
		return userDao.addUser(user)>0;
	}
	
	@Override
	public boolean correctUser(User user) {
		return userDao.updateUser(user)>0;
	}
	
	@Override
	public boolean secede(String userId) {
		return userDao.delUser(userId)>0;
	}
}