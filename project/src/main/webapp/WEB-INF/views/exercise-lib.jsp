<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/views/css/exercise-lib.css">
</head>
<body>
  <%@include file="common/header.jsp"%>
  <!-- Start: Features Section 7
  ====================================== -->
  <div class="container">
    <div id="title-container">
      <div id="libs">
        <div id="libs-title">운동 라이브러리</div>
      </div>
    </div>
    <div id="lib-container">
      <div id="finder-container">
        <img src="/views/icons/libicons/magnifying-glass.png" class="finder-img" />
        <input type="text" id="finder" value="" placeholder="찾으시는 운동을 검색해보세요." />
      </div>
      <div id="filter-container">
        <input name="filter" id="all" type="radio" checked><label class="exercise-field" data-filter="all" for="all">필터 해제</label>
        <input name="filter" id="bookmark" type="radio"><label class="exercise-field" data-filter="bookmark" for="bookmark">북마크</label>
        <input name="filter" id="leg" type="radio"><label class="exercise-field" data-filter="leg" for="leg">하체</label>
        <input name="filter" id="chest" type="radio"><label class="exercise-field" data-filter="chest" for="chest">가슴</label>
        <input name="filter" id="back" type="radio"><label class="exercise-field" data-filter="back" for="back">등</label>
        <input name="filter" id="delt" type="radio"><label class="exercise-field" data-filter="delt" for="delt">어깨</label>
        <input name="filter" id="arm" type="radio"><label class="exercise-field" data-filter="arm" for="arm">팔</label>
        <input name="filter" id="abs" type="radio"><label class="exercise-field" data-filter="abs" for="abs">복근</label>
      </div>
      <div class="exercise-lib-container">
      	<c:forEach items="${ellist }" var="list">
          <div class="exercise-libs ${list.cname }">
            <div class="d-flex flex-row justify-content-between">
              <img class="libs-image" src="/views${list.elImg }" />
              <div class="libs-name">${list.elName }</div>
              <div class="d-flex align-items-center">
                <c:if test=""></c:if>
                <svg class="" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
                <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
                </svg>
                <img class="libs-detail" src="/views/icons/libicons/down-arrow.png" />
              </div>
            </div>
          
            <div class="detail-container d-none">
              <div class="details">사진</div>
              <div class="d-flex justify-content-evenly">
                <div class="box-ex">도구</div>
                <div class="box-ex">타입</div>
              </div>
              <div class="details">${list.elDetail }</div>
              <div class="details">
              <a class="btn btn-secondary" target="_blank"
                  href="https://www.youtube.com/results?search_query=${list.elName} 운동 방법">
                유튜브 검색
              </a>
              </div><!-- 버튼 action, 이름 붙여서 검색 -->
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

  <!-- End: Features Section 7
  ================================ -->
  <%@include file="common/footer.jsp"%>
  <script type="text/javascript" src="/views/js/exercise-lib.js"></script>

</body>

</html>