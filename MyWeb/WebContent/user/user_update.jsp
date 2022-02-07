<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%	
	/*
		이 페이지에 들어올 때, getUserInfo()메서드를 재활용해서 정보를 불러온 후에
		input 태그에 해당 값이 보여지도록 처리. id태그는 변경 불가
	*/
	
	// URL 강제 접속은 거부

	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.getUserInfo(id);
	
%>
<section>
	<div align="center">
		<form name = "regform" action="user_update_ok.jsp" method="post">
			<h2>회원정보 수정 페이지</h2>
			<hr>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" value = "<%=id %>" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value = "<%=vo.getName()%>"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value = "<%=vo.getEmail()%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name= "address" value = "<%=vo.getEmail() %>"></td>
				</tr>
			</table>
			<hr>
			<br>
			<input type="submit" value= "회원정보 수정">
		</form>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>