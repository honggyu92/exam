<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
</head>
<body>
	<h2>문제 작성</h2>
	<form id="frm">
		<table class="question_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>

			<tbody>
				<tr>
					<td>
						<select name="subject">
							<option value="">과목선택</option>
							<option value="Korean">Korean</option>
							<option value="Math">Math</option>
							<option value="English">English</option>
							<option value="Society">Society</option>
							<option value="Science">Science</option>
					</select> 
						<select name="difficulty">
							<option value="">난이도 선택</option>
							<option value="low">low</option>
							<option value="normal">normal</option>
							<option value="high">high</option>
					</select> 
						<select name="type">
							<option value="">유형선택</option>
							<option value="objective">objective</option>
							<option value="subjective">subjective</option>
					</select>
					</td>
					<td>배점 : <input type="text" id="score" name="score"
						class="wdp_5"> 점
					</td>
				</tr>
				<tr>
					<td colspan="2" class="view_contents">
					<textarea rows="10" cols="30" title="문제 내용" id="contents" name="contents"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<div name="div1" style="display:none">
							답 : <input type="text" id="answer" name="answer" class="wdp_5"></input>
						</div>
						<div name="div2" style="display:none">
							보기
							<button id="add">보기 추가</button>
							<table id="example" border="1px">
							<tr>
							<th>보기</th>
							<th>내용</th>
							<th>정답 여부</th>
							<th>삭제</th>
							</tr>
							<tr class="option1">
							<td><input type="text" size="1"/></td>
							<td><input type="text" size="50"/></td>
							<td><input type="checkbox" /></td>
							<td><button class="del">삭제</button></td>
							</tr>
							<tr class="option2">
							<td><input type="text" size="1"/></td>
							<td><input type="text" size="50"/></td>
							<td><input type="checkbox" /></td>
							<td><button class="del">삭제</button></td>
							</tr>
							<tr class="option3">
							<td><input type="text" size="1"/></td>
							<td><input type="text" size="50"/></td>
							<td><input type="checkbox" /></td>
							<td><button class="del">삭제</button></td>
							</tr>
							</table>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<br />
		<br /> 
			<a href="#this" class="btn" id="list">목록으로</a>
		    <a href="#this" class="btn" id="write">작성하기</a>
	</form>

	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<script type="text/javascript">
     
        $(document).ready(function(){
            $("#list").on("click", function(e){ //목록으로 버튼
                e.preventDefault();
                fn_openQuestionList();
            });
             
            $("#write").on("click", function(e){ //작성하기 버튼
                e.preventDefault();
                fn_insertQuestion();
            });
            
            $("[name=type]").change(function (e){ 
				//alert($("[name=type] option:selected").val());
				var opt = $("[name=type] option:selected").val();
				if(opt =="objective"){
					$("[name=div1]" ).show();
					$("[name=div2]" ).hide();
				}else if (opt =="subjective"){
					$("[name=div1]" ).hide();
					$("[name=div2]" ).show();
				}else{
					$("[name=div1]" ).hide();
					$("[name=div2]" ).hide();
				}
				
            });
            
            $("#add").click(function(e){
            	 e.preventDefault();
                var lastOptionNo = $("#example tr:last").attr("class").replace("option", "");
 
                var newoption = $("#example tr:eq(1)").clone();
                newoption.removeClass();
                newoption.find("td:eq(0)").attr("rowspan", "1");
                newoption.addClass("option"+(parseInt(lastOptionNo)+1));
 
                $("#example").append(newoption);
            });

         // 삭제버튼 클릭시
            $(".del").on("click", function(e){
            	e.preventDefault();
                var clickedRow = $(this).parent().parent();
                var cls = clickedRow.attr("class");
                 
                // 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.
                if( clickedRow.find("td:eq(0)").attr("rowspan") ){
                    if( clickedRow.next().hasClass(cls) ){
                        clickedRow.next().prepend(clickedRow.find("td:eq(0)"));
                    }
                }
 
                clickedRow.remove();
 
                // rowspan 조정
                resizeRowspan(cls);
            });
            
        });
         
        function fn_openQuestionList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/exam/openQuestionList.do' />");
            comSubmit.submit();
        }
         
        function fn_insertQuestion(){
              var comSubmit = new ComSubmit("frm");
             comSubmit.setUrl("<c:url value='/exam/insertQuestion.do' />");
             comSubmit.submit(); 
//            $("#frm").prop("action","/exam/insertQuestion.do");
//            $("#frm").submit(); 
        }
        
        function resizeRowspan(cls){
            var rowspan = $("."+cls).length;
            $("."+cls+":first td:eq(0)").attr("rowspan", rowspan);
        }
         
    </script>
</body>
</html>