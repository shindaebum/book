package leeyounjeong.book.delivery.dao.map;

import java.util.List;

import leeyounjeong.book.delivery.domain.Delivery;

public interface DeliveryMap {
	List<Delivery> getDeliveries();
	Delivery getDelivery(String deliveryNum);
	int addDelivery(Delivery delivery);
}
