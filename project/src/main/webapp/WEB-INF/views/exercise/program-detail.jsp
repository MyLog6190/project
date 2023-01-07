<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file ="../common/header.jsp" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/views/css/program-detail.css" />
</head>
<body>

<!-- Start: Features Section 7
        ====================================== -->
        <section class="features-section-7 content-half background-light" >

	        <c:set var='program' value='${program}'/>
            <div class="container-half-left background-light"></div>
            <div class="container-half container-half-right" style="background-image: url(${program.p_img});"></div>

            <div class="container">
                <div class="row section-separator text-left">
                    <div class="col-md-6">
                        <div class="inner">
	                        <h2 class="section-heading">${program.p_level}</h2>
	                        <h4>${program.p_name}</h4>
	                        <div class="detail">
	                        	<p>${program.p_contents}</p>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End: Features Section 7
        ================================ -->
		<!-- Start: Features Section 1
        ====================================== -->
        <section class="features-section-1 relative background-semi-dark" id="features">
            <div class="container">
                <div class="row section-separator">

                    <!-- Start: Section Header -->
                    <div class="section-header col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

                        <h2 class="section-heading">운동 리스트</h2>
                        <p class="sub-heading">운동 프로그램에 따라 추천하는 운동 리스트</p>

                    </div>
                    <!-- End: Section Header -->

                    <div class="clearfix"></div>

                    <div class="col-xs-12 features-item">
                        <div class="row">
                            <c:forEach items='${eList}' var='exercise'>
                            
                            <div class="each-features text-center col-md-4 col-sm-6 col-xs-12">
                                <div class="inner background-light">
                                    <div class="cover exercise-image" style="background-image: url(${exercise.e_img});"></div>
                                    <h6 class="title">${exercise.e_name}</h6>
                                    <div class="detail">
                                        <p>세트 :  ${exercise.p_set}</p>
                                        <p>반복수 :  ${exercise.p_reps}</p>
                                        <p>무게 : 
                                           <c:if test="${exercise.p_kg == 0}">
                                        	 자유
                                           </c:if>	
                                           <c:if test="${exercise.p_kg != 0}">
                                        	 ${exercise.p_kg}
                                           </c:if>	
                                        	
                                        </p>
                                    </div>
                                </div> <!-- End: .inner -->
                            </div> <!-- End: .each-features -->
                            </c:forEach>
                            
                        </div>
                    </div>
                    
                </div> <!-- End: .row -->
            </div> <!-- End: .container -->
        </section>
        <!-- End: Features Section -->
<%@include file ="../common/footer.jsp" %>
</body>
<script src="/views/js/darkMode.js"></script>
</html>