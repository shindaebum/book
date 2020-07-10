package leeyounjeong.book.delivery.dao;

import java.util.List;

import leeyounjeong.book.config.Configuration;
import leeyounjeong.book.delivery.dao.map.DeliveryMap;
import leeyounjeong.book.delivery.domain.Delivery;

public class DeliveryDaoImpl implements DeliveryDao{
	private DeliveryMap deliveryMapper;
	
	public DeliveryDaoImpl() {
		this.deliveryMapper = Configuration.getMapper(DeliveryMap.class);
	}
	
	@Override
	public List<Delivery> getDeliveries(){
		return deliveryMapper.getDeliveries();
	}
	
	@Override
	public Delivery getDelivery(String deliveryNum){
		return deliveryMapper.getDelivery(deliveryNum);
	}
	@Override
	public int addDelivery(Delivery delivery){
		return deliveryMapper.addDelivery(delivery);
	}
}
