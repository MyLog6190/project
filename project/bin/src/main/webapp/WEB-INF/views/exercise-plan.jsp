<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@include file ="common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/views/css/exercise-plan.css" />
<main class="light">
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
        <div class="toggle">
          <span>Dark Mode</span>
          <div class="dark-mode-switch">
            <div class="dark-mode-switch-ident"></div>
          </div>
        </div>
      </div>
    </div>
    
  </div>
  <div class="exercise-plan">
  	<div>
      <h3 id="date-to-plan"></h3>
      <input type="button" class="btn btn-primary" value='운동 계획하기'/>
    </div>
    
    <div id="exercise" class="exercise hidden">
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h5>프로그램 이름</h5>
		</div>
		
    </div>
  </div>
    <ul>
      <li><a onclick="getGitLogin()">git</a></li>
    </ul>
    
</main>
<div class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">프로그램 이름</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	  	<div class="exercise-program-list">
	  		<div class="exercise-info">
	  			<img class="exercise-info_img" src="/views/images/g.png">
		  		<div>
		  			<h4>운동 종목</h4>
		  			<span>3set X 15reps</span>
		  		</div>
	  		</div>
	  		<div class="exercise-info">
	  			<img class="exercise-info_img" src="/views/images/g.png">
		  		<div>
		  			<h4>운동 종목</h4>
		  			<span>3set X 15reps</span>
		  		</div>
	  		</div>
	  		<div class="exercise-info">
	  			<img class="exercise-info_img" src="/views/images/g.png">
		  		<div>
		  			<h4>운동 종목</h4>
		  			<span>3set X 15reps</span>
		  		</div>
	  		</div>
	  		<div class="exercise-info">
	  			<img class="exercise-info_img" src="/views/images/g.png">
		  		<div>
		  			<h4>운동 종목</h4>
		  			<span>3set X 15reps</span>
		  		</div>
	  		</div>
	  		<div class="exercise-info">
	  			<img class="exercise-info_img" src="/views/images/g.png">
		  		<div>
		  			<h4>운동 종목</h4>
		  			<span>3set X 15reps</span>
		  		</div>
	  		</div>
	    </div>
	  </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">운동하러 가기</button>
      </div>
    </div>
  </div>
</div>

<script src="/views/js/exercise-plan.js"></script>
<script type="text/javascript">

    let btn = document.querySelector(".btn-primary")
    btn.onclick = () => {
    	 document.querySelector("#exercise").classList.remove('hidden');
    	 btn.classList.add('create-exercise-btn')
    	 let changeBtn = document.querySelector(".create-exercise-btn")
    	 changeBtn.value = "운동 계획 생성"
    };
    
	let exercise_programs = document.querySelectorAll(".exercise-program");
	exercise_programs.forEach((exercise_program) => {
		exercise_program.onclick = (e) => {
			let modal = document.querySelector(".modal");
			modal.style.display = "block";
		}
	})
	
	let btn_close = document.querySelector(".btn-close");
	btn_close.onclick = (e) => {
		let modal = document.querySelector(".modal");
		modal.style.display = "none";
	}
    const getGitLogin = () => {
  	  const gitUrl = "https://github.com/login/oauth/authorize";
  	  const client_id = "7825cbafe9c48e56615a";
  	  const finalUrl = gitUrl+"?client_id=" +client_id+ "&scope={read:user,user:email}";
  	  location.href = finalUrl;
    }
</script>
<%@include file ="common/footer.jsp" %>
