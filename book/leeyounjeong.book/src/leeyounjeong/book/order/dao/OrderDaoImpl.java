package leeyounjeong.book.order.dao;

import java.util.List;

import leeyounjeong.book.config.Configuration;
import leeyounjeong.book.order.dao.map.OrderMap;
import leeyounjeong.book.order.domain.Order;

public class OrderDaoImpl implements OrderDao{
	private OrderMap orderMapper;
	
	public OrderDaoImpl() {
		this.orderMapper = Configuration.getMapper(OrderMap.class);
	}
	
	@Override
	public List<Order> getOrders(){
		return orderMapper.getOrders();
	}
	
	@Override
	public Order getOrder(String orderNum) {
		return orderMapper.getOrder(orderNum);
	}

	@Override
	public int addOrder(Order order) {
		return orderMapper.addOrder(order);
	}
}
