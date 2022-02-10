package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class DeleteServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/*
			1. DeleteServiceImpl을 생성
			2. 서비스 영역에는 num을 받아서 delete()메서드를 실행
			3. DAO의 delete()에서는 delete구문으로 삭제
			4. 페이지 이동은 목록으로 처리...
			추가) board_modify.jsp에서 삭제를 JAVASCRIPT를 이용하여 확인하는 Function을 이용
		*/
		
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		dao.deleteContent(num);
		
	}

}
