<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file ="../common/header.jsp" %>
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
						<c:forEach items='${plist}' var='program' varStatus="status">
							<c:if test='${status.index%2 eq 0}'>
		                        <div class="each-project row">
		                            <div class="each-project-inner">
		                                <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
		                                    <div class="project-image cover" style="background-image: url(${program.p_img });"></div>
		                                </div>
		                                <div class="vertical-middle col-md-5 col-sm-6 col-xs-12">
		                                    <div class="inner r-inner p-l-50">
		                                        <h2 class="section-heading">${program.p_level}<h4>${program.p_name }</h4></h2>
		                                        <div class="detail">
		                                            <p>${program.p_contents }</p>
		                                        </div>
		                                        <!-- Button Area -->
		                                        <div class="btn-form">
		                                            <a href="/exprog/${program.p_no}" class="btn btn-fill right-icon">GO WORKOUT <i class="icon icons8-advance"></i></a>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div> <!-- End: .row -->
							</c:if>
							
							<c:if test='${status.index%2 ne 0}'>
		                        <div class="each-project row">
		                            <div class="each-project-inner">
		                                <div class="vertical-middle col-md-5 col-sm-6 col-xs-12">
		                                    <div class="inner l-inner p-r-50">
		                                        
		                                        <h2 class="section-heading">${program.p_level}<h4>${program.p_name }</h4></h2>
		
		                                        <div class="detail">
		                                            <p>${program.p_contents }</p>
		                                        </div>
		                                        <!-- Button Area -->
		                                        <div class="btn-form">
		                                            <a href="/exprog/${program.p_no}" class="btn btn-fill right-icon">GO WORKOUT <i class="icon icons8-advance"></i></a>
		                                        </div>
		                                    </div>
		                                </div>
		                                <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
		                                   <div class="vertical-middle col-md-7 col-sm-6 col-xs-12">
		                                   	  <div class="project-image cover" style="background-image: url(${program.p_img });"></div>
		                                   </div>
		                                </div>
		
		                            </div>
		                        </div> <!-- End: .row -->
	                        </c:if>
						</c:forEach>
                    </div> <!-- End: .project-item -->

                </div> <!-- End: .row -->
            </div> <!-- End: .container -->
        </section>
        <!-- End: Features Section 8
        ======================================-->
<%@include file ="../common/footer.jsp" %>
<script type="text/javascript">
</script>
<script src="/views/js/darkMode.js"></script>