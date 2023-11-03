<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
<style>
	#view tr:nth-child(4) { height: 100px; }
	
	#add-comment td:nth-child(1) { width: auto; }
	#add-comment td:nth-child(2) { width: 110px; text-align: center; }
	#list-comment td:nth-child(1) { width: auto; }
	#list-comment td:nth-child(2) { width: 170px; }
	#list-comment td:nth-child() > div {
		display: flex;
		justify-content: space-between;
	}
	#list
</style>
</head>
<body>
	<!-- view.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<main id="main">
		<h1 class="sub">게시판 <small>상세보기</small></h1>
		<table class="vertical" id="view">
			<tr>
				<th>번호</th>
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}(${dto.id})</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>읽음</th>
				<td>${dto.readcount}</td>
			</tr>
		</table>
		
		<!-- 댓글 쓰기 -->
		
		<form>
		<table id="add-comment">
			<tr>
				<td><input type="text" name="comment" id="comment" class="full"></td>
				<td><button type="button" class="comment" id="">댓글쓰기</td>
			</tr>
		</table>
		</form>
		
		<!-- 댓글 목록 -->
		<table id="list-comment">
		<!--<tr>
				<td>
					<div>댓글 내용입니다.</div>
					<div>2023-11-03 09:21:14</div>
				</td>
				<td>
					<div>홍길동</div>
					<div>
					<button type="button" class="edit">수정</button>
					<button type="button" class="del">삭제</button>
					</div>
				</td>	
			</tr> -->
		</table>
		
		
		<div>
			<button type="button" class="back" onclick="location.href='/toy/board/list.do';">뒤로가기</button>
			
			<c:if test="${not empty id && (dto.id == id || lv =2)}">
			<button type="button" class="edit" onclick="location.href='/toy/board/edit.do?seq=${dto.seq}';">수정하기</button>
			<button type="button" class="del" onclick="location.href='/toy/board/del.do?seq=${dto.seq}';">삭제하기</button>
			</c:if>
		</div>
	</main>
	<script>
		//댓글 쓰기
		$('#addComment').click(function() {
			
			$.ajax({
				type: 'POST',
				url: '/toy/board/comment.do',
				data: {
					content: $('#comment').val(),
					bseq: ${dto.seq}
				},
				dataType: 'json',
				success: function(result) {
					alert(result.result);
					load(); //목록 새로고침					
				},
					$('#comment').val('') //초기화
				error: function(a,b,c) {
					console.log(a,b,c);
				}
				
			});
			
		});
		
		$('#comment').keydown(function() {
			if (event.keyCode == 13) { //엔터(\r)
				$('#btnComment').click();
			}
		});
		
		load();
		
		//댓글 목록 가져오기(ajax) > 화면에 출력
		function load() {
			$.ajax({
				type: 'GET',
				url: '/ajax/board/comment.do',
				data: 'bseq=부모글번호',
				dataType: 'json',
				success: function(result) {
					//result == 댓글 목록
					
					$('#list-comment tbody').html(''); //기존 내용 삭제
					
					$(result).each((index, item) => {
						//console.log(item);
						
						$('#list-comment tbody').append(`
								
							<tr>
								<td>
									<div>\${item.content}</div>
									<div>\${item.regdate}</div>
								</td>
								<td>
									<div>\${item.name}(\${item.id})</div>
									<div>
									<button type="button" class="edit">수정</button>
									<button type="button" class="del" onclick="delComment(\${item.seq});">삭제</button>
									</div>
								</td>	
							</tr>		
								
						`);
						
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		function delComment(seq) {
			//alert(seq);
			
			$.ajax({
				type: 'POST',
				url: '/toy/board/delcomment.do',
				data: 'seq=' + seq,
				dataType: 'json',
				success: function(result) {
					if (result.result == 1) {
						
						load(;) //목록 새로고침
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		
		
	</script>
</body>
</html>
