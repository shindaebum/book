package leeyounjeong.book.delivery.dao;

import java.util.List;

import leeyounjeong.book.delivery.domain.Delivery;

public interface DeliveryDao {
	List<Delivery> getDeliveries();
	Delivery getDelivery(String deliveryNum);
	int addDelivery(Delivery delivery);
}
