<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
		1. 폼 값을 받기
		2. DAO연동을 통해서 update() 메서드를 호출해서 회원 정보를 수정
		3. 매개값을 VO로 전달
		4. 수정 성공시 "회원 정보가 수정되었습니다." 출력 후 마이페이지로 이동
			수정 실패시 "회원 정보 수정에 실패했습니다. 출력 후 마이페이지로 이동
	*/
	// URL 강제 접속 차단
	
	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserVO vo = new UserVO(id, null, name, email, address, null);	
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.update(vo);
	
	if (result ==1) {
		// 이름을 변경한 경우 세션에 저장된 이름을 변경.
		session.setAttribute("user_name", name);		
		%>
		<script>
			alert("회원 수정을 완료했습니다.");
			location.href = "user_mypage.jsp";
		</script>		
		<%
	} else {
		%>
		<script>
			alert("회원 수정에 실패했습니다.");
			location.href = "user_mypage.jsp";
		</script>		
		<%
	}
%>