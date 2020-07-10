package leeyounjeong.book.delivery.service;

import java.util.List;

import leeyounjeong.book.delivery.dao.DeliveryDao;
import leeyounjeong.book.delivery.dao.DeliveryDaoImpl;
import leeyounjeong.book.delivery.domain.Delivery;

public class DeliveryServiceImpl implements DeliveryService{
	private DeliveryDao deliveryDao;
	
	public DeliveryServiceImpl() {
		this.deliveryDao = new DeliveryDaoImpl();
	}
	
	@Override
	public List<Delivery> listDeliveries(){
		return deliveryDao.getDeliveries();
	}
	
	@Override
	public Delivery findDelivery(String deliveryNum){
		return deliveryDao.getDelivery(deliveryNum);
	}
	@Override
	public boolean join(Delivery delivery){
		return deliveryDao.addDelivery(delivery)>0;
	}
	
}
