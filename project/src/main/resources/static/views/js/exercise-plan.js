// 다크 모드
document.querySelector(".dark-mode-switch").onclick = () => {
      document.querySelector("main").classList.toggle("dark");
      document.querySelector("main").classList.toggle("light");
};

// 달력 출력
class Calendar {
	printCalendar = () => {
		const today = new Date()
		cal.dateFormat(today)
		
		const dateToPlan = document.querySelector('#date-to-plan')
		dateToPlan.innerHTML = cal.dateFormat(today);
		
		const year = today.getFullYear();
		const month = today.getMonth();
	
		this.printYearAndMonth(year,month);	
		this.getDay(year, month);
		this.prevMonth(year, month);
		this.nextMonth(year, month);
	}
	
	getFirstDay = (year, month) => {
      const date = new Date(year, month, 1);
      return date.getDay();
    };
    
    getLastDay = (year, month) => {
      const date = new Date(year, month + 1, 0);
      return date.getDate();
    }
    
    getDay = (year, month) => {
      const calendarDays = document.querySelector(".calendar-days");
      calendarDays.innerHTML = "";
      const firstDay = this.getFirstDay(year, month);
      const LastDay = this.getLastDay(year, month);

      for (let i = 1; i < LastDay + firstDay + 1; i++) {
        const day = document.createElement("div");
        calendarDays.appendChild(day);
        if (i >= firstDay + 1) {
          day.classList.add("day");
          day.classList.add("calendar-day-hover");
          day.setAttribute("id", `${year}-${(month + 1)}-${i - firstDay >= 10 ? "" : "0"}${(i - firstDay)}`);
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
	
    prevMonth = (year, month) => {
	    const prev = document.querySelector("#prev-year");

	    prev.onclick = () => {
	      if (month == 0) {
	        --year;
	        month = 11;
	      } else {
	        --month;
	      }
		  this.getDay(year, month);
		  this.printYearAndMonth(year,month);
		  this.selectPlanDate();
	    }
	}

	nextMonth = (year,month) => {
		const next = document.querySelector("#next-year");
		
		next.onclick = () => {
		    if (month == 11) {
		       ++year;
		       month = 0;
		    } else {
		       ++month;
		    }
		    this.getDay(year, month);
		    this.printYearAndMonth(year,month);
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
    
    printYearAndMonth = (year, month) => {
		const yearPicker = document.querySelector("#year");
		const monthPicker = document.querySelector("#month-picker");
		
		const thisYear = year;
		const thisMonth = month;
		
		yearPicker.innerHTML = thisYear ;
		monthPicker.innerHTML = `${ thisMonth + 1}월`;
		
	    this.getDay(thisYear, thisMonth);
	}
}

const cal = new Calendar();
cal.printCalendar();
cal.selectPlanDate();


