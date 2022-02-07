<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
		1. 폼값 처리
		2. login(id, 예전비밀번호) 아이디로 비밀번호가 맞는지 확인
			예전 비밀번호가 틀리면 뒤로가기
		3. 일치하면 changePassword(??)를 실행 
		4. 성공하면 "비밀번호 변경처리 되었습니다." 출력 후 , mypage로 이동
		5. 실패하면 "비밀번호 변경에 실패했습니다. 출력 후, mypage로 이동
	*/
	
	// 강제 url 접속 차단
	
	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	
	String id = (String)session.getAttribute("user_id");
	String oldpw = request.getParameter("old_pw");
	String newpw = request.getParameter("new_pw");
	
	if (oldpw.equals(newpw)) {
		%>
		<script>
			alert("비밀번호가 이전 비밀번호와 일치합니다..");
			history.go(-1);
		</script>
		<%
	} else {
		
		UserDAO dao = UserDAO.getInstance();
		int result = dao.login(id, oldpw);
		
		if (result ==1) {
			
			int result2 = dao.changePassword(id, newpw);
			
			if (result2 ==1) {
				%>
				<script>
					alert("비밀번호가 변경되었습니다.");
					location.href = "user_mypage.jsp";
				</script>
				<%
			} else {
				%>
				<script>
					alert("비밀번호 변경에 실패했습니다.");
					location.href = "user_mypage.jsp";
				</script>
				<%
			}
			
		} else {
			%>
			<script>
				alert("비밀번호 변경에 실패했습니다.");
				history.go(-1);
			</script>
			<%
		}	
		
	}
	

%>