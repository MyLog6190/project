// 다크 모드
document.querySelector(".dark-mode-switch").onclick = () => {
      document.querySelector("main").classList.toggle("dark");
      document.querySelector("main").classList.toggle("light");
};

// 달력 출력
class Calendar {
	constructor(year, month) {
		this.year = year;
		this.month = month;
		this.getfullDayOfMonth();
		this.prevMonth();
		this.nextMonth();
		this.selectPlanDate();
	}
	
	getFirstDayOfMonth = () => {
      const date = new Date(this.year, this.month, 1);
      return date.getDay();
    };
    
    getLastDayOfMonth = () => {
      const date = new Date(this.year, this.month + 1, 0);
      return date.getDate();
    }
    
    getfullDayOfMonth = () => {
	
	  const yearPicker = document.querySelector("#year");
	  const monthPicker = document.querySelector("#month-picker");
		
	  yearPicker.innerHTML = this.year ;
	  monthPicker.innerHTML = `${ this.month + 1}월`;
	  
      const calendarDays = document.querySelector(".calendar-days");
     
      calendarDays.innerHTML = "";
      const firstDay = this.getFirstDayOfMonth();
      const LastDay = this.getLastDayOfMonth();

      for (let i = 1; i < LastDay + firstDay + 1; i++) {
        const day = document.createElement("div");
        calendarDays.appendChild(day);
        if (i >= firstDay + 1) {
          day.classList.add("day");
          day.classList.add("calendar-day-hover");
          day.setAttribute("id", `${ this.year }-${( this.month + 1 )}-${ i - firstDay >= 10 ? "" : "0"}${(i - firstDay)}`);
          day.innerHTML = i - firstDay;
          day.innerHTML += `
  		                <span></span>
  		                <span></span>
  		                <span></span>
  		                <span></span>
  	                `;
        }
      }
    }
    
    dateFormat = (date) => {
 		const month = date.getMonth() + 1;
      	const day = date.getDate()
      	return `${ date.getFullYear() }년 ${ month }월\t ${ day }일`
	}
	
    prevMonth = () => {
	    const prev = document.querySelector("#prev-year");

	    prev.onclick = () => {
	      if (this.month == 0) {
	        this.year--;
	        this.month = 11;
	      } else {
	        this.month--;
	      }
	      this.getfullDayOfMonth();
		  this.selectPlanDate();
	    }
	}

	nextMonth = () => {
		const next = document.querySelector("#next-year");
		
		next.onclick = () => {
		    if (this.month == 11) {
		       this.year++;
		       this.month = 0;
		    } else {
		       this.month++;
		    }
		    this.getfullDayOfMonth();
		    this.selectPlanDate();      
		}
	}
	
	selectPlanDate = () => {
	  const dateToPlan = document.querySelector('#date-to-plan')
  	  const days = document.querySelectorAll('.day')
  	  days.forEach((day) => {
  		 day.onclick = (e) => {
  			 let id = e.target.id;
  			 console.log(id)
  			 dateToPlan.innerHTML = this.dateFormat(new Date(id));
  		 }
  	  });
    }
    
}
const today = new Date();
const year = today.getFullYear();
const month = today.getMonth();
const cal = new Calendar(year, month);



