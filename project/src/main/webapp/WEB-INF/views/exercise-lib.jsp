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
          <div class="exercise-libs leg">
            <div class="d-flex flex-row justify-content-between">
         	
              <img class="libs-image" src="/views/images/libimages/leg/1.png" />
              <div class="libs-name">${list.elName }</div>
              <img class="libs-detail" src="/views/icons/libicons/down-arrow.png" />
            
            </div>
          
            <div class="detail-container d-none">
              <div class="details">${list.elImg }</div>
              <div class="details">${list.elDetail }</div>
              <div class="details">유튜브 검색</div><!-- 버튼 action, 이름 붙여서 검색 -->
            </div>
          </div>
        </c:forEach>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">컨벤셔널 데드리프트</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">프론트 스쿼트</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 컬</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 익스텐션</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">인플라인 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">덤벨 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">인플라인 덤벨 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- End: Features Section 7
  ================================ -->
  <%@include file="common/footer.jsp"%>
  <script type="text/javascript" src="/views/js/exercise-lib.js"></script>

</body>

</html>