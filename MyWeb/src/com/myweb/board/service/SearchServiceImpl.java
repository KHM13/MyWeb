package com.myweb.board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class SearchServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String com = request.getParameter("choose");
		String search = request.getParameter("search");
		BoardDAO dao = BoardDAO.getInstance();
		
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)dao.search(com, search);
		
		request.setAttribute("list", list);
	}

}
