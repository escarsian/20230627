package com.yedam.common;

import lombok.Data;

@Data
//전체 건수를 기준으로 페이지 계산하는 클래스.
public class PageDTO {

	private int startPage, endPage; //	  1p  3p  10p / 11p  13p  20p
	private boolean prev, next; 
	
	private int total;
	private int curPage;
	
	public PageDTO(int curPage, int total) {
		this.curPage = curPage;
		this.total = total;
		//ex 160건.
		this.endPage = (int) Math.ceil((double)curPage/10) * 10 ;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((double) total/10));
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		this.next = this.endPage < realEnd;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", curPage=" + curPage + "]";
	}
	
	
}
