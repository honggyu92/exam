<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<h2>문제 목록</h2>
	<table class="question_list">
		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="5%" />
			<col width="5%" />
			<col width="*" />
			<col width="10%" />
			<col width="10%" />
			<col width="8%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">문제번호</th>
				<th scope="col">과목</th>
				<th scope="col">난이도</th>
				<th scope="col">배점</th>
				<th scope="col">문제내용</th>
				<th scope="col">문제타입</th>
				<th scope="col">등록일</th>
				<th scope="col">상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td align="center">${row.id }</td>
							<td align="center">${row.subject }</td>
							<td align="center">${row.difficulty }</td>
							<td align="center">${row.score }</td>
							<td>${row.contents }</td>
							<td align="center">${row.type }</td>
							<td align="center">${row.date }</td>
								<td class="detail" align="center"><a href="#this" name="detail"> + </a>
 								<input type="hidden" id="id" value="${row.id }"></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br />
 	<a href="#this" class="btn" id="write">문제추가</a>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openQuestionWrite();
			});	
			
			$("a[name='detail']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openQuestionDetail($(this));
			});
		});
		
		
		function fn_openQuestionWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/exam/openQuestionWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openQuestionDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/exam/openQuestionDetail.do' />");
			comSubmit.addParam("id", obj.parent().find("#id").val());
			comSubmit.submit();
		}
	</script>
 


</body>
</html>