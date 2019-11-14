package com.web.config;

import java.util.ArrayList;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan({ "com.web.config",
				 "com.web.controller", 
				 "com.web.service.impl", 
				 "com.web.dao.impl",
		 		})
//public class WebAppConfig extends  WebMvcConfigurerAdapter { 
public class WebAppConfig implements WebMvcConfigurer {
	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		// resolver.setViewClass(JstlView.class); // 新版的Spring框架不需要這一行
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	 @Bean
	  public CommonsMultipartResolver multipartResolver() {
	   CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	   resolver.setDefaultEncoding("UTF-8");
	   resolver.setMaxUploadSize(81920000);
	   return resolver;
	  }
	 
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 registry.addResourceHandler("/assets/**")			//管理員後臺
	   .addResourceLocations("/resources/assets/");
	 registry.addResourceHandler("/css/**")			//前臺首頁css
	   .addResourceLocations("/resources/frontPage/css/");
	 registry.addResourceHandler("/fonts/**")			//前臺首頁fonts
	   .addResourceLocations("/resources/frontPage/fonts/");
	 registry.addResourceHandler("/img/**")			//前臺首頁img
	   .addResourceLocations("/resources/frontPage/img/");
	 registry.addResourceHandler("/js/**")			//前臺首頁js
	   .addResourceLocations("/resources/frontPage/js/");
	 registry.addResourceHandler("/sass/**")			//前臺首頁sass
	   .addResourceLocations("/resources/frontPage/sass/");
	}

}
