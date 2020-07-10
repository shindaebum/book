package leeyounjeong.book.order.domain;

import java.sql.Date;

public class Order {
	private String orderNum; //pk
	private String orderPay;
	private Date orderDate;
	private String orderReq;
	private int orderCnt;
	private String userId;
	private long ISBN;
	private String deliveryNum;
	
	public Order() {}
	
	public int getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(int orderCnt) {
		this.orderCnt = orderCnt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getISBN() {
		return ISBN;
	}

	public void setISBN(long ISBN) {
		this.ISBN = ISBN;
	}

	public Order(String orderNum, String orderPay, Date orderDate, String orderReq,
			int orderCnt, String userId,long ISBN,String deliveryNum) {
		this.orderNum = orderNum;
		this.orderReq = orderReq;
		this.orderPay = orderPay;
		this.orderDate = orderDate;
		this.orderCnt = orderCnt;
		this.userId = userId;
		this.ISBN = ISBN;
		this.deliveryNum = deliveryNum;
	}
	
	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getOrderReq() {
		return orderReq;
	}

	public void setOrderReq(String orderReq) {
		this.orderReq = orderReq;
	}

	public String getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(String orderPay) {
		this.orderPay = orderPay;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public String getDeliveryNum() {
		return deliveryNum;
	}

	public void setDeliveryNum(String deliveryNum) {
		this.deliveryNum = deliveryNum;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String toString() {
		return String.format("%s %s %s %s %d %s %s %s\n", orderNum, orderReq, orderPay, orderDate, orderCnt, userId, ISBN, deliveryNum);		
	}
}
