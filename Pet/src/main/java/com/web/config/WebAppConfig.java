package com.web.config;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


@Configuration
@EnableWebMvc
//@ComponentScan({ "com.web.controller", "com.web.service.impl", "com.web.dao.impl",
//		"com.web.config", })
@ComponentScan(basePackages = { "com.web" })
//public class WebAppConfig extends  WebMvcConfigurerAdapter { 
public class WebAppConfig implements WebMvcConfigurer {
	@Autowired
	ServletContext context;

	@Override
	// 本方法會自動產生一個ContentNegotiationManager
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		// 如果Spring無法由延伸檔名、請求標頭判斷出使用者要求的沒有型態，
		// 就使用MediaType.APPLICATION_XML為預設型態。
		// configurer.defaultContentType(MediaType.TEXT_HTML);
		// configurer.defaultContentType(MediaType.APPLICATION_XML);
		configurer.defaultContentType(MediaType.APPLICATION_JSON);
	}

	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		ContentNegotiatingViewResolver cnvResolver = new ContentNegotiatingViewResolver();
		cnvResolver.setContentNegotiationManager(manager);
		// Define all possible view resolvers
		List<ViewResolver> resolvers = new ArrayList<ViewResolver>();
//		resolvers.add(jaxb2MarshallingXmlViewResolver());
//		resolvers.add(jsonViewResolver());
		resolvers.add(jspViewResolver());
//		resolvers.add(pdfViewResolver(context));
//		resolvers.add(excelViewResolver());

		cnvResolver.setViewResolvers(resolvers);
		return cnvResolver;
	}

	// 配置 Spring提供的 XML視圖解析器
//	@Bean
//	public ViewResolver jaxb2MarshallingXmlViewResolver() {
//		Jaxb2Marshaller marshaller = new Jaxb2Marshaller();
//		marshaller.setClassesToBeBound(_01.model.Member.class, _01.model.Members.class);
//		return new Jaxb2MarshallingXmlViewResolver(marshaller);
//	}

	// 配置 Spring提供的 jsonViewResolver
//	@Bean
//	public ViewResolver jsonViewResolver() {
//		return new JsonViewResolver();
//	}

	/*
	 * 配置自行設計的 PdfViewResolver
	 */
//	@Bean
//	public ViewResolver pdfViewResolver(ServletContext context) {
//		return new PdfViewResolver(context);
//	}

	/*
	 * 配置自行設計的 ExcelViewResolver
	 */
//	@Bean
//	public ViewResolver excelViewResolver() {
//		return new ExcelViewResolver();
//	}
	// 配置 Spring提供的 InternalResourceViewResolver
	@Bean
	public ViewResolver jspViewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	
	//加這行後，不用寫外掛套件
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

//	@Override
//	public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {
//		converters.add(new MemberConverter());
//	}
	
	//07 圖片上傳需要的
		@Bean
		public CommonsMultipartResolver multipartResolver() {
			CommonsMultipartResolver resolver = new CommonsMultipartResolver();
			resolver.setDefaultEncoding("UTF-8");
			resolver.setMaxUploadSize(81920000);
			return resolver;
		}
		
		
		@Bean
		public MappingJackson2JsonView jsonView() {
			 MappingJackson2JsonView view = new MappingJackson2JsonView();
			    view.setPrettyPrint(true);
			    return view;
		}
		
		@Bean
		public ViewResolver contentNeogViewResolver(ContentNegotiationManager manager) {
			 ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
			resolver.setContentNegotiationManager(manager);
			ArrayList views = new ArrayList<>();
			views.add(jsonView());
			resolver.setDefaultViews(views);
			return resolver;
			
		}

		
		@Override
		public void addResourceHandlers(ResourceHandlerRegistry registry) {
			registry.addResourceHandler("/css/**")
	                .addResourceLocations("/WEB-INF/resources/css/");
			registry.addResourceHandler("/fonts/**")
	                .addResourceLocations("/WEB-INF/resources/fonts/");
			registry.addResourceHandler("/img/**")
					.addResourceLocations("/WEB-INF/resources/img/");
			registry.addResourceHandler("/js/**")
			        .addResourceLocations("/WEB-INF/resources/js/");
			registry.addResourceHandler("/**")
	                .addResourceLocations("/WEB-INF/resources/");	
			registry.addResourceHandler("/sass/**")
					.addResourceLocations("/WEB-INF/resources/sass/");
			registry.addResourceHandler("/scss/**")
			        .addResourceLocations("/WEB-INF/resources/scss/");
			registry.addResourceHandler("/vendor/**")
			        .addResourceLocations("/WEB-INF/resources/vendor/");
			registry.addResourceHandler("/.sass-cache/**")
	        .addResourceLocations("/WEB-INF/resources/.sass-cache/");
	    
		}
	
}
