package com.project.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	  public ModelAndView form( HttpServletRequest request, HttpServletResponse response) throws Exception;
	  public ModelAndView main( HttpServletRequest request, HttpServletResponse response) throws Exception;
	  public ModelAndView saveBoard( HttpServletRequest request, HttpServletResponse response) throws Exception;
	  public ModelAndView boardDetail( HttpServletRequest request, HttpServletResponse response) throws Exception;
}
