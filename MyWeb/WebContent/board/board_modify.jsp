<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>
	<section>
		<div align = "center">
			<form action="update.board" method="post" name = "regform">
				<table border = "1" width = "500">
					<tr>
						<td>글번호</td>
						<td><input type="text" name = "num" value = "${vo.num }" readonly></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name = "num" value = "${vo.writer }" readonly></td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
						<input type = "text" name = "title" value = "${vo.title }">
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3" height="120">
						<textarea rows="10" style="width:100%;" name = "content">${vo.content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<input type="button" value="수정 " class="btn btn-default" onclick="modifyCheck()">
							<input type="button" value="목록" class="btn btn-default" onclick="location.href ='list.board'">
							<input type="button" value="삭제" class="btn btn-default" onclick="deleteCheck()">
						</td>
					</tr>
				</table>
			</form>		
		</div>
	</section>
<%@ include file = "../include/footer.jsp" %>
<script>
	function modifyCheck() {
		if (document.regform.title.value == '') {
			alert("제목를 입력하세요.");
			return;
		} else if (confirm("게시글을 수정하시겠습니까?")) {
			document.regform.submit();
		} else {
			return;
		}
	}
	
	function deleteCheck() {
		if (confirm("글을 삭제하시겠습니까?")) {
			location.href ="delete.board?num=${vo.num}"
		} else {
			return;
		}
	}
	
</script>