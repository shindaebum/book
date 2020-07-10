package leeyounjeong.book.order.dao;

import java.util.List;

import leeyounjeong.book.order.domain.Order;

public interface OrderDao {
	List<Order> getOrders();
	Order getOrder(String orderNum);
	int addOrder(Order order);
}
