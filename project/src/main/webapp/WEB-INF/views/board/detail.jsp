<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<body>
  <%@include file="../common/header.jsp"%>

<div class="container">
  <div class="mb-3 mx-3">
  <label for="user_id" class="form-label">제목: ${detail.b_title}</label>
  </div>
  <hr>
  
  <div class="mb-3 mx-3">
    <label for="password" class="form-label">${detail.b_content}</label>
  </div>
  
  <div class="d-flex justify-content-end">
    <a href="/board/update/${detail.b_no }" class="btn btn-primary">수정</a>
    <a href="/board/delete/${detail.b_no }" class="mx-2 btn btn-success">삭제</a>
    <a href="/board/list" class="btn btn-secondary">목록으로 돌아가기</a>
  </div>

</div>
  <%@include file="../common/footer.jsp"%>
</body>
</html>