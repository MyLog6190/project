<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file ="common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="/views/css/exercise-program.css" />
  <!-- Start: Features Section 7
        ====================================== -->
        <section class="features-section-8 relative background-light" id="work">
            <div class="container">
                <div class="row section-separator">

                    <!-- Start: Section Header -->
                    <div class="section-header col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">

                        <h2 class="section-heading">프로그램</h2>
                        <p class="sub-heading">운동을 처음 하시는 분을 위해 수준에 맞체 운동을 추천 드립니다.</p>

                    </div>
                    <!-- End: Section Header -->

                    <div class="clearfix"></div>

                    <div class="project-item col-xs-12">

                        <div class="each-project row">
                            <div class="each-project-inner">
					          <c:forEach items="${plist}" var="list" begin='0' end='0'>
                                
                                <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
                        
                                    <img class="project-image cover" src=${list.p_img }>
                                    
                                </div>
                                <div class="vertical-middle col-md-5 col-sm-6 col-xs-12">
                                    <div class="inner p-l-50">
                                        <h2 class="section-heading">초급<h4>${list.p_name }</h4></h2>
                                        <div class="detail">
                                            <p>${list.p_contents }</p>
                                        </div>

                                        <!-- Button Area -->
                                        <div class="btn-form">
                                            <a href="#" class="btn btn-fill right-icon">View Case Study <i class="icon icons8-advance"></i></a>
                                        </div>

                                    </div>
                                </div>
                                            </c:forEach>

                            </div>
                        </div> <!-- End: .row -->

					          <c:forEach items="${plist}" var="list" begin='1' end='1'>
                        <div class="each-project row">
                            <div class="each-project-inner">
                                
                                <div class="vertical-middle col-md-5 col-sm-6 col-xs-12">
                                    <div class="inner p-r-50">
                                        
                                        <h2 class="section-heading">중급</h2>

                                        <div class="detail">
                                            <p>Lorem ipsum dolor sit amet, consectetuer elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                                        </div>

                                        <!-- Button Area -->
                                        <div class="btn-form">
                                            <a href="#" class="btn btn-fill right-icon">View Case Study <i class="icon icons8-advance"></i></a>
                                        </div>

                                    </div>
                                </div>
                                
                                <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
                                   <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
                                   	  <img class="project-image cover" src="/common/images/project/1.jpg">
                                    
                                   </div>
                                </div>

                            </div>
                        </div> <!-- End: .row -->

                        <div class="each-project row">
                            <div class="each-project-inner">
                                
                                <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
                                    <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
                                    	<img class="project-image cover" src="/common/images/project/1.jpg">
                                    
                                	</div>
                                </div>
                                <div class="vertical-middle col-md-5 col-sm-6 col-xs-12">
                                    <div class="inner p-l-50">
                                        
                                        <h2 class="section-heading">상급</h2>

                                        <div class="detail">
                                            <p>Lorem ipsum dolor sit amet, consectetuer elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                                        </div>

                                        <!-- Button Area -->
                                        <div class="btn-form">
                                            <a href="#" class="btn btn-fill right-icon">View Case Study <i class="icon icons8-advance"></i></a>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div> <!-- End: .row -->

                    </div> <!-- End: .project-item -->

                </div> <!-- End: .row -->
            </div> <!-- End: .container -->
        </section>
        <!-- End: Features Section 8
        ======================================-->
<%@include file ="common/footer.jsp" %>
