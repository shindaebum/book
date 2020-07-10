package leeyounjeong.book.order.dao.map;

import java.util.List;

import leeyounjeong.book.order.domain.Order;

public interface OrderMap {
	List<Order> getOrders();
	Order getOrder(String orderNum);
	int addOrder(Order order);
}
