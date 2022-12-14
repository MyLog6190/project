
function bookmarkInit(){
	const exerciseBookmarked = document.querySelectorAll(".exercise-libs");
	exerciseBookmarked.forEach(lib=>{
		bookmarks = lib.querySelector(".bookmark-container");
		const classList = bookmarks.children[0].classList
		const path = bookmarks.children[0].children[0];
		if(lib.classList.contains("bookmark")){
			classList.add('bi-bookmark-fill')
			path.setAttribute('d', "M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z")
		}
		else{
			classList.add('bi-bookmark')
			path.setAttribute('d', "M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z")
		}
	})
}


function updateBookmark(){
	
	const bookmarks = document.querySelectorAll(".bookmark-container");
	bookmarks.forEach(bookmark=>{
		bookmark.children[0].addEventListener("click",e=>{
			
			const e_no = bookmark.children[0].dataset.e_no
			isBookmarked(e_no)
			const classList = bookmark.children[0].classList
			const path = bookmark.children[0].children[0];
			classList.toggle('bi-bookmark-fill')
			classList.toggle('bi-bookmark')
			bookmark.parentNode.parentNode.classList.toggle('bookmark')
			if(classList.contains('bi-bookmark')){
				path.setAttribute('d', "M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z")
			} else if(classList.contains('bi-bookmark-fill')){
				path.setAttribute('d', "M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z")
			}
			
		})
	})
}



async function isBookmarked(e_no) {
    const result = await axios.get(`/exlib/api/${e_no}`)
}
 
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
    find()
    bookmarkInit()
    updateBookmark();
    
}

start()



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
	if(w >= '???' && w < '???') return true;
	else return false;
}


function kor(w){
	if(w >= '???' && w <= '???') return true;
	else return false;
}



function splitHangeul(value){
	const f = ['???', '???', '???', '???', '???', '???', '???',
			   '???', '???', '???', '???', '???', '???', '???',
			   '???', '???', '???', '???', '???'];
	const f1 = ['???', '???', '???', '???', '???', '???', '???',
			   '???', '???', '???', '???', '???', '???', '???',
			   '???', '???', '???', '???', '???', '???', '???',
			   '???', '???', '???', '???', '???', '???', '???',
			   '???', '???'];
    const s = ['???', '???', '???', '???', '???', '???', '???',
               '???', '???', '???', '???', '???', '???', '???',
               '???', '???', '???', '???', '???', '???', '???'];
    const t = ['', '???', '???', '???', '???', '???', '???',
               '???', '???', '???', '???', '???', '???', '???',
               '???', '???', '???', '???', '???', '???', '???',
               '???', '???', '???', '???', '???', '???', '???'];

	const ga = 44032;

    let uni = value.charCodeAt(0);
    let fn;
    let sn;
    let tn;
    
    // ????????? ?????? ?????? ???
	if(uni >= f1[0].charCodeAt(0) && uni <= f1[29].charCodeAt(0)){
	    fn = parseInt(uni - f1[0].charCodeAt(0));
		return f1[fn]
	}

	// ?????? ?????? ???
	uni = uni - ga;
	fn = parseInt(uni / 588);
/*	sn = parseInt((uni - (fn * 588)) / 28);
	tn = parseInt(uni % 28);
*/	
	return f[fn]
}

