package com.project.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.dao.BoardDAO;
import com.project.board.service.BoardServiceImpl;
import com.project.board.vo.BoardVO;
import com.project.common.file.FileUploadController;
import com.project.common.file.GeneralFileUploader;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {

	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\board_image";
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private BoardDAO boardDAO;

	@Override
	@RequestMapping(value = "/board/main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		Map pagingMap = GeneralFileUploader.getParameterMap(request);
		// HTTP 요청에서 페이징 관련 파라미터를 가져와 Map으로 저장
		
		String pageNum = (String) pagingMap.get("pageNum");
		String section = (String) pagingMap.get("section");
		
		// 카테고리 불러오기
		String category = request.getParameter("category");
		if (category == null || category.trim().isEmpty()) {
		    // 유효하지 않은 카테고리 값에 대한 처리
		    category = ""; // 기본값 설정 또는 예외 처리
		}
		pagingMap.put("category", category);

		// 검색 내용 불러오기
		String search = request.getParameter("search");
		if (search == null) {
		    // 유효하지 않은 검색어에 대한 처리
		    search = ""; // 빈 문자열 또는 다른 기본값 설정
		}
		pagingMap.put("search", search);
		
		if (pageNum == null || pageNum.trim().length() < 1) {
		    pageNum = "1";
		    pagingMap.put("pageNum", pageNum);
		}
		if (section == null || section.trim().length() < 1) {
		    section = "1";
		    pagingMap.put("section", section);
		}
		// 페이지 번호와 섹션 정보가 없을 경우 기본값을 설정하고, Map에 다시 저장

		try {
		    int start = ((Integer.parseInt(section) - 1) + Integer.parseInt(pageNum) - 1) * 10;
		    pagingMap.put("start", start);

		    List<BoardVO> boardList = boardService.selectBoardListWithPagingMap(pagingMap);
		    // 북마크 목록을 가져옴

		    mav.addAllObjects(pagingMap);
		    mav.addObject("boardList", boardList);
		    // ModelAndView에 페이징 정보와 북마크 목록을 추가

		    System.out.println("boardList = " + boardList);
		    // 로그 출력: 현재 조회된 북마크 목록 출력

		    int totalBoardListNum = boardService.selectBoardListTotalNum(pagingMap);
		    mav.addObject("totalBoardListNum", totalBoardListNum);
		    // 총 북마크 개수를 가져와 ModelAndView에 추가

		    System.out.println(mav);
		    // 로그 출력: 현재 ModelAndView 객체 출력
		} catch (Exception e) {
		    e.printStackTrace();
		    // 예외가 발생하면 스택 트레이스 출력
		}

		mav.setViewName("/board/main");
		// ModelAndView의 뷰 이름 설정

		System.out.println(mav);
		// 로그 출력: 최종 ModelAndView 객체 출력

		return mav;
		// 최종적으로 설정된 ModelAndView 객체 반환

		/*
		 * List<BoardVO> boardList = boardService.boardList();
		 * mav.addObject("boardList", boardList); System.out.println("boardList = " +
		 * boardList); mav.setViewName("/board/main"); System.out.println("main.do 뷰: "
		 * + mav); return mav;
		 */
	}
	@Override
	@RequestMapping(value = "/board/searchBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchBoard( HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("redirect:/board/main.do");
		
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/board/saveBoard.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView saveBoard(MultipartHttpServletRequest  request) throws Exception {
		 request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView("redirect:/board/main.do");
		

		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		/* String tag = request.getParameter("tag"); */

		
		int NewBoardNo = boardService.NewBoardNo();
		
		List fileList = GeneralFileUploader.upload(request, "/image/" + NewBoardNo);
		String imageFileName = (String) fileList.get(0);
		System.out.println("fileList : " + fileList);
		System.out.println("imageFileName : " + imageFileName);

		BoardVO board = new BoardVO();
		board.setTitle(title);
		board.setName(name);
		board.setContent(content);

	    // 여러 파일이 업로드될 경우, 파일 이름들을 쉼표로 구분하여 저장
	    board.setImageFileName(imageFileName);
		/* board.setTag(tag); */

		// 게시글 저장
		board.setBoardNo(NewBoardNo);
		boardService.saveBoard(board);

		return mav;
		
	}

	@Override
	@RequestMapping(value = "/board/mainDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView boardDetail(HttpServletRequest request, HttpServletResponse sresponse) throws Exception {
		 request.setCharacterEncoding("UTF-8");
		ModelAndView mav = new ModelAndView();
		String boardNo1 = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(boardNo1);
		BoardVO boardSearchList = boardService.boardSearchList(boardNo);
		mav.addObject("boardSearchList", boardSearchList);
		mav.setViewName("/board/mainDetail");
		System.out.println("boardSearchList = " + boardSearchList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/board/*Form.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 request.setCharacterEncoding("UTF-8");
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

}
