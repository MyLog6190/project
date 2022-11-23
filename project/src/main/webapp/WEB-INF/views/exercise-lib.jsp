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
#lib{
  width:300px;
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
}



.img1{
  background-image: url(/images/our-members/1.jpg);
}

.img2{
  background-image: url(/images/our-members/2.jpg);
}
.img3{
  background-image: url(/images/our-members/3.jpg);
}
.img4{
  background-image: url(/images/our-members/4.jpg);
}

#libs{
	position:relative;
	text-align: center;
}

#lib-menu{
	display: none;
	position:absolute;
	list-style: none;
}

a{
	cursor: pointer;
}
a:visited, a:hover, a:link, a:active{
	color: white;
}
.finder-container{
  width: 550px;
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
  width: 500px;
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
  font:
}

.finder-img{
  width: 2rem;
  height: 2rem;
  margin: 0;
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
   	<div id ="menu-container" class="">
  	  <div id="libs" class="navbar-nav text-center"><span>운동 라이브러리</span>
  	  	<div id="lib-menu" class="btn-nav flex-column justify-content-center align-items-center"></div>
      </div>
  	</div>
  	<div id="lib-container" class="d-flex flex-column justify-content-center align-items-center">
  	  <div class="finder-container">
        <img src="/icons/myicons/magnifying-glass.png" class="finder-img" />
  		<input type="text" class="finder" placeholder="찾으시는 운동을 검색해보세요." />
  	  </div>
	  <div class="d-flex flex-wrap justify-content-center">
        <div class="exercise-field text-center" data-filter="bookmark"><span>북마크</span></div>
		<div class="exercise-field text-center" ><span>하체</span></div>
		<div class="exercise-field text-center" ><span>가슴</span></div>
		<div class="exercise-field text-center" ><span>등</span></div>
		<div class="exercise-field text-center" ><span>어깨</span></div>
        <div class="exercise-field text-center" ><span>팔</span></div>
        <div class="exercise-field text-center" ><span>역도</span></div>
        <div class="exercise-field text-center" ><span>복근</span></div>
        <div class="exercise-field text-center" data-filter="etc"><span>기타</span></div>
        <div class="exercise-field text-center" ><span>유산소</span></div>
      </div>
      <div>
        <div class="exercise-libs" data-filter="etc">버피</div>
        <div class="exercise-libs" data-filter="etc">쓰러스터</div>
        <div class="exercise-libs" data-filter="etc">케틀벨 스윙</div>
        <div class="exercise-libs" data-filter="etc">파머스 워크</div>
        <div class="exercise-libs" data-filter="">트레드밀</div>
        <div class="exercise-libs" data-filter="">싸이클</div>
        <div class="exercise-libs" data-filter="">로잉머신</div>
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
		console.log(filter)
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
</script>
</body>

</html>