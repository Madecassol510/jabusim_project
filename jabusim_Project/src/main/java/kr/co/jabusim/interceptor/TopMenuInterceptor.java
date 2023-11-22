package kr.co.jabusim.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.jabusim.beans.UserBean;



public class TopMenuInterceptor implements HandlerInterceptor{
	
	//HandlerInterceptor�� @Autowired�� ��� ���� ����
	//private TopMenuService topMenuService;
	private UserBean loginUserBean;
	
	public TopMenuInterceptor( UserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//List<BoardInfoBean> topMenuList = topMenuService.getTopMenuList();
		//request.setAttribute("topMenuList", topMenuList);
		request.setAttribute("loginUserBean", loginUserBean);
		return true;
	}
}
