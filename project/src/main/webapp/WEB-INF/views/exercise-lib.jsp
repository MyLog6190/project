<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
.circle{
  margin:50px;
  background-color: #555555;
  width: 250px;
  height: 250px;
  border-radius: 100%;
  line-height: 250px;
  font-size: 2rem;
}
.images{
  background-position: center;
  background-repeat: cover;
  width: 250px;
  height: 250px;
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

#libs:hover > ul{
	display: flex;
	z-index: 10;
	
}
a{
	cursor: pointer;
}
a:visited, a:hover, a:link, a:active{
	color: white;
}
</style>

<!-- <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"> -->
</head>
<body>
<%@include file ="common/header.jsp" %>
  <!-- Start: Features Section 7
  ====================================== -->
  <div class="container">
   	<div id ="menu-container" class="">
  	  <div id="libs" class="navbar-nav text-center"><span>운동 라이브러리</span>
  	  	<ul id="lib-menu" class="btn-nav flex-column justify-content-center align-items-center">
  	  		<li>하체</li>
  	  		<li>가슴</li>
  	  		<li>등</li>
  	  		<li>어깨</li>
  	  		<li>팔</li>
  	  		<li>역도</li>
  	  		<li>복근</li>
  	  		<li>기타</li>
  	  	</ul>
  	  </div>
  	</div>
  	<div id="lib-container" class="d-flex flex-column justify-content-center align-items-center">
  	  <div>
  		<input type="text" />
  	  </div>
	  <div class="d-flex flex-wrap justify-content-center">
		<a class="circle images text-center " href="#" ><span>하체</span></a>
		<a class="circle img2 images" href="#"></a>
		<a class="circle img3 images" href="#"></a>
		<a class="circle img4 images" href="#"></a>
      </div>
    </div>
  </div>
  
    <!-- End: Features Section 7
  ================================ -->
<%@include file ="common/footer.jsp" %>
<script>
const libs = document.getElementById('libs');
alert(libs.classList[0]);

libMenu.addEventListener("click",()=>{
	let menu = document.getElementById('lib-menu');
	menu.setAttribute('class', "");	
})

</script>
</body>

</html>