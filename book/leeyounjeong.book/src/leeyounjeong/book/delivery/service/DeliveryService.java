package leeyounjeong.book.delivery.service;

import java.util.List;

import leeyounjeong.book.delivery.domain.Delivery;

public interface DeliveryService {
	List<Delivery> listDeliveries();
	Delivery findDelivery(String deliveryNum);
	boolean join(Delivery delivery);
}
