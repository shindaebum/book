package leeyounjeong.book.user.dao;

import java.util.List;

import leeyounjeong.book.config.Configuration;
import leeyounjeong.book.user.dao.map.UserMap;
import leeyounjeong.book.user.domain.User;

public class UserDaoImpl implements UserDao{
	private UserMap userMapper;
	
	public UserDaoImpl() {
		this.userMapper = Configuration.getMapper(UserMap.class);
	}
	
	@Override
	public List<User> getUsers(){
		return userMapper.getUsers();
	}
	
	@Override
	public List<User> getUserIds(){
		return userMapper.getUserIds();
	}
	
	@Override
	public User getUser(String userId) {
		return userMapper.getUser(userId);
	}
	
	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}
	
	@Override
	public int updateUser(User user) {
		return userMapper.updateUser(user);
	}
	
	@Override
	public int delUser(String userId) {
		return userMapper.delUser(userId);
	}
}