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
	//�ڵ������� �ȵǹǷ� �����ڸ� ���Ͽ� ����
	public CheckWriterInterceptor(UserBean loginUserBean, BoardService boardService) {
		// TODO Auto-generated constructor stub
		this.loginUserBean = loginUserBean;
		this.boardService = boardService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//read.jsp���� ���Ե� content_idx�������� 
		String str1 = request.getParameter("content_idx");
		int content_idx = Integer.parseInt(str1); //����ȯ

		//���� �Խñ����� ��������
		ContentBean currentContentBean = boardService.getContentInfo(content_idx);

		//�ۼ��� ����� �۹�ȣ�� �α����� ����� �۹�ȣ�� �ٸ���
		if(currentContentBean.getContent_writer_idx() != loginUserBean.getUser_idx()) {
			//��θ� �о�ͼ�
			String contextPath = request.getContextPath();
			//not_writer ȣ��
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}

		return true;
	}
	 */
}












