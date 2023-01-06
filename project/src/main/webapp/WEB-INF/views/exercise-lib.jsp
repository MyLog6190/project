<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 라이브러리</title>

<link rel="stylesheet" href="/views/css/exercise-lib.css">
</head>
<body>
  <%@include file="common/header.jsp"%>
  <!-- Start: Features Section 7
  ====================================== -->
<<<<<<< HEAD
  <div class="d-flex justify-content-center">
  <div class="main-container">

	  <div class="lib-container">
	    <div id="title-container">
	      <div id="libs">
	        <div id="libs-title">운동 라이브러리</div>
	      </div>
	    </div>
	    <div id="lib-container">
	      <div id="finder-container">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
	        <input type="text" id="finder" value="" placeholder="찾으시는 운동을 검색해보세요." />
	      </div>
	      <div id="filter-container">
	        <input name="filter" id="all" type="radio" checked><label class="exercise-field" data-filter="all" for="all">필터 해제</label>
	        <input name="filter" id="bookmark" type="radio"><label class="exercise-field" data-filter="bookmark" for="bookmark">북마크</label>
	        <input name="filter" id="leg" type="radio"><label class="exercise-field" data-filter="하체" for="leg">하체</label>
	        <input name="filter" id="chest" type="radio"><label class="exercise-field" data-filter="가슴" for="chest">가슴</label>
	        <input name="filter" id="back" type="radio"><label class="exercise-field" data-filter="등" for="back">등</label>
	        <input name="filter" id="delt" type="radio"><label class="exercise-field" data-filter="어깨" for="delt">어깨</label>
	        <input name="filter" id="arm" type="radio"><label class="exercise-field" data-filter="팔" for="arm">팔</label>
	        <input name="filter" id="abs" type="radio"><label class="exercise-field" data-filter="복근" for="abs">복근</label>
	      </div>
	      <div class="exercise-lib-container flex-wrap">
	        <c:forEach items="${elist }" var="list">

 	          <div class="exercise-libs ${list.c_name } <c:forEach items="${bookmark}" var="bookmark"><c:if test="${bookmark.user_id eq login.user.user_id }"><c:if test="${bookmark.e_no == list.e_no}">bookmark</c:if></c:if></c:forEach>"
 	          		data-bs-toggle="modal" data-bs-target="#${list.e_no}">
	            <div class="d-flex flex-column justify-content-between">
	              <img class="libs-image" src="${list.e_img }" />
	              <div class="libs-name">${list.e_name }</div>
	              <div class="bookmark-container">
	                <svg class="bi cursor-pointer" data-e_no=${list.e_no } data-c_name="${list.c_name }" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
	                 <path d="" />               
	                </svg>
	              </div>
                
	            </div>
	          </div>
	          <div class="modal detail-container fade" id="${list.e_no }" tabindex="-1" aria-labelledby="${list.e_no }ModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
				  <div class="modal-content">
				    <div class="modal-header">
				      <h1 class="modal-title fs-5" id="${list.e_no }ModalLabel">${list.e_name }</h1>
				      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				    </div>
				    <div class="modal-body">
				      <div class="details"><img class="libs-image" src="${list.e_img }" /></div>
		              <div class="d-flex justify-content-center">
		                <div class="box-ex">도구</div>
		                <div class="box-ex">타입</div>
		              </div>
		              <div class="details">${list.e_content }</div>
		              <div class="details">
		                <a class="btn btn-secondary" target="_blank"
		                  href="https://www.youtube.com/results?search_query=${list.e_name } 운동 방법">
		                  유튜브 검색
		                </a>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
			  	</div>
			  </div>

=======
  <div class="main-container">
	  <div class="lib-container">
	    <div id="title-container">
	      <div id="libs">
	        <div id="libs-title">운동 라이브러리</div>
	      </div>
	    </div>
	    <div id="lib-container">
	      <div id="finder-container">
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
	        <input type="text" id="finder" value="" placeholder="찾으시는 운동을 검색해보세요." />
	      </div>
	      <div id="filter-container">
	        <input name="filter" id="all" type="radio" checked><label class="exercise-field" data-filter="all" for="all">필터 해제</label>
	        <input name="filter" id="bookmark" type="radio"><label class="exercise-field" data-filter="bookmark" for="bookmark">북마크</label>
	        <input name="filter" id="leg" type="radio"><label class="exercise-field" data-filter="하체" for="leg">하체</label>
	        <input name="filter" id="chest" type="radio"><label class="exercise-field" data-filter="가슴" for="chest">가슴</label>
	        <input name="filter" id="back" type="radio"><label class="exercise-field" data-filter="등" for="back">등</label>
	        <input name="filter" id="delt" type="radio"><label class="exercise-field" data-filter="어깨" for="delt">어깨</label>
	        <input name="filter" id="arm" type="radio"><label class="exercise-field" data-filter="팔" for="arm">팔</label>
	        <input name="filter" id="abs" type="radio"><label class="exercise-field" data-filter="복근" for="abs">복근</label>
	      </div>
	      <div class="exercise-lib-container">
	        <c:forEach items="${elist }" var="list">
	          <div class="exercise-libs ${list.c_name } <c:forEach items="${bookmark}" var="bookmark"><c:if test="${bookmark.user_id eq login.user.user_id }"><c:if test="${bookmark.e_no == list.e_no}">bookmark</c:if></c:if></c:forEach>">
	            <div class="d-flex flex-row justify-content-between">
	              <img class="libs-image" src="${list.e_img }" />
	              <div class="libs-name">${list.e_name }</div>
	              <div class="bookmark-container">
	
	                <svg class="bi cursor-pointer" data-e_no=${list.e_no } data-c_name="${list.c_name }" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
	                
	                 <path d=""></path>
	                
	                </svg>
	                <svg class="libs-detail bi bi-chevron-down" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" viewBox="0 0 16 16">
	                  <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
	                </svg>
	              </div>
	            </div>
	          
	            <div class="detail-container d-none">
	              <div class="details"><img class="libs-image" src="${list.e_img }" /></div>
	              <div class="d-flex justify-content-evenly">
	                <div class="box-ex">도구</div>
	                <div class="box-ex">타입</div>
	              </div>
	              <div class="details">${list.e_content }</div>
	              <div class="details">
	              <a class="btn btn-secondary" target="_blank"
	                  href="https://www.youtube.com/results?search_query=${list.e_name } 운동 방법">
	                유튜브 검색
	              </a>
	              </div><!-- 버튼 action, 이름 붙여서 검색 -->
	            </div>
	          </div>
>>>>>>> branch 'master' of https://github.com/MyLog6190/project
	        </c:forEach>
	      </div>
	    </div>
	  </div>
  </div>
</div>
  <!-- End: Features Section 7
  ================================ -->
  <%@include file="common/footer.jsp"%>
  
  
  <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  
  <script type="text/javascript" src="/views/js/exercise-lib.js"></script>
  <script src="/views/js/darkMode.js"></script>
</body>

</html>