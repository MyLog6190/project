<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/views/css/board-input.css" />
</head>
<body>
<div class='main-container'>
	<form class="insert-notice-form" method="POST" action="/community/edit">
	
	  <input type="hidden" name="cb_no" value="${community.cb_no }"></input>
	  <%-- <input type="hidden" name="page" value="${pageRequestDTO.page }"></input> --%>
	
	  <div class="mb-3 mx-3">
	    <label for="cb_title" class="form-label">제목</label>
	    <input type="text" class="form-control" name="cb_title" id="cb_title" value="${community.cb_title}">
	  </div>
	  <hr>
	  <div class="mb-3 mx-3">
	   <label for="cb_title" class="form-label">말머리 선택</label>
	    <select name="cb_tag" class="form-select" aria-label="Default select example">
	      <option value="자유게시판">자유게시판</option>
	      <option value="운동식단">운동식단</option>
	      <option value="정보공유">정보공유</option>
	      <option value="질문&답변">질문&답변</option>
	      <option value="바디체크">바디체크</option>
	    </select>
	  </div>
	  
	  <div class="mb-3 mx-3 ">
	    <label for="cb_content" class="form-label ">내용</label>
	    <textarea class="form-control update-notice-content" name="cb_content" id="cb_content" rows="5">${community.cb_content}</textarea>
	  </div>
	  
	  <div class="d-flex justify-content-end">
	    <button type="submit" class="mx-2 btn btn-primary">등록</button>
	    <button type="reset" class="mx-2 btn btn-secondary">초기화</button>
	    <a href="/board/read?no=${community.cb_no}" class="mx-2 btn btn-success">취소</a>
	  </div>
	
	</form>
</div>
<%@include file="../common/footer.jsp"%>
</body>
<script src="/views/js/darkMode.js"></script>
</html>
