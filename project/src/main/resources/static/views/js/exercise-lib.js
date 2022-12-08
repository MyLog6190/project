
 
function start (){
    const filters = document.querySelectorAll('.exercise-field')
    const exerItems = document.querySelectorAll('.exercise-libs')
    
    filters.forEach(b=>b.addEventListener('click',(e)=>{
        const filter = e.target.dataset.filter
        const finder = document.querySelector('#finder')
        finder.value = "";
        exerItems.forEach(i=>{
            if(filter ==='all'){
                i.classList.remove('d-none');
            }else{
                if(i.classList.contains(filter)){

                    i.classList.remove('d-none');
                }
                else{
                    i.classList.add('d-none');
                }
            }
        })
    }))
    oneDetail()
    find()
}

start()



function oneDetail(){
	const libsDetails = document.querySelectorAll('.libs-detail')


	libsDetails.forEach(btn => btn.addEventListener("click", e =>{
		e.preventDefault()
		const detailContainers = document.querySelectorAll('.detail-container')
		const presentDetail = e.target.parentNode.nextElementSibling;
		const presentBtn = e.target
		const classList = presentBtn.classList

		classList.toggle("detail-rotate")

		detailContainers.forEach(detail => {
			const detailBtn = detail.previousElementSibling.children[2]
			if(detailBtn != presentBtn){
				detailBtn.classList.remove("detail-rotate")
			}
			if(presentDetail != detail){
				detail.classList.add("d-none");
			} else {
				if(classList.contains("detail-rotate")){
					presentDetail.classList.remove('d-none');
				} else{
					presentDetail.classList.add('d-none');
				}
			}
		})
	}))
}

function find(){
	const finder = document.querySelector("#finder")
	
	finder.addEventListener("keyup", e=>{
		const all = document.querySelector("#all");
		all.checked =true
		const libsName = document.querySelectorAll(".libs-name")
		
		findWord = e.target.value
		
		libsName.forEach(data => {
		let dataWord = data.innerText

		for(let j=0;j<dataWord.length-findWord.length+1;j++){
			data.parentNode.parentNode.classList.add("d-none")
			let tempWord ="";
			for(let i=0;i<findWord.length;i++){	
				if(isConsonant(findWord[i]) && kor(dataWord.charAt(j+i))){
					tempWord += splitHangeul(dataWord.charAt(j+i))
				} else{
					tempWord += dataWord.charAt(j+i)
				}
			}
			if(tempWord === findWord){
				data.parentNode.parentNode.classList.remove("d-none")
				break;
				}
			}
		})
	})
}



function isConsonant(w){
	if(w >= 'ㄱ' && w < '가') return true;
	else return false;
}


function kor(w){
	if(w >= 'ㄱ' && w <= '힣') return true;
	else return false;
}



function splitHangeul(value){
	const f = ['ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ',
			   'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ',
			   'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'];
	const f1 = ['ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ', 'ㄷ',
			   'ㄸ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ',
			   'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅄ', 'ㅅ',
			   'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ',
			   'ㅍ', 'ㅎ'];
    const s = ['ㅏ', 'ㅐ', 'ㅑ', 'ㅒ', 'ㅓ', 'ㅔ', 'ㅕ',
               'ㅖ', 'ㅗ', 'ㅘ', 'ㅙ', 'ㅚ', 'ㅛ', 'ㅜ',
               'ㅝ', 'ㅞ', 'ㅟ', 'ㅠ', 'ㅡ', 'ㅢ', 'ㅣ'];
    const t = ['', 'ㄱ', 'ㄲ', 'ㄳ', 'ㄴ', 'ㄵ', 'ㄶ',
               'ㄷ', 'ㄹ', 'ㄺ', 'ㄻ', 'ㄼ', 'ㄽ', 'ㄾ',
               'ㄿ', 'ㅀ', 'ㅁ', 'ㅂ', 'ㅄ', 'ㅅ', 'ㅆ',
               'ㅇ', 'ㅈ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'];

	const ga = 44032;

    let uni = value.charCodeAt(0);
    let fn;
    let sn;
    let tn;
    
    // 자음만 입력 됐을 시
	if(uni >= f1[0].charCodeAt(0) && uni <= f1[29].charCodeAt(0)){
	    fn = parseInt(uni - f1[0].charCodeAt(0));
		return f1[fn]
	}

	// 글자 완성 시
	uni = uni - ga;
	fn = parseInt(uni / 588);
/*	sn = parseInt((uni - (fn * 588)) / 28);
	tn = parseInt(uni % 28);
*/	
	return f[fn]
}

