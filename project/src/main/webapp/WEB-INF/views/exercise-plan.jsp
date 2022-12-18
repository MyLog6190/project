<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@include file ="common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <div class="excercise-to-do-plan hidden">
    	
	    <div class="exercise-to-do-list">
		    <div class="exercise-to-do">
		    	<div>
			    	<span>복근</span> | <span>싯업</span>
		    	</div>
		    	<div>
			    	<i class="bi bi-trash"></i>
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
		    	</div>
		    </div>
		     
		    <hr>
		     
		    <div class="exercise-set-info">
		     
			   	<img class="exercise-img" src="/views/images/g.png">
				<div class="exercise-sets">
			    	
			    	<div class="exercise-to-do-check">
			    		<div class="excercise_set">
				    		<input class="excercise_set_count" id="set" type="number" min="0" max="5" value=""/>
				    		<label for="set"> Set </label>
				    		<input class="excercise_set_count" id="weight" type="number" min="0" max="100" value="10"/>
				    		<label for="weight"> Kg </label>
				    		<input class="excercise_set_count" id="number" type="number" min="0" max="100" value="10"/>
				    		<label for="number">횟수</label>
			    		</div>
			    		
			    		<div class="check-and-delete">
				    		<input type="checkbox" />
				    		<i class="bi bi-trash"></i>
				    		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
							  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>
			    		</div>
			    	</div>
			    	<div class="exercise-to-do-check">
			    		<div class="excercise_set">
				    		<input class="excercise_set_count" id="set" type="number" min="0" max="5" value=""/>
				    		<label for="set"> Set </label>
				    		<input class="excercise_set_count" id="weight" type="number" min="0" max="100" value="10"/>
				    		<label for="weight"> Kg </label>
				    		<input class="excercise_set_count" id="number" type="number" min="0" max="100" value="10"/>
				    		<label for="number">횟수</label>
			    		</div>
			    		
			    		<div class="check-and-delete">
				    		<input type="checkbox" />
				    		<i class="bi bi-trash"></i>
				    		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
							  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>
			    		</div>
			    	</div>
			    	<div class="exercise-to-do-check">
			    		<div class="excercise_set">
				    		<input class="excercise_set_count" id="set" type="number" min="0" max="5" value=""/>
				    		<label for="set"> Set </label>
				    		<input class="excercise_set_count" id="weight" type="number" min="0" max="100" value="10"/>
				    		<label for="weight"> Kg </label>
				    		<input class="excercise_set_count" id="number" type="number" min="0" max="100" value="10"/>
				    		<label for="number">횟수</label>
			    		</div>
			    		
			    		<div class="check-and-delete">
				    		<input type="checkbox" />
				    		<i class="bi bi-trash"></i>
				    		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
							  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
							</svg>
			    		</div>
			    	</div>
			    </div>
			 </div>
	    </div>
	    
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
      <li><a onclick="kakaoLogin()">kakao</a></li>
    </ul>
    
</main>

<div class="modal program" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">프로그램 이름</h5>
        <button type="button" class="btn-close program-close" data-bs-dismiss="modal" aria-label="Close"></button>
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

<div class="modal select-exercise light" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">운동 선택</h5>
        <button type="button" class="btn-close select-exercise-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <c:forEach items="${elist}" var="list">
		  	<div class="exercise-list">
		  		<div>
		  			<input type="checkbox">
		  			<img class="exercise-info_img" src="/views/images/g.png">
		  			<span>${list.e_name}</span>
		  		</div>
		  		<div>
		  			<i class="bi bi-bookmark"></i>
		  			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
					  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
					</svg>
		  		</div>
		    </div>
	  	</c:forEach>

	  </div>      
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">운동하러 가기</button>
      </div>
    </div>
  </div>
</div>



<script src="/views/js/exercise-plan.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script type="text/javascript">

    let btn = document.querySelector(".btn-primary");
    btn.onclick = () => {
    	 document.querySelector("#exercise").classList.remove('hidden');
    	 btn.classList.add('create-exercise-btn')
    	 let changeBtn = document.querySelector(".create-exercise-btn");
    	 changeBtn.value = "운동 계획 생성"
    	 
	     let create_exercise_btn = document.querySelector(".create-exercise-btn");
    	 if(create_exercise_btn) {
		    create_exercise_btn.onclick = () => {
		    	let select_exercise = document.querySelector(".select-exercise");
		    	select_exercise.style.display = "block";
		    }
    	 }
    };
    
    let select_exercise_close = document.querySelector(".select-exercise-close");
    select_exercise_close.onclick = (e) => {
		let select_exercise = document.querySelector(".select-exercise");
		select_exercise.style.display = "none";
	}
	
	let exercise_programs = document.querySelectorAll(".exercise-program");
	exercise_programs.forEach((exercise_program) => {
		exercise_program.onclick = (e) => {
			let program = document.querySelector(".program");
			program.style.display = "block";
		}
	})
	
	let program_close = document.querySelector(".program-close");
	program_close.onclick = (e) => {
		let program = document.querySelector(".program");
		program.style.display = "none";
	}
	
	
	
    const getGitLogin = () => {
  	  const gitUrl = "https://github.com/login/oauth/authorize";
  	  const client_id = "7825cbafe9c48e56615a";
  	  const finalUrl = gitUrl+"?client_id=" +client_id+ "&scope={read:user,user:email}";
  	  location.href = finalUrl;
    }
    
    const kakaoLogin = () => {
    	Kakao.init('6b2dc1e464413590e4c2800c17ceee7e');
    	Kakao.Auth.login({
    		  scope:'profile_nickname, profile_image, account_email, gender',
    	      success: (response) => {
    	        Kakao.API.request({
    	          url: '/v2/user/me',
    	          success: (response) => {
    	        	  const kakao_account = response.kakao_account;
    	        	  console.log(kakao_account);
    	        	  console.log(kakao_account.email );
    	        	  console.log(kakao_account.gender );
    	        	  console.log(kakao_account.profile.profile_image_url );
    	        	  console.log(kakao_account.profile.nickname );
    	          },
    	          fail: (error) => {
    	            console.log(error)
    	          },
    	        })
    	      },
    	      fail: (error) => {
    	        console.log(error)
    	      },
    	 });
    }
</script>
<%@include file ="common/footer.jsp" %>
