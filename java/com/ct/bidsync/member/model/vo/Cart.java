package com.ct.bidsync.member.model.vo;

import java.sql.Date;

public class Cart {
	// 매개변수
	private int cartNo;
	private String userId;
	private int boardNo;
	private String boardTitle;
	private String prodImg;
	private int price;
	private int stock;
	private Date putDate;
	private String status;
	
	// 기본 생성자
	public Cart() {
		super();
	}

	public Cart(int cartNo, String userId, int boardNo, String boardTitle, String prodImg, int price, int stock,
			Date putDate, String status) {
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.prodImg = prodImg;
		this.price = price;
		this.stock = stock;
		this.putDate = putDate;
		this.status = status;
	}

	// toString
	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", userId=" + userId + ", boardNo=" + boardNo + ", boardTitle=" + boardTitle
				+ ", prodImg=" + prodImg + ", price=" + price + ", stock=" + stock + ", putDate=" + putDate
				+ ", status=" + status + "]";
	}

	// setter, getter
	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
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

	public Date getPutDate() {
		return putDate;
	}

	public void setPutDate(Date putDate) {
		this.putDate = putDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
