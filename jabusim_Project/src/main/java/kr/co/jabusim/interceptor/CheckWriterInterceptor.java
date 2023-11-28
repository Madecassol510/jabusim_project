package kr.co.jabusim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.jabusim.beans.ContentBean;
import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor{
	/*
	private UserBean loginUserBean;
	private BoardService boardService;
	//자동주입이 안되므로 생성자를 통하여 구현
	public CheckWriterInterceptor(UserBean loginUserBean, BoardService boardService) {
		// TODO Auto-generated constructor stub
		this.loginUserBean = loginUserBean;
		this.boardService = boardService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//read.jsp에서 주입된 content_idx가져오기 
		String str1 = request.getParameter("content_idx");
		int content_idx = Integer.parseInt(str1); //형변환

		//현재 게시글정보 가져오기
		ContentBean currentContentBean = boardService.getContentInfo(content_idx);

		//작성한 사람의 글번호와 로그인한 사람의 글번호가 다르면
		if(currentContentBean.getContent_writer_idx() != loginUserBean.getUser_idx()) {
			//경로를 읽어와서
			String contextPath = request.getContextPath();
			//not_writer 호출
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}

		return true;
	}
	 */
}












