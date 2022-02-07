<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
	<section>
		<div align= "center">
			<h2>회원 탈퇴 페이지</h2>
			<hr>
			회원 확인을 위하여 비밀번호를 입력하세요.
			<form action="user_delete.jsp" action="post">
				<input type="password" name = "pw">
				<input type="submit" value = "탈퇴">
			</form>
			<hr>
		</div>
	</section>
<%@ include file = "../include/footer.jsp" %>