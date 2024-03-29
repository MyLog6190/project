<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="common/header.jsp" %>
    <!-- Start: Features Section 1
        ====================================== -->
        <section class="features-section-1 relative background-semi-dark" id="features">
            <div class="main-container">
                <div class="row section-separator">

                    <!-- Start: Section Header -->
                    <div class="section-header col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

                        <h1 class="section-heading">StartFit</h1>
                        <p class="sub-heading">운동을 시작해 보세요</p>

                    </div>
                    <!-- End: Section Header -->

                    <div class="clearfix"></div>

                    <div class="col-xs-12 features-item">
                        <div class="row">
                            
                            <div class="each-features text-center col-md-4 col-sm-6 col-xs-12">
                                <div class="inner background-light contents">
                            		<a href="/exercise/plan"><i class="icon features-icon icons8-calendar"></i></a>
                                    <h6 class="title">오늘의 운동계획</h6>
                                    <div class="detail">
                                        <p>오늘 어떤 운동을 할 지 미리 계획해 보세요.</p>
                                    </div>

                                </div> <!-- End: .inner -->
                            </div> <!-- End: .each-features -->

                            <div class="each-features text-center col-md-4 col-sm-6 col-xs-12">
                                <div class="inner background-light contents">
                            		
                                    <a href="/exprog"><i class="icon features-icon icons8-classroom-3"></i></a>
                                    <h6 class="title">프로그램</h6>
                                    <div class="detail">
                                        <p>운동 추천을 받고 운동을 시작해 보세요.</p>
                                    </div>

                                </div> <!-- End: .inner -->
                            </div> <!-- End: .each-features -->
                            
                            <div class="each-features text-center col-md-4 col-sm-6 col-xs-12">
                                <div class="inner background-light contents">
                            		
                                    <a href="/exlib"><i class="icon features-icon icons8-courses"></i></a>
                                    <h6 class="title">라이브러리</h6>
                                    <div class="detail">
                                        <p>운동 이름과 설명을 볼 수 있는 라이브러리</p>
                                    </div>

                                </div> <!-- End: .inner -->
                            </div> <!-- End: .each-features -->

                            <div class="each-features text-center col-md-4 col-sm-6 col-xs-12">
                                <div class="inner background-light contents">
                                	<a href="/community"><i class=" icon features-icon icons8-collaboration"></i></a>
                                    <h6 class="title">커뮤니티</h6>
                                    <div class="detail">
                                        <p>다른 사람들과 의견을 공유해 보세요.</p>
                                    </div>

                                </div> <!-- End: .inner -->
                            </div> <!-- End: .each-features -->
                        </div>
                    </div>

                </div> <!-- End: .row -->
            </div> <!-- End: .container -->
        </section>
        <!-- End: Features Section 1
        ======================================-->
<%@include file ="common/footer.jsp" %>
<script type="text/javascript">
</script>
</body>
<script src="/views/js/darkMode.js"></script>
</html>