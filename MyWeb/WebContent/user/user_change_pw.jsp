<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section>
	<div align = "center">
		<h2>비밀번호 변경 페이지입니다.</h2>
		<hr>
		<form action="user_change_pw_ok.jsp" method="post">
			현재 비밀번호 : <input type = "password" name = "old_pw"><br>
			변경 비밀번호 : <input type = "password" name = "new_pw"><br>
			<hr>
			<input type = "submit" value = "변경" onclick="alert('비밀번호를 변경합니다.')">
			<input type = "button" value = "취소" onclick="history.go(-1)">
		</form>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>