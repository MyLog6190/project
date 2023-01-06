<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="/views/css/board-input.css" />
</head>
<body>
<div class='main-container'>

	<form class="insert-notice-form" method="POST" action="/board/update">
	
	  <input type="hidden" name="b_no" value="${detail.b_no }"></input>
	
	  <input type="hidden" name="page" value="${pageRequestDTO.page }"></input>
	
	  <div class="mb-3 mx-3">
	    <label for="b_title" class="form-label">제목</label>
	    <input type="text" class="form-control" name="b_title" id="b_title" value="${detail.b_title}">
	  </div>
	  <hr>
	  
	  <div class="mb-3 mx-3">
	   <label for="b_title" class="form-label">말머리 선택</label>
	    <select name="b_tag" class="form-select" aria-label="Default select example">
	    
	      <option value="none">없음</option>
	      <option value="공지">공지</option>
	      <option value="점검">점검</option>
	      <option value="서비스">서비스</option>
	    </select>
	  </div>
	  
	  
	  <div class="mb-3 mx-3 ">
	    <label for="b_content" class="form-label">내용</label>
	    <textarea class="form-control update-notice-content" name="b_content" id="b_content" rows="5">${detail.b_content}</textarea>
	  </div>
	  
	  <div class="d-flex justify-content-end">
	    <button type="submit" class="mx-2 btn btn-primary">등록</button>
	    <button type="reset" class="mx-2 btn btn-secondary">초기화</button>
	    <a href="/board/read?b_no=${detail.b_no}&${pageRequestDTO.link}" class="mx-2 btn btn-success">취소</a>
	  </div>
	
	</form>

</div>
  <%@include file="../common/footer.jsp"%>
  <script>
   	const options = document.querySelectorAll("option");

  	options.forEach(opt=>{
  		const v = opt.getAttribute("value");
  		console.log(v === `${detail.b_tag}`)
   		if(v === `${detail.b_tag}`){
  			opt.setAttribute("selected","selected");
  		}
  		
  	})
  </script>
</body>
<script src="/views/js/darkMode.js"></script>
</html>