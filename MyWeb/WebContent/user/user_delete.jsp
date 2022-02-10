<%@page import="com.myweb.user.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	/*
		1. user_delete_check.jsp로 받은 폼데이터 값을 처리
		2. login(id,pw) 메서드를 재사용하여, 비밀번호를 확인
		3. login메서드가 0을 반환하면, "비밀번호를 확인하세요" 출력
			1을 반환하면, delete() 실행
		4. 삭제 성공시 "회원 탈퇴처리가 되었습니다." 를 출력 후에 세션을 전부 삭제 후 /MyWeb/으로 이동
		5. 삭제 실패시 "회원 탈퇴에 실패했습니다."를 출력 mypage로 이동
	
	*/

	if (session.getAttribute("user_id") == null) {
		response.sendRedirect("user_login.jsp");
	}
	request.setCharacterEncoding("utf-8");
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