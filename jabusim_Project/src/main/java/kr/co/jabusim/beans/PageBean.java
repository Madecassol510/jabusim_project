package kr.co.jabusim.beans;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageBean {
		// 최소 페이지 번호
	   private int min;
	   // 최대 페이지 번호
	   private int max;
	   // 이전 버튼의 페이지 번호
	   private int prevPage;
	   // 다음 버튼의 페이지 번호
	   private int nextPage;
	   // 전체 페이지 개수
	   private int pageCnt;
	   // 현재 페이지 번호
	   private int currentPage;
	   
	   //contentCnt: 전체글 갯수(오라클 table), currentPage:현재글번호(param), contentPageCnt:페이지당 글의 갯수(property), paginationCnt: 페이지 버튼의 갯수
	   public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		   //현재 페이지 번호
		   this.currentPage = currentPage;
		   
		   //전체 페이지 갯수
		   pageCnt = contentCnt/contentPageCnt; //count(*)/10 + 나머지
		   
		   if(contentCnt%contentPageCnt > 0) {
			   pageCnt++;
		   }
			/* 1~10 : 1최소, 10최대 
			 * 최대 10이므로 결국 최소에 9를 더한거와 같다
			 * 0~9 : 1, 10~19 :11, ...*/
		   
			  /*
				0 : 1/10 * 10 => 0 + 1 => 1
				1 : 11/10 *10 => 1 + 1 => 2
			   */
		   min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		   max = min + paginationCnt - 1;
		   
		   if(max>pageCnt) {
			   max=pageCnt;
		   }
		   
		   prevPage= min-1;
		   nextPage= max+1;
		   
		   if(nextPage>pageCnt) {
			   nextPage=pageCnt;
		   }
		   
	   }
}
