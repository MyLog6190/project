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

<form class="container" method="POST" action="/board/insert">

  <div class="mb-3 mx-3">
    <label for="b_title" class="form-label">제목</label>
    <input type="text" class="form-control" name="b_title" id="b_title">
  </div>
  <hr>
  <div class="mb-3 mx-3">
   <label for="b_title" class="form-label">말머리 선택</label>
    <select name="b_tag" class="form-select" aria-label="Default select example">
      <option value="" selected>없음</option>
      <option value="notice">공지</option>
      <option value="maintenance">점검</option>
      <option value="service">서비스</option>
    </select>
  </div>
  
  <div class="mb-3 mx-3">
    <label for="b_content" class="form-label">내용</label>
    <textarea class="form-control" name="b_content" id="b_content" rows="5"></textarea>
  </div>
  
  <div class="d-flex justify-content-end">
    <button type="submit" class="mx-2 btn btn-primary">등록</button>
    <button type="reset" class="mx-2 btn btn-secondary">초기화</button>
    <a href="/board/list" class="mx-2 btn btn-success">취소</a>
  </div>

</form>
  <%@include file="../common/footer.jsp"%>
</body>
</html>