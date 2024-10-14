package com.ct.bidsync.board.model.vo;

import java.sql.Date;

public class Board {
	// 매개변수
	private int boardNo;
	private String boardTitle;
	private String boardType;
	private String boardCtg;
	private String boardContent;
	private String prodImg;
	private int price;
	private int bidPrice;
	private int auctioneer;
	private int stock;
	private String seller;
	private Date registerDate;
	private Date endDate;
	private String status;
	
	// 기본 생성자
	public Board() {
		super();
	}

	public Board(int boardNo, String boardTitle, String boardType, String boardCtg, String boardContent, String prodImg,
			int price, int bidPrice, int auctioneer, int stock, String seller, Date registerDate, Date endDate,
			String status) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardType = boardType;
		this.boardCtg = boardCtg;
		this.boardContent = boardContent;
		this.prodImg = prodImg;
		this.price = price;
		this.bidPrice = bidPrice;
		this.auctioneer = auctioneer;
		this.stock = stock;
		this.seller = seller;
		this.registerDate = registerDate;
		this.endDate = endDate;
		this.status = status;
	}

	// toString
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardType=" + boardType + ", boardCtg="
				+ boardCtg + ", boardContent=" + boardContent + ", prodImg=" + prodImg + ", price=" + price
				+ ", bidPrice=" + bidPrice + ", auctioneer=" + auctioneer + ", stock=" + stock + ", seller=" + seller
				+ ", registerDate=" + registerDate + ", endDate=" + endDate + ", status=" + status + "]";
	}

	// setter, getter
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

	public String getBoardCtg() {
		return boardCtg;
	}

	public void setBoardCtg(String boardCtg) {
		this.boardCtg = boardCtg;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
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

	public int getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(int bidPrice) {
		this.bidPrice = bidPrice;
	}
	
	public int getAuctioneer() {
		return auctioneer;
	}

	public void setAuctioneer(int auctioneer) {
		this.auctioneer = auctioneer;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}	
}
