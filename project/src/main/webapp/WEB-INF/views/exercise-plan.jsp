<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file ="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/views/css/exercise-plan.css" />
<main>
  <div class="pick">
    <div class="calendar">
      <div class="calendar-header">
        <span class="month-pricker" id="month-picker"></span>

        <div class="year-picker">
          <span class="year-change" id="prev-year"> < </span>
          <span id="year" class="year"></span>
          <span class="year-change" id="next-year"> > </span>
        </div>
      </div>

      <div class="calendar-body">
        <div class="calendar-week-day">
          <div>일</div>
          <div>월</div>
          <div>화</div>
          <div>수</div>
          <div>목</div>
          <div>금</div>
          <div>토</div>
        </div>
        <div class="calendar-days"></div>
      </div>

      <div class="calendar-footer">
      </div>
    </div>
    
  </div>
  
  <div class="exercise-plan">
  	<div>
      <h3 id="date-to-plan"></h3>
    </div>
    
    <div class="excercise-to-do-plan hidden"></div>
    <input type="button" class="btn btn-primary" value='운동 계획하기'/>
  
    <div id="exercise" class="exercise hidden"></div>
  </div>
    
</main>

<div class="modal program" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">프로그램 이름</h5>
        <button type="button" class="btn-close program-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	  	<div class="exercise-program-list"></div>
	  </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary insert-program-btn">운동하러 가기</button>
      </div>
    </div>
  </div>
</div>

<div class="modal select-exercise" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">운동 선택</h5>
        <button type="button" class="btn-close select-exercise-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body select-exercise-body">
	  	<div class="exercise-to-do-list"></div>
	  </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary select-exercise-btn">운동하러 가기</button>
      </div>
    </div>
  </div>
</div>



<script src="/views/js/exercise-plan.js"></script>
<script src="/views/js/darkMode.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
<%@include file ="common/footer.jsp" %>
