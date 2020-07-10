package leeyounjeong.book.order.service;

import java.util.List;

import leeyounjeong.book.order.domain.Order;

public interface OrderService {
	List<Order> listOrders();
	Order findOrder(String orderNum);
	boolean join(Order order);
}
