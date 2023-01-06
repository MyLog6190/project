<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/views/css/board-list.css" />
</head>
<body>
<div class="container">
	
	<div class='main-container'>
		<h1>공지 사항</h1>
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col" colspan="2">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach items="${responseDTO.dtoList }" var="list">
			    <tr>
			      <th class='board-title'>
			      	<div class='board-tag'>
			      		${list.b_tag }
			      	</div>
			      </th>
			      <td>
			      	<div>
				      	<a href="/board/read?b_no=${list.b_no }&${pageRequestDTO.link}" class="text-decoration-none" data-b-no="${list.b_no }">${list.b_title }</a>
			      	</div>
			      </td>
			      <td>
			      	<div>
			      		 ${list.b_tag }
			      	</div>
			      </td>
			      <td>
			      	<div>
<<<<<<< HEAD
			      		${list.b_date }
=======
>>>>>>> branch 'master' of https://github.com/MyLog6190/project
			      	</div>
			      </td>
			    </tr>
			  </c:forEach>
		  </tbody>
		  
		
		</table>
		<div class="d-flex justify-content-end insert-notice">
		  <a href="/board/post" class="mx-2 btn btn-primary">글 등록</a>
		</div>
		<div class="pagination-div">
			<ul class="pagination flex-wrap">
				<c:if test="${responseDTO.prev}">
					<li class="page-item">
						<a class="page-link" data-num="${responseDTO.start-1}">&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${responseDTO.start }" end="${responseDTO.end }" var="num">
					<li class ="page-item ${responseDTO.page == num ? 'active': '' }"><a class="page-link" data-num="${num }">${num }</a>
				</c:forEach> 
						<c:if test="${responseDTO.next}">
					<li class="page-item">
						<a class="page-link" data-num="${responseDTO.end+1 }">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
</body>
<script>
document.querySelector(".pagination").addEventListener("click", e=>{
	e.preventDefault()
	e.stopPropagation()
	
	const target = e.target
	console.log(target.tagName)
	if(target.tagName !== 'A'){
		return
	}
	
	const num = target.getAttribute("data-num")
	location.href =`/board/list?page=\${num}`
}, false)


</script>
<script src="/views/js/darkMode.js"></script>
<%@ include file="../common/footer.jsp" %>
</html>