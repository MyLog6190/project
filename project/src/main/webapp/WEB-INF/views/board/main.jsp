<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>고객센터</title>
<link rel="stylesheet" href="/views/css/board-main.css">

</head>
<body>
  <%@include file="../common/header.jsp"%>
<div class="MainBanner_main_banner">
  <a class="MainBanner_main_banner_1" href="/board">번핏 고객센터</a>
  <div class="MainBanner_main_banner_2">궁금한 점은 쉽고 빠르게 검색하세요
    <div class="Search_search">
      <div class = "Search_search_area">
  	    <div class="Search_search_box">
  		  <input type="text" name="query" placeholder="내용을 입력하세요." autocomplete="off" class="Search_search_input" value="" title="내용을 입력하세요.">
  		  <button type="button" class="Search_btn_search"><span class="blind">검색</span></button>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="TopTitle">공지 사항</div>
<div class="Notice_notice_box">
  <c:forEach items="${list }" var="list" begin="0" end="2">
  <c:choose>
  <c:when test="${list.b_tag eq 'notice' }">
  <div class="Notice_item">
    <span class="Notice_badge">${list.b_tag }</span>
    <a class="Notice_text" href="/board/read?b_no=${list.b_no }">${list.b_title }</a>
  </div>
  </c:when>
  </c:choose>
  </c:forEach>
</div>
<div class="Notice_item">
  <a class="Notice_all" href="/board/list">공지 전체보기..</a>
</div>

<div class="MidTitle_mid_title">자주 찾는 도움말</div>
<div class="FilterTab_button_list">
  <a href="/board/help/">전체</a>
  <a href="/board/help/">계정 관리</a>
  <a href="/board/help/">도용·보안</a>
  <a href="/board/help/">이용제한</a>
  <a href="/board/help/">결제·환불</a>
  <a href="/board/help/">공지사항</a>
  <a href="/board/help/">추천운동</a>
</div>

<div class="FilterTab_box_list">
  <a href="/board/help/">Q. 살빼기 좋은 유산소 운동</a>
  <a href="/board/help/">Q. 상급자용 운동코스/운동량</a>
  <a href="/board/help/">Q. 근육을 크게 키우고 싶어요</a>
  <a href="/board/help/">Q. 헬스는 처음이에요</a>
  <a href="/board/help/">Q. 환불을 받고 싶어요</a>
  <a href="/board/help/">Q. 코어 근육을 키우려면..</a>
  <a href="/board/help/">Q. 현금 영수증 발급 받는법</a> 
  <a href="/board/help/">Q. 아이디/비번이 생각이 안나요</a> 
</div>


  <%@include file="../common/footer.jsp"%>
</body>
</html>