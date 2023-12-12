package kr.co.jabusim.config;


import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.jabusim.beans.UserBean;
import kr.co.jabusim.interceptor.CheckLoginInterceptor;
import kr.co.jabusim.interceptor.TopMenuInterceptor;
import kr.co.jabusim.mapper.BoardMapper;
import kr.co.jabusim.mapper.ExamMapper;
import kr.co.jabusim.mapper.ExamPlaceMapper;
import kr.co.jabusim.mapper.ExamReceiptMapper;
import kr.co.jabusim.mapper.ExamResultMapper;
import kr.co.jabusim.mapper.LicenseMapper;
import kr.co.jabusim.mapper.ReceiptMapper;
import kr.co.jabusim.mapper.SearchLicenseMapper;
import kr.co.jabusim.mapper.UserCareerMapper;
import kr.co.jabusim.mapper.UserEduMapper;
import kr.co.jabusim.mapper.UserMapper;
import kr.co.jabusim.service.BoardService;





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

	@Autowired
	private BoardService boardService;
	
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;

	// Controller의 메서드가 반환하는 jsp의 이름 앞뒤에 경로와 확장자를 붙혀주도록 설정한다.
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {

		WebMvcConfigurer.super.configureViewResolvers(registry);
		registry.jsp("/WEB-INF/views/", ".jsp");
	}

	// 정적 파일의 경로를 매핑한다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/**").addResourceLocations("/resources/");
	}

	// 데이터베이스 접속 정보를 관리하는 Bean
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
	//�씤�꽣�뀎�꽣 �벑濡�
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		WebMvcConfigurer.super.addInterceptors(registry);

		
		TopMenuInterceptor topMenuInterceptor = new TopMenuInterceptor(loginUserBean);
		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		
		InterceptorRegistration reg1 = registry.addInterceptor(topMenuInterceptor);
		InterceptorRegistration reg2 = registry.addInterceptor(checkLoginInterceptor);
		
		reg1.addPathPatterns("/**");
		reg2.addPathPatterns("/user/modify", "/user/logout", "/receipt/receipt_select_subject" /*, "/board/*" */);
		reg2.excludePathPatterns("/board/main");
	}


	//=================================================================================

	// 쿼리문과 접속 정보를 관리하는 객체
	@Bean
	public SqlSessionFactory factory(BasicDataSource source) throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(source);
		factoryBean.setConfigLocation(new ClassPathResource("mybatis-config.xml"));
		SqlSessionFactory factory = factoryBean.getObject();
		return factory;
	}

	// 쿼리문 실행을 위한 객체(Mapper 관리)
	@Bean
	public MapperFactoryBean<BoardMapper> getBoardMapper(SqlSessionFactory factory) throws Exception{
		MapperFactoryBean<BoardMapper> factoryBean = new MapperFactoryBean<BoardMapper>(BoardMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	//유저 mapper
	@Bean
	public MapperFactoryBean<UserMapper> getUserMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserMapper> factoryBean = new MapperFactoryBean<UserMapper>(UserMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	//자격증 mapper
	@Bean
	public MapperFactoryBean<LicenseMapper> getLicenseMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<LicenseMapper> factoryBean = new MapperFactoryBean<LicenseMapper>(LicenseMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	@Bean
	public MapperFactoryBean<SearchLicenseMapper> getSearchLicenseMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<SearchLicenseMapper> factoryBean = new MapperFactoryBean<SearchLicenseMapper>(SearchLicenseMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	//유저학력 mapper
	@Bean
	public MapperFactoryBean<UserEduMapper> getUserEduMapper (SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserEduMapper> factoryBean = new MapperFactoryBean<UserEduMapper>(UserEduMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	//유저경력 mapper
	@Bean
	public MapperFactoryBean<UserCareerMapper> getUserCareerMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<UserCareerMapper> factoryBean = new MapperFactoryBean<UserCareerMapper>(UserCareerMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	//시험 mapper
	@Bean
	public MapperFactoryBean<ExamMapper> getExamMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ExamMapper> factoryBean = new MapperFactoryBean<ExamMapper>(ExamMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	
	//시험장소 mapper
	@Bean
	public MapperFactoryBean<ExamPlaceMapper> getExamPlaceMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ExamPlaceMapper> factoryBean = new MapperFactoryBean<ExamPlaceMapper>(ExamPlaceMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	//시험접수 mapper
	@Bean
	public MapperFactoryBean<ExamReceiptMapper> getExamrReceiptMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ExamReceiptMapper> factoryBean = new MapperFactoryBean<ExamReceiptMapper>(ExamReceiptMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	
	//시험결과 mapper
	@Bean
	public MapperFactoryBean<ExamResultMapper> getExamrResultMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ExamResultMapper> factoryBean = new MapperFactoryBean<ExamResultMapper>(ExamResultMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	@Bean
	public MapperFactoryBean<ReceiptMapper> getReceiptMapper(SqlSessionFactory factory) throws Exception {
		MapperFactoryBean<ReceiptMapper> factoryBean = new MapperFactoryBean<ReceiptMapper>(ReceiptMapper.class);
		factoryBean.setSqlSessionFactory(factory);
		return factoryBean;
	}
	

	// ==============================================================

	// mapper등록
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource res = new ReloadableResourceBundleMessageSource();
		res.setBasenames("/WEB-INF/properties/error_message");

		return res;
	}

	//(메세지와 property 충돌)소스와 메세지 별도관리하도록 property를 Bean으로등록
	@Bean
	public static PropertySourcesPlaceholderConfigurer PropertySourcesPlaceholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}


	@Bean
	public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver(); //객체 생성하여 반환
	}

}
