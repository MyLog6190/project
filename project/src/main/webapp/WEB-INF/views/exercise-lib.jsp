<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/views/css/exercise-lib.css">
</head>
<body>
  <%@include file="common/header.jsp"%>
  <!-- Start: Features Section 7
  ====================================== -->
  <div class="container">
    <div id="title-container">
      <div id="libs">
        <div id="libs-title">운동 라이브러리</div>
      </div>
    </div>
    <div id="lib-container">
      <div id="finder-container">
        <img src="/views/icons/libicons/magnifying-glass.png" class="finder-img" />
        <input type="text" id="finder" value="" placeholder="찾으시는 운동을 검색해보세요." />
      </div>
      <div id="filter-container">
        <input name="filter" id="all" type="radio" checked><label class="exercise-field" data-filter="all" for="all">필터 해제</label>
        <input name="filter" id="bookmark" type="radio"><label class="exercise-field" data-filter="bookmark" for="bookmark">북마크</label>
        <input name="filter" id="leg" type="radio"><label class="exercise-field" data-filter="leg" for="leg">하체</label>
        <input name="filter" id="chest" type="radio"><label class="exercise-field" data-filter="chest" for="chest">가슴</label>
        <input name="filter" id="back" type="radio"><label class="exercise-field" data-filter="back" for="back">등</label>
        <input name="filter" id="delt" type="radio"><label class="exercise-field" data-filter="delt" for="delt">어깨</label>
        <input name="filter" id="arm" type="radio"><label class="exercise-field" data-filter="arm" for="arm">팔</label>
        <input name="filter" id="abs" type="radio"><label class="exercise-field" data-filter="abs" for="abs">복근</label>
      </div>
      <div class="exercise-lib-container">
        <div class="exercise-libs leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image" src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">바벨 백스쿼트</div>
            <img class="libs-detail" src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">컨벤셔널 데드리프트</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">프론트 스쿼트</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 컬</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between leg">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/leg/1.png" />
            <div class="libs-name">레그 익스텐션</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">인플라인 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">덤벨 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
        <div class="exercise-libs flex-column align-items-between chest">
          <div class="d-flex flex-row justify-content-between">
            <img class="libs-image"
              src="/views/images/libimages/chest/1.png" />
            <div class="libs-name">인플라인 덤벨 벤치프레스</div>
            <img class="libs-detail"
              src="/views/icons/libicons/down-arrow.png" />
          </div>
          <div class="detail-container d-none">
            <div class="details">운동 사진</div>
            <div class="details">운동 설명</div>
            <div class="details">유튜브 검색</div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- End: Features Section 7
  ================================ -->
  <%@include file="common/footer.jsp"%>
  <script>

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
		libsName.forEach(name =>{
			if(e.target.value === ""){
				name.parentNode.parentNode.classList.remove("d-none")
			}else if(name.innerText.search(e.target.value)>=0){
				name.parentNode.parentNode.classList.remove("d-none")
			} else{
				name.parentNode.parentNode.classList.add("d-none")
			}
		})
	})
	
}


</script>
</body>

</html>