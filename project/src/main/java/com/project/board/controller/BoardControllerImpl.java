package com.project.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dao.BoardDAO;
import com.project.board.service.BoardServiceImpl;
import com.project.board.vo.BoardVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {

	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\board_image";
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private BoardDAO boardDAO;

	@RequestMapping(value = "/board/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		List<BoardVO> boardList = boardService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("/board/main");
		System.out.println("main.do 뷰: " + mav);
		return mav;
	}

	@Override
	@RequestMapping(value = "/board/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/board/saveBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView saveBoard( HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String imageFileName = request.getParameter("imageFileName");
		String tag = request.getParameter("tag");
		
		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setName(name);
		board.setContent(content);
		board.setImageFileName(imageFileName);
		//board.SetTag(tag);
		int NewBoardNo = boardService.NewBoardNo();
		board.setBoardNo(NewBoardNo);
		boardService.saveBoard(board);
		mav.setViewName("/board/main");
		return mav;
	}

}
