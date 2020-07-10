package leeyounjeong.book.order.service;

import java.util.List;

import leeyounjeong.book.order.dao.OrderDao;
import leeyounjeong.book.order.dao.OrderDaoImpl;
import leeyounjeong.book.order.domain.Order;

public class OrderServiceImpl implements OrderService{
	private OrderDao orderDao;
	
	public OrderServiceImpl() {
		this.orderDao = new OrderDaoImpl();
	}
	
	@Override
	public List<Order> listOrders(){
		return orderDao.getOrders();
	}
	
	@Override
	public Order findOrder(String orderNum){
		return orderDao.getOrder(orderNum);
	}
	
	@Override
	public boolean join(Order order){
		return orderDao.addOrder(order)>0;
	}
}
