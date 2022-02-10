package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class RegisterServiceimpl implements IBoardService {
	
	
	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 폼에서 전달된 값을 처리
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.regist(writer,title,content);
		
	}

}
