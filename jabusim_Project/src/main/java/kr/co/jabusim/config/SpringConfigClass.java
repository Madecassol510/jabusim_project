package kr.co.jabusim.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/*public class SpringConfigClass implements WebApplicationInitializer{

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {

		AnnotationConfigWebApplicationContext servletAppContext = new AnnotationConfigWebApplicationContext();
		servletAppContext.register(ServletAppContext.class);

		DispatcherServlet dispaterServlet = new DispatcherServlet(servletAppContext);
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", dispaterServlet);

		//遺�媛��꽕�젙
		servlet.setLoadOnStartup(1); //媛��옣 癒쇱� 諛쏆븘�뱾�씠寃좊떎�뒗 �쑜 => �뿬湲곗꽌 異쒕컻
		servlet.addMapping("/");

		//========================================================



		//Bean�뱾�쓣 �젙�쓽�븯�뿬 愿�由ы븿
		AnnotationConfigWebApplicationContext rootAppContext = new AnnotationConfigWebApplicationContext();
		rootAppContext.register(RootAppContext.class);

		ContextLoaderListener listener=new ContextLoaderListener(rootAppContext);
		servletContext.addListener(listener);

		//�뙆�씪誘명꽣 �씤肄붾뵫 �꽕�젙
		FilterRegistration.Dynamic filter = servletContext.addFilter("encodingFilter", CharacterEncodingFilter.class);
		filter.setInitParameter("encoding", "UTF-8");
		filter.addMappingForServletNames(null, false, "dispatcher");

		//null: 사용자가 입력한 내용을 임시기억할 아파치톰켓에서 제공하는 서버의 임시기억장소
		//52428800 :  업로드 데이터의 용량 (1024*50) 50M로 설정
		//524288000 : 파일데이터를 포함한 전체용량 500M 설정
		//0 : 파일의 임계값(데이터를 받아서 자동으로 저장)


	}

} */

//Multipart 정보구현


public class SpringConfigClass extends AbstractAnnotationConfigDispatcherServletInitializer {
	// DispatcherServlet�뿉 留ㅽ븨�븷 �슂泥� 二쇱냼瑜� �뀑�똿�븳�떎.
	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] { "/" };
	}

	// Spring MVC �봽濡쒖젥�듃 �꽕�젙�쓣 �쐞�븳 �겢�옒�뒪瑜� 吏��젙�븳�떎.
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] { ServletAppContext.class };
	}

	// �봽濡쒖젥�듃�뿉�꽌 �궗�슜�븷 Bean�뱾�쓣 �젙�쓽湲� �쐞�븳 �겢�옒�뒪瑜� 吏��젙�븳�떎.
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[] { RootAppContext.class };
	}

	// �뙆�씪誘명꽣 �씤肄붾뵫 �븘�꽣 �꽕�젙
	@Override
	protected Filter[] getServletFilters() {
		// TODO Auto-generated method stub
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		return new Filter[] {encodingFilter};

	}

	//null: 사용자가 입력한 내용을 임시기억할 아파치톰켓에서 제공하는 서버의 임시기억장소
	//52428800 :  업로드 데이터의 용량 (1024*50) 50M로 설정
	//524288000 : 파일데이터를 포함한 전체용량 500M 설정
	//0 : 파일의 임계값(데이터를 받아서 자동으로 저장)

	//Multipart 정보구현
	@Override
	protected void customizeRegistration(Dynamic registration) {
		// TODO Auto-generated method stub
		super.customizeRegistration(registration);

		MultipartConfigElement config1 = new MultipartConfigElement(null, 52428800, 524288000, 0);
		registration.setMultipartConfig(config1);
	}
}
