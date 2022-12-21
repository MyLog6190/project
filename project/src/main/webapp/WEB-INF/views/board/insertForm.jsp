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

  <input type="hidden" name="b_tag" value="notice"></input>
  <div class="mb-3 mx-3">
    <label for="b_title" class="form-label">제목</label>
    <input type="text" class="form-control" name="b_title" id="b_title">
  </div>
  <hr>
  
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