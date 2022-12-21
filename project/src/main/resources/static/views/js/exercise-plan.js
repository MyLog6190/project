// 다크 모드
document.querySelector(".dark-mode-switch").onclick = () => {
      document.querySelector("main").classList.toggle("dark");
      document.querySelector("main").classList.toggle("light");
};

// 달력 출력
class Calendar {
	constructor(year, month, day) {
		this.year = year;
		this.month = month;
		const date = `${ year }-${( month + 1 )}-${ day >= 10 ? "" : "0"}${ day }`;
		const dateToPlan = document.querySelector('#date-to-plan')
		this.getfullDayOfMonth();
		dateToPlan.innerHTML = this.dateFormat(new Date(date));
		this.prevMonth();
		this.nextMonth();
		this.selectPlanDate();
		this.showExercisePlan(date);
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
      	return `${ date.getFullYear() }년 ${ month }월 ${ day }일`
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
  			 this.showExercisePlan(id);
  			 dateToPlan.innerHTML = this.dateFormat(new Date(id));
  		 }
  	  });
    }
    
    showExercisePlan = (date) => {
		fetch("/exercise/plan",{
			method:"post",
			headers: {
		        'Content-Type': 'application/json',
		    },
		    body: JSON.stringify({
				"date":date
		    })
		}).then(res => {
			console.log(res);
			return res.json();
		}).then(data => {
			let test_text = "";
			if(data){
				const excercise_to_do_plan = document.querySelector(".excercise-to-do-plan");
				const epList = data["eplist"];
				const evList = data["evlist"];
				epList.forEach( exercisePlan => {
					test_text += "<div class='exercise-to-do-list'>";
					test_text += "<div class='exercise-to-do'>";
					test_text += "<div>";
					test_text += "<span>"+ exercisePlan.c_name +"</span> | <span>"+ exercisePlan.e_name +"</span>";
					test_text += "</div>";
					test_text += "<div>";
					test_text += "<i class='bi bi-trash'></i>";
					test_text += "<input class='rno' type='hidden' value='"+ exercisePlan.r_no +"'/>";
					test_text += "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-trash rDelete' viewBox='0 0 16 16'>"; 
					test_text += "<path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>";
					test_text += "<path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>";
					test_text += "</svg>";
					test_text += "</div>";
					test_text += "</div>";
					test_text += "<hr>";
					test_text += "<div class='exercise-set-info'>";
					test_text += "<img class='exercise-img' src="+ exercisePlan.e_img +">";
					test_text += "<div class='excercise_sets'>";
					evList.forEach( exerciseVolume => {
						if(exercisePlan.r_no == exerciseVolume.r_no){
							test_text += "<div class='exercise-to-do-check'>";
							test_text += "<div class='excercise_set'>";
							test_text += "<input class='excercise_set_count' id='set' type='number' min='0' max='5' value="+ parseInt(exerciseVolume.v_set) +"/>";
							test_text += "<label for='set'> Set </label>";
							test_text += "<input class='excercise_set_count' id='weight' type='number' min='0' max='300' value=" + parseInt(exerciseVolume.v_kg) +"/>";
							test_text += "<label for='weight'> Kg </label>";
							test_text += "<input class='excercise_set_count' id='reps' type='number' min='0' max='300' value="+ parseInt(exerciseVolume.v_reps)+"/>";
							test_text += "<label for='reps'>횟수</label>";
							test_text += "</div>";
							test_text += "<div class='check-and-delete'>";
							test_text += "<input type='checkbox' />";
							test_text += "<input class='vno' type='hidden' value='"+ exerciseVolume.v_no +"'/>";
							test_text += "<i class='bi bi-trash'></i>";
							test_text += "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-trash vDelete' viewBox='0 0 16 16'>";
							test_text += "<path d='M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z'/>";
							test_text += "<path fill-rule='evenodd' d='M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z'/>";
							test_text += "</svg>";
							test_text += "</div>";
							test_text += "</div>";
						}
					});
					test_text += "</div>";
					test_text += "</div>";
					test_text += "<div class='exercise-footer'>";
					test_text += "<button type='button' class='btn btn-primary addSetBtn'> 세트추가 </button>";
					test_text += "</div>";
					test_text += "</div>";
				});
				excercise_to_do_plan.innerHTML = test_text;
			    this.vDelete();
			    this.rDelete();
			    this.addVolume();
			}
		});
	}
	
	vDelete = () => {
		const deleteBtns = document.querySelectorAll('.vDelete');
		console.log(deleteBtns);
		const vNoList = document.querySelectorAll('.vno');
		console.log(vNoList);
		
		deleteBtns.forEach( (btn, idx) => {
			btn.onclick = () => {
				console.log(idx);
				const vNo = vNoList[idx].value;
				console.log(vNo);
				fetch('/exercise/volume_delete', {
					method:"POST",
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify({
						 "vNo": vNo
					})
				}).then( res => {
					console.log(res);
				}).then( data => {
					 let date = document.querySelector('#date-to-plan').innerText;
					 date = date.replace(/ /g,"");
					 date = date.replace("일","");
					 date = date.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"-");
					 this.showExercisePlan(date);
				});
			}
		});
	 }
	 
	rDelete = () => {
		const exercise_to_do_list = document.querySelectorAll('.exercise-to-do-list');
		exercise_to_do_list.forEach( exercise => {
			const delete_btn = exercise.querySelector(".rDelete");
			let rNo
			if(exercise.querySelector(".rno")){
				rNo = exercise.querySelector(".rno").value
				delete_btn.onclick = () => {
					fetch('/exercise/recode_delete', {
						method:"POST",
						headers: {
					        'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({
					    	"rNo": rNo
					    })
					}).then( res => {
					    	console.log(res);
					}).then( data => {
					    let date = document.querySelector('#date-to-plan').innerText;
						date = date.replace(/ /g,"");
						date = date.replace("일","");
						date = date.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"-");
						this.showExercisePlan(date);
					});
				};
			}
			
		});
	 }
	 
	addVolume = () => {
		const exercise_to_do_list = document.querySelectorAll('.exercise-to-do-list');
		exercise_to_do_list.forEach( exercise => {
			const addSetBtn = exercise.querySelector(".addSetBtn");
			let rNo
			if(exercise.querySelector(".rno")){
				rNo = exercise.querySelector(".rno").value
				addSetBtn.onclick = () => {
					fetch('/exercise/insert_volume', {
						method:"POST",
						headers: {
					        'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({
					    	"rNo": rNo
					    })
					}).then( res => {
					    	console.log(res);
					}).then( data => {
					    	let date = document.querySelector('#date-to-plan').innerText;
							date = date.replace(/ /g,"");
							date = date.replace("일","");
							date = date.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"-");
					    	this.showExercisePlan(date);
					});
				};
			}
			
		});
	 }
}


const today = new Date();
const year = today.getFullYear();
const month = today.getMonth();
const day = today.getDate();
const cal = new Calendar(year, month, day);

class ExercisePlan {
	
}

