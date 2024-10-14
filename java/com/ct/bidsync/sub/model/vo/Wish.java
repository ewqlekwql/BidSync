package com.ct.bidsync.sub.model.vo;

public class Wish {
	// 매개변수
	private int wishNo;
	private String userId;
	private int boardNo;
	private String boardTitle;
	private String prodImg;
	private int price;
	private String status;
	
	// 기본 생성자
	public Wish() {
		super();
	}

	public Wish(int wishNo, String userId, int boardNo, String boardTitle, String prodImg, int price, String status) {
		super();
		this.wishNo = wishNo;
		this.userId = userId;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.prodImg = prodImg;
		this.price = price;
		this.status = status;
	}

	// toString
	@Override
	public String toString() {
		return "Wish [wishNo=" + wishNo + ", userId=" + userId + ", boardNo=" + boardNo + ", boardTitle=" + boardTitle
				+ ", prodImg=" + prodImg + ", price=" + price + ", status=" + status + "]";
	}

	// setter, getter
	public int getWishNo() {
		return wishNo;
	}

	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
