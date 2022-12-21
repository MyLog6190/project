<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../common/header.jsp" %>
</head>
<body>
<div class="container">
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">말머리</th>
      <th scope="col">제목</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list }" var="list">
    <tr>
      <th scope="row">${list.b_no }</th>
      <td>${list.b_tag }</td>
      <td><a href="/board/${list.b_no }">${list.b_title }</a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>
<div class="d-flex justify-content-end">
  <a href="/board/post" class="mx-2 btn btn-primary">글 등록</a>
  </div>
</div>
</body>
<%@ include file="../common/footer.jsp" %>
</html>