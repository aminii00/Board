package com.project.common.intercepter;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class InterceptofConfig extends WebMvcConfigurerAdapter{
	
	@Override
	public void addInterceptors(InterceptorRegistry registy) {
		registy.addInterceptor(new ViewNameInterceptor())
		       .addPathPatterns("/*.do")
		       .addPathPatterns("/*/*.do")
		       .addPathPatterns("/users/login");
	}

}
