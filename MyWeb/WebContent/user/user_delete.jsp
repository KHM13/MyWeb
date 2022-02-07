<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	String id = (String)session.getAttribute("user_id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	int result = dao.login(id, pw);
	
	if (result ==1) {
		int result2 = dao.delete(id);
		
		if (result2 == 1) {
			session.invalidate();
			%>
			<script>
				alert("회원 탈퇴 완료.");
				location.href = "/MyWeb/";
			</script>
			<%
		} else {
			%>
			<script>
				alert("탈퇴 실패.");
				history.go(-1);
			</script>	
			<%
		}
	} else {
		%>
		<script>
			alert("비밀번호가 틀렸습니다.");
			history.go(-1);
		</script>	
		<%
	}

%>