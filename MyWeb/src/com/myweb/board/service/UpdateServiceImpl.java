package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class UpdateServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/*
			1. UpdateServiceImpl을 생성
			2. 서비스 영역에서 num, title, content를 받아서, update()메서드를 실행
			3. DAO의 update()에서 update구문으로 데이터를 수정
			4. 페이지 이동을 상세보기화면으로 연결(이떄 필요한 값을 전달해야 함)
		 */
		
		String num = request.getParameter("num");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.updateContent(num, title, content);
	}

}
