package leeyounjeong.book.user.service;

import java.util.List;

import leeyounjeong.book.user.domain.User;

public interface UserService {
	List<User> listUsers();
	List<User> listUserIds();
	User findUser(String userId);
	boolean join(User user);
	boolean correctUser(User user);
	boolean secede(String userId);
}
