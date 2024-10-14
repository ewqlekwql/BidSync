package com.ct.bidsync.order.model.vo;

import java.sql.Date;

public class Order {
	// 매개변수
	private int orderNo;
	private String userId;
	private int boardNo;
	private String boardTitle;
	private String boardType;
	private String prodImg;
	private int price;
	private int stock;
	private int total;
	private String seller;
	private Date orderDate;
	private Date updateDate;
	private String status;
	private String statusDetail;
	
	// 기본 생성자
	public Order() {
		super();
	}

	public Order(int orderNo, String userId, int boardNo, String boardTitle, String boardType, String prodImg,
			int price, int stock, int total, String seller, Date orderDate, Date updateDate, String status,
			String statusDetail) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardType = boardType;
		this.prodImg = prodImg;
		this.price = price;
		this.stock = stock;
		this.total = total;
		this.seller = seller;
		this.orderDate = orderDate;
		this.updateDate = updateDate;
		this.status = status;
		this.statusDetail = statusDetail;
	}

	// toString
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", userId=" + userId + ", boardNo=" + boardNo + ", boardTitle="
				+ boardTitle + ", boardType=" + boardType + ", prodImg=" + prodImg + ", price=" + price + ", stock="
				+ stock + ", total=" + total + ", seller=" + seller + ", orderDate=" + orderDate + ", updateDate="
				+ updateDate + ", status=" + status + ", statusDetail=" + statusDetail + "]";
	}

	// setter, getter
	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatusDetail() {
		return statusDetail;
	}

	public void setStatusDetail(String statusDetail) {
		this.statusDetail = statusDetail;
	}
}
