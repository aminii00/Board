package com.project.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ViewNameInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse response, Object handler) {
		System.out.println("���ͼ��� �۵�@@");
		try {
			String viewName = getViewName(req);
			req.setAttribute("viewName", viewName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndview) {
		
	}
	
	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse resp, Object handler, Exception ex)
			throws Exception {
		
	}

	private String getViewName(HttpServletRequest req) throws Exception {
		String contextPath = req.getContextPath();
		String uri = (String) req.getAttribute("javax.servlet.include.request_uri");
		System.out.println(uri);
		if(uri==null||uri.trim().equals("")) {
			uri = req.getRequestURI();
		}
		
		int begin = 0;
		if(!((contextPath==null)||("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		
		int end;
		if(uri.indexOf(";")!=-1) {
			end = uri.indexOf(";");
		} else if(uri.indexOf("?")!=-1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String fileName = uri.substring(begin, end);
		if(fileName.indexOf(".")!=-1) {
			fileName = fileName.substring(0, fileName.lastIndexOf("."));
		}
		if(fileName.indexOf("/")!=-1) {
			fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
		}
		return fileName;
	}


}
