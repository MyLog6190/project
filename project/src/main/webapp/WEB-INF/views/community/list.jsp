<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/views/css/board-list.css" />
</head>
<body>
	<div class="container">
    	<div class='main-container'>
			<h1>커뮤니티</h1>
			<div class="tag">
				<span>전체</span>
				<span>자유게시판</span>
				<span>운동식단</span>
				<span>정보공유</span>
				<span>질문&답변</span>
				<span>바디체크</span>
			</div>
			<hr>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col" colspan="2">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">작성일</th>
			    </tr>
			  </thead>
			  <tbody>
				  <c:forEach items="${Community}" var="list">
				    <tr>
				      <th class='board-title'>
				      	<div class='board-tag'>
				      		${list.cb_tag }
				      	</div>
				      </th>
				      <td>
				      	<div>
					      	<a href="/community/read?no=${list.cb_no }" class="text-decoration-none">${list.cb_title }</a>
				      	</div>
				      </td>
				      <td>
				      	<div>
				      		 ${list.cb_writer }
				      	</div>
				      </td>
				      <td>
				      	<div>
				      		${list.cb_date }
				      	</div>
				      </td>
				    </tr>
				  </c:forEach>
			  </tbody>
			</table>
			
			<div class="d-flex justify-content-end insert-notice">
			  <a href="/community/writing" class="mx-2 btn btn-primary">글 등록</a>
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
<script src="/views/js/darkMode.js"></script>
<%@ include file="../common/footer.jsp" %>
</html>