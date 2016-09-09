package com.dto;

import java.util.List;

public class PageDTO {

	private List<BoardDTO> list;
	private List<CartDTO> list1;
	private int curPage;  //현재 페이지
	private int perPage=4;   //페이지당 보여줄 갯수
	private int totalRecord;  // 전체 레코드 갯수
	
	public PageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<BoardDTO> getList() {
		return list;
	}

	public void setList(List<BoardDTO> list) {
		this.list = list;
	}

	public List<CartDTO> getList1() {
		return list1;
	}

	public void setList1(List<CartDTO> list1) {
		this.list1 = list1;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", list1=" + list1 + ", curPage=" + curPage + ", perPage=" + perPage
				+ ", totalRecord=" + totalRecord + "]";
	}
	
	
	
	
	
	
}
