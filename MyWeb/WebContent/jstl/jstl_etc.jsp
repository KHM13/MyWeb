<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
		for Tokens 태그
		: 자바의 StringTokenizer를 JSTK를 사용하여 구연해 쓸 수 있습니다.
	-->
	
	<c:forTokens var = "abc" items="안녕/하세요/ 지금은/ JSP/수업/ 시간/입니다." delims="/">
		${abc }<br>
	</c:forTokens>
	
	<!--
		redirect 태그
		: 특정 값을 지정된 url로 전달할 때 사용
	-->
	<c:redirect url="test.jsp">
		<c:param name="test" value = "${abc }"/>
	</c:redirect>
</body>
</html>