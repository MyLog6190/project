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
          <div class="exercise-libs ${list.cname } <c:if test="${list.bookmark eq true }">bookmark</c:if>">
            <div class="d-flex flex-row justify-content-between">
              <img class="libs-image" src="/views${list.elImg }" />
              <div class="libs-name">${list.elName }</div>
              <div class="d-flex align-items-center">
                <c:choose>
                  <c:when test="${list.bookmark eq false }">
                    <svg class="bi bi-bookmark" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
    				  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"></path>
    				</svg>
                  </c:when>
                  <c:otherwise>
                    <svg class="bi bi-bookmark-fill" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
                      <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
                    </svg>
                  </c:otherwise>
                </c:choose>
                <svg class="libs-detail bi bi-chevron-down" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
                </svg>
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
                  href="https://www.youtube.com/results?search_query=${list.elName } 운동 방법">
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
  
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  
  <script type="text/javascript" src="/views/js/exercise-lib.js"></script>

</body>

</html>