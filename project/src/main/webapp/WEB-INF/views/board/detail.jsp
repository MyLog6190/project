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
	  <input type="hidden" name="b_no" value="<c:out value='${detail.b_no}'></c:out>">
	  <input type="hidden" name="page"  value="${pageRequestDTO.page}">
	  <div class="input-group mb-3 mx-3">
	  	<span class="input-group-text">제목 </span>
	  	<input name="b_title" class="form-control" name="b_title" value="<c:out value='${detail.b_title}'></c:out>" readonly>
	  </div>
	  
	  <div class="input-group mb-3 mx-3 notice-content">
	  <span class="input-group-text">내용 </span>
	    <input name="b_content" class="form-control" name="b_title" value="${detail.b_content}" readonly>
	  </div>
	  
	
	  <div class="d-flex justify-content-end">
	    <button type="submit" class="btn btn-primary">수정</button>
	    <button type="submit" class="btn btn-success">삭제</button>
	    <a href="/board/list?${pageRequestDTO.link}" class="mx-2 btn btn-secondary">목록</a>
	  </div>
	
	</form>
</div>
<%@include file="../common/footer.jsp"%>
  <script>
  document.querySelector(".btn-primary").addEventListener("click", e=>{
	  let f = document.querySelector('form');
	  f.setAttribute('method', 'get');
	  f.setAttribute('action', '/board/update');
	  f.submit();
  })
  
  
  document.querySelector(".btn-success").addEventListener("click", e=>{
	  let f = document.querySelector('form');
	  f.setAttribute('method', 'post');
	  f.setAttribute('action', '/board/delete');
	  f.submit();
  })

  
  
  /* "?b_no=${detail.b_no}&${pageRequestDTO.link}"
		  ="/board/list?${pageRequestDTO.link}"
		  */
  </script>
</body>
<script src="/views/js/darkMode.js"></script>
</html>