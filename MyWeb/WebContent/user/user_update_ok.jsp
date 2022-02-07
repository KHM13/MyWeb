<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserVO vo = new UserVO(id, null, name, email, address, null);	
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.update(vo);
	
	if (result ==1) {
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