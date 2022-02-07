<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<section>
	<div align="center">
		<form name = "regform" action="user_login_ok.jsp" method="post">
			<h2>로그인 페이지</h2>
			<hr>
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder = "아이디"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder = "비밀번호"></td>
				</tr>
			</table>
			<hr>
			<br>
			<input type="button" value= "로그인" class = "btn btn-default" onclick = "login()">
			<input type="button" value= "회원가입" class ="btn btn-primary" onclick = "join()">
		</form>
	</div>
</section>
<%@ include file="../include/footer.jsp"%>
<script>

	function login() {
		document.regform.submit();
	}
	function join() {
		location.href="user_join.jsp";
	}


</script>