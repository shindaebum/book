package leeyounjeong.book.delivery.domain;

public class Delivery {
	private String deliveryNum;
	
	public Delivery() {}
	
	public Delivery(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public String getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}
	
	public String toString() {
		return String.format(" %s\n", deliveryNum);
	}
}
