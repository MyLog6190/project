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
			<h3>프로그램 이름</h3>
		</div>
		<div class="exercise-program">
			<img class="exercise_program_img" src="/views/images/g.png">
			<h3>프로그램 이름</h3>
		</div>    
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h3>프로그램 이름</h3>
		</div>
		<div class="exercise-program">
			<img class="exercise_program_img" src="/views/images/g.png">
			<h3>프로그램 이름</h3>
		</div>
		<div class="exercise-program" >
			<img class="exercise_program_img" src="/views/images/g.png">
			<h3>프로그램 이름</h3>    
		</div>
		<div class="exercise-program">
			<img class="exercise_program_img" src="/views/images/g.png">
			<h3>프로그램 이름</h3>
		</div>    
    </div>
  </div>
  
  <div class="exercise-list">
  	
  </div>
    <ul>
      <li><a onclick="getGitLogin()">git</a></li>
    </ul>
</main>
<script type="text/javascript">
    document.querySelector(".dark-mode-switch").onclick = () => {
      document.querySelector("main").classList.toggle("dark");
      document.querySelector("main").classList.toggle("light");
    };
    const today = new Date()

    const dateFormat = (date) => {
  	  let month = date.getMonth() + 1;
        let day = date.getDate();

        return date.getFullYear()+'년\t'+ month+ '월\t' + day + '일'
    }

    dateFormat(today)

    let dateToPlan = document.querySelector('#date-to-plan')
    dateToPlan.innerHTML = dateFormat(today);

    let year = today.getFullYear();
    let month = today.getMonth();

    let yearPicker = document.querySelector("#year");
    yearPicker.innerHTML = year;

    let monthPicker = document.querySelector("#month-picker");
    monthPicker.innerHTML = month + 1 + "월";


    let prev = document.querySelector("#prev-year");

    prev.onclick = () => {
      if (month == 0) {
        --year;
        month = 11;
        yearPicker.innerHTML = year;
      } else {
        --month;
      }

      printDay(year, month);
      selectPlanDate();
      monthPicker.innerHTML = month + 1 + "월";
    };

    let next = document.querySelector("#next-year");

    next.onclick = () => {
      if (month == 11) {
        ++year;
        month = 0;
        yearPicker.innerHTML = year;
      } else {
        ++month;
      }

      printDay(year, month);
      selectPlanDate();
      monthPicker.innerHTML = month + 1 + "월";
    };

    const getFirstDay = (year, month) => {
      const date = new Date(year, month, 1);
      return date.getDay();
    };

    const getLastDay = (year, month) => {
      const date = new Date(year, month + 1, 0);
      return date.getDate();
    };

    const printDay = (year, month) => {
      let calendarDays = document.querySelector(".calendar-days");
      calendarDays.innerHTML = "";
      const firstDay = getFirstDay(year, month);
      const LastDay = getLastDay(year, month);

      for (let i = 1; i < LastDay + firstDay + 1; i++) {
        const day = document.createElement("div");
        calendarDays.appendChild(day);
        if (i >= firstDay + 1) {
          day.classList.add("day");
          day.classList.add("calendar-day-hover");
          let or = i - firstDay >= 10 ? "" : "0";
          day.setAttribute("id", year + "-" + (month + 1) +"-" + or + (i - firstDay));
          day.innerHTML = i - firstDay;
          day.innerHTML += `
  		                <span></span>
  		                <span></span>
  		                <span></span>
  		                <span></span>
  	                `;
        }
      }
    };

    printDay(year, month);

    /* ------- */
    const selectPlanDate = () => {
  	  let days = document.querySelectorAll('.day')
  	  days.forEach((day) => {
  		 day.onclick = (e) => {
  			 let id = e.target.id;
  			 console.log(id)
  			 dateToPlan.innerHTML = dateFormat(new Date(id));
  		 }
  	  });
    }

    selectPlanDate();

    let btn = document.querySelector(".btn-primary")
    btn.onclick = () => {
    	 document.querySelector("#exercise").classList.remove('hidden');
    	 btn.classList.add('create-exercise-plan')
    	 btn.value = '운동 계획 생성'
    };
    
  /*   const gitLogin = () => {
  	  const gitUrl = "https://github.com/login/oauth/access_token"
  	  const tokenRequest = fetch(gitUrl, {

            method: "POST",
            header: {
                "Content-Type": "application/json",
            },
            data: {
                client_id: "7825cbafe9c48e56615a",
                client_secret: "653ec28ac8080a0345c890d60d494c47919888ba",
                code:
            }
        }).json();

  	  console.log(tokenRequest);
    } */

    const getGitLogin = () => {
  	  const gitUrl = "https://github.com/login/oauth/authorize";
  	  const client_id = "7825cbafe9c48e56615a";
  	  const finalUrl = gitUrl+"?client_id=" +client_id+ "&scope={read:user,user:email}";
  	  location.href = finalUrl;
    }
</script>
<%@include file ="common/footer.jsp" %>
