package com.ct.bidsync.board.model.vo;

public class Board {
	// 매개변수
	private int prodNo;
	private String prodId;
	private String prodName;
	private int price;
	private int bid;
	private int stock;
	private String type;
	private String option;
	private String seller;
	private String status;
	
	// 기본 생성자
	public Board() {
		super();
	}

	public Board(int prodNo, String prodId, String prodName, int price, int bid, int stock, String type, String option,
			String seller, String status) {
		super();
		this.prodNo = prodNo;
		this.prodId = prodId;
		this.prodName = prodName;
		this.price = price;
		this.bid = bid;
		this.stock = stock;
		this.type = type;
		this.option = option;
		this.seller = seller;
		this.status = status;
	}

	// toString
	@Override
	public String toString() {
		return "Board [prodNo=" + prodNo + ", prodId=" + prodId + ", prodName=" + prodName + ", price=" + price
				+ ", bid=" + bid + ", stock=" + stock + ", type=" + type + ", option=" + option + ", seller=" + seller
				+ ", status=" + status + "]";
	}

	// getter, setter
	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
