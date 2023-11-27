package kr.co.jabusim.config;


import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.interceptor.CheckLoginInterceptor;
import kr.co.jabusim.interceptor.TopMenuInterceptor;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.UserMapper;





@Configuration
@EnableWebMvc //controller
@ComponentScan("kr.co.jabusim.controller")
@ComponentScan("kr.co.jabusim.dao")
@ComponentScan("kr.co.jabusim.service")
@PropertySource("/WEB-INF/properties/db.properties")
public class ServletAppContext implements WebMvcConfigurer {

	@Value("${db.classname}")
	private String db_classname;

	@Value("${db.url}")
	private String db_url;

	@Value("${db.username}")
	private String db_username;

	@Value("${db.password}")
	private String db_password;

	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	@Bean
	public BasicDataSource dataSource() {
		BasicDataSource source = new BasicDataSource();
		source.setDriverClassName(db_classname);
		source.setUrl(db_url);
		source.setUsername(db_username);
		source.setPassword(db_password);

		return source;
	}
	//=================================================================================
	//인터셉터 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);
		
		//�޼ҵ� ���ͼ��� �߰�
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);
		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		
		//���ͼ��� ���
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);
		
		//������ų �� ����/		
		reg1.addPathPatterns("/**"); 
		// ��� ���� �Ѹ��ڴٰ� ����/		
		reg2.addPathPatterns("/user/logout"); //�α��� ���� ���� ���¿��� ������ ���� ī�װ�
		//reg2.excludePathPatterns("/board/main"); // ���� ��û	
	}
	
	
	//=================================================================================

	// 쿼리문과 접속 정보를 관리하는 객체
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	// 쿼리문 실행을 위한 객체(Mapper 관리)
	// Mapper 등록
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<LicenseMapper> getLicenseMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<LicenseMapper> factoryBean = new MapperFactoryBean<LicenseMapper>(LicenseMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}

	// ==============================================================

	// 메세지 properties 등록(에러메세지)
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");

		return res;
	}

	// 소스와 메세지는 별도라는 설정
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}

}
