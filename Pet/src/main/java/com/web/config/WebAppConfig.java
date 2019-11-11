package com.web.config;


import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan({ "com.web" })
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
                .addResourceLocations("/WEB-INF/blogresources/css/");
		registry.addResourceHandler("/fonts/**")
                .addResourceLocations("/WEB-INF/blogresources/fonts/");
		registry.addResourceHandler("/img/**")
				.addResourceLocations("/WEB-INF/blogresources/img/");
		registry.addResourceHandler("/js/**")
		        .addResourceLocations("/WEB-INF/blogresources/js/");
		registry.addResourceHandler("/**")
                .addResourceLocations("/WEB-INF/blogresources/");	
		registry.addResourceHandler("/sass/**")
				.addResourceLocations("/WEB-INF/blogresources/sass/");
		registry.addResourceHandler("/scss/**")
		        .addResourceLocations("/WEB-INF/blogresources/scss/");
		registry.addResourceHandler("/vendor/**")
		        .addResourceLocations("/WEB-INF/blogresources/vendor/");
		registry.addResourceHandler("/.sass-cache/**")
                .addResourceLocations("/WEB-INF/blogresources/.sass-cache/");
		registry.addResourceHandler("/assets/**")
		        .addResourceLocations("/WEB-INF/blogresources/assets/");
    
	}
	
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
	
}
