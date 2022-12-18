<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
<script src="/views/js/mypage-graph.js"></script>
<div class="container2">
 <div class="zt-span6 last">
<p>&nbsp;</p>
<p>&nbsp;</p>
<h3><strong>목표 달성량</strong></h3>
<div class="zt-skill-bar"><div data-width="88" style="">이두<span>88%</span></div></div>
<div class="zt-skill-bar"><div data-width="92" style="">등<span>92%</span></div></div>
<div class="zt-skill-bar"><div data-width="82" style=";">어깨<span>82%</span></div></div>
<div class="zt-skill-bar"><div data-width="85" style=";">허벅지<span>85%</span></div></div>
<div class="zt-skill-bar"><div data-width="60" style=";">종아리<span>60%</span></div></div></div>
</div>
<div class="container2">
<span>주차별 목표 달성량</span>
<button class="detail-btn">상세보기</button>
</div>
<div class="container3">
<span>주간 몸무게 변화</span>
<button class="detail-btn">상세보기</button>
</div>
<%@include file ="common/footer.jsp" %>
</body>
</html>