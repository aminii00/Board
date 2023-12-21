package com.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.project.board.dao.BoardDAO;
import com.project.board.vo.BoardVO;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> boardList(){
		List<BoardVO> boardList = boardDAO.boardList();
		return boardList;
	}
	
	@Override
	public int NewBoardNo() {
		int NewBoardNo = boardDAO.NewBoardNo();
		return NewBoardNo;
	}
	
	@Override
	public void saveBoard(BoardVO board) {
		boardDAO.saveBoard(board);
	}
}
