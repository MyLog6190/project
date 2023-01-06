
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
	}
	
	exercisePlan = new ExercisePlan();
	
	// 달의 첫날
	getFirstDayOfMonth = () => {
      const date = new Date(this.year, this.month, 1);
      return date.getDay();
    };
    
    //달 마지막날
    getLastDayOfMonth = () => {
      const date = new Date(this.year, this.month + 1, 0);
      return date.getDate();
    }
    
    // 달 모든 날짜 가져오기
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
          day.setAttribute("id", `${ this.year }-${( this.month + 1 >= 10 ? "" : "0")}${( this.month + 1 )}-${ i - firstDay >= 10 ? "" : "0"}${(i - firstDay)}`);
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
    
   
	
	
    // 날짜 포멧
    dateFormat = (date) => {
 		const month = date.getMonth() + 1;
      	const day = date.getDate()
      	return `${ date.getFullYear() }년 ${( month + 1 >= 10 ? "" : "0")} ${ month }월 ${ day >= 10 ? "" : "0"}${ day }일`
	}
	
	// 이전 달
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
	      this.exercisePlan.workDay();
		  this.exercisePlan.selectPlanDate();
	    }
	}
	
	// 다음 달
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
		    this.exercisePlan.workDay();
		    this.exercisePlan.selectPlanDate();      
		}
	}
	
}




class ExercisePlan {
	
	constructor() {}
	
	start = () => {
		const date = this.select_date();;
		this.selectPlanDate();
		this.exercise_list();
		this.create_exercise_plan();
		this.showExercisePlan(date);
	}
	
	// 운동 리스트 출력
	exercise_list = () => {
		let btn = document.querySelector(".btn-primary");
	    btn.onclick = () => {
	    	 document.querySelector("#exercise").classList.remove('hidden');
	    	 btn.classList.add('create-exercise-btn')
	    	 let changeBtn = document.querySelector(".create-exercise-btn");
	    	 changeBtn.value = "운동 계획 생성";
	    	 this.getPrograms();
	    	 
		     let create_exercise_btn = document.querySelector(".create-exercise-btn");
	    	 if(create_exercise_btn) {
			    create_exercise_btn.onclick = () => {
			    	const select_exercise = document.querySelector(".select-exercise")
			    	select_exercise.style.display = "block";
			    	const select_exercise_body = document.querySelector(".select-exercise-body");
			    	
			    	fetch('/exercise/exercise-list', {
			    		method:'POST'
			    	}).then( res => {
			    		return res.json();
			    	}).then( data => {
			    		let exerciseText = "";
			    		data.forEach( exercise => {
			    			exerciseText += "<div class='exercise-list'>"
			    			exerciseText += "<div>";
			    			exerciseText += "<input type='checkbox' class='select-exercise-check'>";
			    			exerciseText += "<input type='hidden' id='eNo' value="+exercise.e_no+">";
			    			exerciseText += "<input type='hidden' id='cName' value="+exercise.c_name+">";
			    			exerciseText += "<img class='exercise-info_img' src="+exercise.e_img+">";
			    			exerciseText += "<span class='eName'>"+exercise.e_name+"</span>";
			    			exerciseText += "</div>";
			    			exerciseText += "<div>";
			    			exerciseText += "<i class='bi bi-bookmark'></i>";
			    			exerciseText += "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-bookmark' viewBox='0 0 16 16'>";
			    			exerciseText += "<path d='M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z'/>";
			    			exerciseText += "</svg>";
			    			exerciseText += "</div>";
			    			exerciseText += "</div>";
			    		});
			    		select_exercise_body.innerHTML = exerciseText;
			    	});
			    }
	    	 }
	    };
	}
	
	
	// 날짜 선택
	selectPlanDate = () => {
	  const dateToPlan = document.querySelector('#date-to-plan')
  	  const days = document.querySelectorAll('.day')
  	  days.forEach( day => {
  		 day.onclick = (e) => {
  			 let id = e.target.id;
  			 this.showExercisePlan(id);
  			 dateToPlan.innerHTML = this.dateFormat(new Date(id));
  		 }
  	  });
    }
    
     // 운동 계획생성
	create_exercise_plan = () =>{
		let select_exercise_btn = document.querySelector(".select-exercise-btn");
	    select_exercise_btn.onclick = () => {
	    	const exercise_list = document.querySelectorAll(".exercise-list");
	    	let enoList = [];
	    	let eNameList = [];
	    	let imgList = [];
	    	let cNameList = [];
	    	let dateList = [];
	    	exercise_list.forEach( (exercise) => {
	    		const checkBox = exercise.querySelector(".select-exercise-check");
	    		const is_checked = checkBox.checked;
	    		if(is_checked) {
	    			const eNo = exercise.querySelector("#eNo").value;
	    			const cName = exercise.querySelector("#cName").value;
	    			const eName = exercise.querySelector('.eName').innerText;
	    			const eImg = exercise.querySelector('.exercise-info_img').getAttribute('src');
	    			let date = this.select_date();
	    			
	    			enoList.push(eNo);
	    			eNameList.push(eName);
	    			cNameList.push(cName);
	    			imgList.push(eImg);
	    			dateList.push(date);
	    		}
	    	});
	    	
	    	fetch("/exercise/select-exercise", {
				method:"POST",
				headers: {
			        'Content-Type': 'application/json',
			    },
			    body: JSON.stringify({
			   		"enoList":enoList,
			   		"eNameList":eNameList,
			   		"cNameList":cNameList,
			   		"imgList":imgList,
			   		"dateList":dateList
			    })
			}).then( res => {
				console.log(res.status);
			}).then( data => {
				const select_exercise = document.querySelector(".select-exercise")
		    	select_exercise.style.display = "none";
				const selectDate = this.select_date();
		    	this.showExercisePlan(selectDate);
			});
	    }
	}
	
    // 운동 계획 보여주기
	showExercisePlan = (date) => {
		fetch("/exercise/plan",{
			method:"post",
			headers: {
		        'Content-Type': 'application/json',
		    },
		    body: JSON.stringify({
				"date":date
		    })
		}).then( res => {
			console.log(res.status);
			return res.json();
		}).then( data => {
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
					let idx = 0;
					evList.forEach( (exerciseVolume) => {
						if(exercisePlan.r_no == exerciseVolume.r_no){
							test_text += "<div class='exercise-to-do-check'>";
							test_text += "<div class='excercise_set'>";
							test_text += "<input class='excercise_set_count set' id='set' type='number' min='0' max='5' value='"+ (idx += 1) + "' readonly/>";
							test_text += "<label for='set'> Set </label>";
							test_text += "<input class='excercise_set_count kg' id='kg' type='number' min='0' max='300' value='" + parseInt( exerciseVolume.v_kg ) + "'/>";
							test_text += "<label for='kg'> Kg </label>";
							test_text += "<input class='excercise_set_count reps' id='reps' type='number' min='0' max='300' value='"+ parseInt( exerciseVolume.v_reps )+"'/>";
							test_text += "<label for='reps'> Reps </label>";
							test_text += "<input class='vno' type='hidden' value='"+ exerciseVolume.v_no +"'/>";
							test_text += "</div>";
							test_text += "<div class='check-and-delete'>";
							test_text += "<input class='do_check' type='checkbox' value='"+ exerciseVolume.do_check +"'>";
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
			    this.do_checked();
			    this.checked();
			    this.repUpdate();
			    this.kgUpdate();
			    this.workDay();
			}
		});
	}
	
	// 운동 볼륨 삭제
	vDelete = () => {
		const deleteBtns = document.querySelectorAll('.vDelete');
		const vNoList = document.querySelectorAll('.vno');
		
		deleteBtns.forEach( (btn, idx) => {
			btn.onclick = () => {
				const vNo = vNoList[idx].value;
				fetch('/exercise/volume_delete', {
					method:"POST",
					headers: {
						'Content-Type': 'application/json',
					},
					body: JSON.stringify({
						 "vNo": vNo
					})
				}).then( res => {
					console.log(res.status);
				}).then( data => {
					 const date = this.select_date();
					 this.showExercisePlan(date);
				});
			}
		});
	}
	 
	 // 운동 계획 삭제
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
					    	console.log(res.status);
					}).then( data => {
					    const date = this.select_date();
						this.showExercisePlan(date);
					});
				};
			}
			
		});
	}
	
	// 운동 볼륨추가 
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
					    	console.log(res.status);
					}).then( data => {
					    	const date = this.select_date();
					    	this.showExercisePlan(date);
					});
				};
			}
			
		});
	}
	 
	 // 선택된 날짜값 가져오기
	select_date = () => {
		let date = document.querySelector('#date-to-plan').innerText;
		date = date.replace(/ /g,"");
		date = date.replace("일","");
		date = date.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"-");
		return date
	}
	
	// 운동 했는지 체크 
	do_checked = () => {
		const do_check_list = document.querySelectorAll('.do_check');
		const vNoList = document.querySelectorAll('.vno');
		
		do_check_list.forEach( (do_check, idx) => {
			do_check.onclick = () => {
				let checkValue;
				if(do_check.value == 'F'){
					checkValue = 'T';
				}else {
					checkValue = 'F';
				}
				const vNo = vNoList[idx].value;
				
				fetch('/exercise/do_check', {
						method:"POST",
						headers: {
					        'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({
					    	"vNo": vNo,
					    	"checkValue" : checkValue
					    })
				}).then( res => {
					    console.log(res.status);
				}).then( data => {
					    const date = this.select_date();
					    this.showExercisePlan(date);
				});
			}
		});
	}
	
	checked = () => {
		const do_check_list = document.querySelectorAll('.do_check');
		do_check_list.forEach( do_check => {
			if(do_check.value == 'T'){
				do_check.checked = true;
			}
		})
	} 
	
 	dateFormat = (date) => {
 		const month = date.getMonth() + 1;
      	const day = date.getDate()
      	return `${ date.getFullYear() }년 ${( month + 1 >= 10 ? "" : "0")} ${ month }월 ${ day >= 10 ? "" : "0"}${ day }일`
	}
	
	// 운동 횟수 업데이트
	repUpdate = () => {
		let reps = document.querySelectorAll('.reps');
		reps.forEach( (r) => {
			r.onkeyup = (e) => {
				const excercise_set = e.target.parentElement
				const repsValue = e.target.value
				const vNo = excercise_set.querySelector('.vno').value;
				fetch('/exercise/res_update', {
						method:"POST",
						headers: {
					        'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({
					    	"vNo": vNo,
					    	"repsValue":repsValue
					    })
				}).then( res => {
					    console.log(res.status);
				});
			}
		})
	}
	
	// 무게 업데이트
	kgUpdate = () => {
		let kg = document.querySelectorAll('.kg');
		kg.forEach( (k) => {
			k.onkeyup = (e) => {
				const excercise_set = e.target.parentElement
				const kgValue = e.target.value;
				const vNo = excercise_set.querySelector('.vno').value;
				fetch('/exercise/kg_update', {
						method:"POST",
						headers: {
					        'Content-Type': 'application/json',
					    },
					    body: JSON.stringify({
					    	"vNo": vNo,
					    	"kgValue":kgValue
					    })
				}).then( res => {
					    console.log(res.status);
				});
			}
		})
	}
	
	// 운동 프로그램
	getPrograms = () => {
		fetch('/exercise/program', {
			method:"POST",
			headers: {
				'Content-Type': 'application/json',
			}
		}).then( res => {
			console.log(res.status);
			return res.json();
		}).then( data => {
			console.log(data);
			let programList = "";
			data.forEach( program => {
				programList += "<div class='exercise-program'>";
				programList += "<img class='exercise_program_img' src='"+ program.p_img + "'>";
				programList += "<h5>" + program.p_name + "</h5>";
				programList += "<input type='hidden' value=" + program.p_no + ">";
				programList += "</div>";
			});
			const excercise = document.querySelector("#exercise")
			excercise.innerHTML = programList;
		})
	}
	
	// 프로그램 운동 리스트
	getProgramExerciseList = () => {
		 const exercise_program = document.querySelector(".exercise-program");
		 exercise-program.forEach( program => {
			 program.onclick = (e) =>{
				 
			 }
		 });
		 
	}
	
	
	// 운동 계획한 날짜 표시
	workDay = () => {
		fetch('/exercise/workout_day', {
			method:"POST",
			headers: {
				'Content-Type': 'application/json',
			}
		}).then( res => {
			console.log(res.status);
			return res.json();
		}).then( data => {
			const days = document.querySelectorAll('.day');
			data.forEach( workoutDay => {
				days.forEach( day => {
					if(workoutDay == day.id){
						day.classList.add('workoutDay');
					}					
				});
			})
		})
	}
	
}

const today = new Date();
const year = today.getFullYear();
const month = today.getMonth();
const day = today.getDate();
const cal = new Calendar(year, month, day);
const exercisePlan = new ExercisePlan();
exercisePlan.start();

    	
let select_exercise_close = document.querySelector(".select-exercise-close");
select_exercise_close.onclick = () => {
	let select_exercise = document.querySelector(".select-exercise");
	select_exercise.style.display = "none";
}
	
let exercise_programs = document.querySelectorAll(".exercise-program");
exercise_programs.forEach( (exercise_program) => {
	exercise_program.onclick = () => {
		let program = document.querySelector(".program");
		program.style.display = "block";
	}
});
	
let program_close = document.querySelector(".program-close");
program_close.onclick = () => {
	let program = document.querySelector(".program");
	program.style.display = "none";
}