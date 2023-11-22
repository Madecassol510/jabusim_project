package kr.co.jabusim.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.jabusim.beans.UserBean;


public class CheckLoginInterceptor implements HandlerInterceptor{

	//�α��� ���� �Ǵ��ϴ� ��ü
	private UserBean loginUserBean;
	
	public CheckLoginInterceptor(UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.isUserLogin() == false) { //�α����� ���� ���� ����
			String contextPath = request.getContextPath(); //�α��� ���� ���� ������ ���
			
			response.sendRedirect(contextPath + "/user/not_login");
			
			//�����ܰԷ� �������� �ʰ� ���ó��
			return false;
		}
		
		
		return true; //�α��� ����
	}
	
}
