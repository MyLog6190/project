<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/views/css/mypage.css">
</head>
<body>
<%@include file ="common/loginheader.jsp" %>
<h1>마이 페이지</h1>
<div class="container1">
<img class="user_size" src="/views/images/mypageimages/usericon.png" alt="사용자사진">
<span class="user_name_size">홍길동</span>
</div>

<div class="contatiner2">
<span>주차별 목표 달성량</span>
<button class="detail-btn">상세보기</button>
</div>
<span>주간 몸무게 변화</span>
<button class="detail-btn">상세보기</button>
</body>
</html>