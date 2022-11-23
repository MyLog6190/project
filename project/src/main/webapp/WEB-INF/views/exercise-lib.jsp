<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#menu-container{
  position: relative;
}

#menu{
  position: absolute;
    margin:0;
}
#menu > li{
  padding: 10px 10px 10px 30px;
  z-index: 99;
  width:300px;
  list-style: none;
}

.exercise-field{
  margin: 10px 20px;
  background-color: #555555;
  width: 200px;
  height: 3rem;
  border-radius: 15px;
  
  line-height: 3rem;
  font-size: 2rem;
  color: #eeeeee;
  text-align: center;
}
.exercise-field:hover{
  cursor: pointer;
}

.exercise-libs{
  display: flex;
  margin: 10px 20px;
  width: 75vw;
  height: 5rem;
  background-color: #eeeeee;
  
  line-height: 5rem;
  font-size: 2rem;
  color: #555555;
  text-align: center;
}


.libs-image{
  height:5rem;
  border:1px solid #aaaaaa;
  
}

.libs-detail{
  border:1px solid #555555;
  border-radius: 100%;
  height: 5rem;
}

.detail-rotate {
  transform: rotateZ(180deg);
}

.libs-detail:hover{
  cursor: pointer;
}

a{
	cursor: pointer;
}

a:visited, a:hover, a:link, a:active{
	color: white;
}
.finder-container{
  width: min(50vw, 550px);
  height: 3rem;
  border: 1px solid #333333;
  border-radius: 10px;
  padding: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}

.finder-container:hover{
  background-color: #eeeeee;
}

.finder{
  width: min(45vw,500px);
  height: 2.5rem;
  border: 0px;
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  background-color: transparent;
}
.finder:focus{
  outline: none;
  caret-color: #333333;
}

.finder::placeholder{
  color: #555555;
}

.finder-img{
  width: 25px;
  height: 25px;
  margin: 5;
  padding: 0;
  box-sizing: border-box;
}

</style>
</head>
<body>
<%@include file ="common/header.jsp" %>
  <!-- Start: Features Section 7
  ====================================== -->
  <div class="container">
   	<div id ="menu-container" class="position-relative">
  	  <div id="libs" class="text-center d-flex justify-content-center align-items-center">
        <div class="">운동 라이브러리</div>
  	  	<div>필터 해제</div>
      </div>
  	</div>
  	<div id="lib-container" class="d-flex flex-column justify-content-center align-items-center">
  	  <div class="finder-container">
        <img src="/icons/libicons/magnifying-glass.png" class="finder-img" />
  		<input type="text" class="finder" placeholder="찾으시는 운동을 검색해보세요." />
  	  </div>
	  <div class="d-flex flex-wrap justify-content-center">
        <div class="exercise-field" data-filter="bookmark">북마크</div>
		<div class="exercise-field" data-filter="leg" >하체</div>
		<div class="exercise-field" data-filter="chest">가슴</div>
		<div class="exercise-field" data-filter="back">등</div>
		<div class="exercise-field" data-filter="delt">어깨</div>
        <div class="exercise-field" data-filter="arm">팔</div>
        <div class="exercise-field" data-filter="abs">복근</div>
      </div>
      <div class="d-flex flex-column justify-content-center">
        <div class="exercise-lib-container">
          <div class="exercise-libs flex-column align-items-between leg">
            <div class="d-flex flex-row justify-content-between">
              <img class="libs-image" src="/images/libimages/leg/1.png" />
              <div>바벨 백스쿼트</div>
              <img class="libs-detail" src="/icons/libicons/down-arrow.png"/>
            </div>
            <div class="detail-container">
              <div>운동 사진</div>
              <div>운동 설명</div>
              <div>유튜브 검색</div>
            </div>
          </div>
          <div class="exercise-libs flex-column align-items-between leg">
            <div class="d-flex flex-row justify-content-between">
              <img class="libs-image" src="/images/libimages/leg/1.png" />
              <div>컨벤셔널 데드리프트</div>
              <img class="libs-detail" src="/icons/libicons/down-arrow.png"/>
            </div>
          	<div class="detail-container">
              <div>운동 사진</div>
              <div>운동 설명</div>
              <div>유튜브 검색</div>
            </div>
          </div>
          <div class="exercise-libs leg">프론트 스쿼트</div>
          <div class="exercise-libs leg">레그 프레스</div>
          <div class="exercise-libs leg">레그 컬</div>
          <div class="exercise-libs leg">레그 익스텐션</div>
          <div class="exercise-libs chest">벤치프레스</div>
          <div class="exercise-libs chest">인클라인 벤치프레스</div>
          <div class="exercise-libs chest">덤벨 벤치프레스</div>
          <div class="exercise-libs chest">인클라인 덤벨 벤치프레스</div>
        </div>
      </div>
    </div>
  </div>
  
    <!-- End: Features Section 7
  ================================ -->
<%@include file ="common/footer.jsp" %>
<script>

function start (){
    const filters = document.querySelectorAll('.exercise-field')
    const exerItems = document.querySelectorAll('.exercise-libs')
    
    
    filters.forEach(b=>b.addEventListener('click',(e)=>{
        e.preventDefault()
        const filter = e.target.dataset.filter
        exerItems.forEach(i=>{
            if(filter ==='all'){
                i.style.display = 'flex';
            }else{
                if(i.classList.contains(filter)){
                    i.style.display='flex';
                }
                else{
                    i.style.display='none';
                }
            }
        })
    }))
}

start()

const libsDetail = document.querySelectorAll('.libs-detail')

libsDetail.forEach(btn => btn.addEventListener("click", e =>{
	const detailContainers = document.querySelectorAll('.detail-container')
	const classList = e.target.classList
	console.log(detailContainers)
	detailContainers.forEach(dc =>{
		dc.style.display = 'none'
	})
	
	classList.toggle("detail-rotate")
	
}))



</script>
</body>

</html>