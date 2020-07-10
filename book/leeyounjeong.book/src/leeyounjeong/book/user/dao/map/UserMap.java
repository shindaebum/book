package leeyounjeong.book.user.dao.map;

import java.util.List;

import leeyounjeong.book.user.domain.User;

public interface UserMap {
	List<User> getUsers();
	List<User> getUserIds();
	User getUser(String userId);
	int addUser(User user);
	int updateUser(User user);
	int delUser(String userId);
}
