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
	<!-- choose 절을 이용하여 90 이상은 A, 80 이상은 B, 70이상은 C, 나머지는 F -->
	<h2>당신의 학점은?</h2>
	<c:choose>
		<c:when test="${param.point >= 90}">
			A
		</c:when>
		<c:when test="${param.point >= 80}">
			b
		</c:when>
		<c:when test="${param.point >= 70}">
			c
		</c:when>
		<c:otherwise>
			F
		</c:otherwise>
	</c:choose>
	
</body>
</html>