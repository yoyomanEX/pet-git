package com.web.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Configuration
@EnableWebMvc
@ComponentScan({ "com.web.controller", "com.web.service.impl", "com.web.dao.impl",
		"com.web.config","com.web.model"})
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

@Override
public void addResourceHandlers(ResourceHandlerRegistry registry) {
	registry.addResourceHandler("/css/**")
			.addResourceLocations("/WEB-INF/resource/css/");
	registry.addResourceHandler("/img/**")
			.addResourceLocations("/WEB-INF/resource/img/");
	registry.addResourceHandler("/js/**")
			.addResourceLocations("/WEB-INF/resource/js/");	
	registry.addResourceHandler("/scss/**")
			.addResourceLocations("/WEB-INF/resource/scss/");
	registry.addResourceHandler("/vendor/**")
			.addResourceLocations("/WEB-INF/resource/vendor/");
//	管理員後台系統版~~~~~
		
}	
@Bean
public CommonsMultipartResolver multipartResolver() {
	CommonsMultipartResolver resolver = new CommonsMultipartResolver();
	resolver.setDefaultEncoding("UTF-8");
	resolver.setMaxUploadSize(81920000);
	return resolver;
}

}
