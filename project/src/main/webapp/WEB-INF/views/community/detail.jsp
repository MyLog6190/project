<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="/views/css/board-detail.css" />
</head>
<body>
<div class='main-container'>
	<form class="insert-notice-form" action="" method="get">
	  <input type="hidden" name="cb_no" value="value='${community.cb_no}'">
	  <%-- <input type="hidden" name="page"  value="${pageRequestDTO.page}"> --%>
	  <div class="input-group mb-3 mx-3">
	  	<span class="input-group-text">제목 </span>
	  	<input name="cb_title" class="form-control" value="${community.cb_title}" readonly>
	  </div>
	  
	  <div class="input-group mb-3 mx-3 notice-content">
	  <span class="input-group-text">내용 </span>
	    <input name="cb_content" class="form-control" name="cb_title" value="${community.cb_content}" readonly>
	  </div>
	  
	
	  <div class="d-flex justify-content-end">
	    <a href="/community/edit/?no=${community.cb_no}" class="btn btn-primary">수정</a>
	    <a href="/community/delete/?no=${community.cb_no}" class="btn btn-success">삭제</a>
	    <a href="/community" class="mx-2 btn btn-secondary">목록</a>
	  </div>
	
	</form>
</div>
<%@include file="../common/footer.jsp"%>
</body>
<script src="/views/js/darkMode.js"></script>
</html>