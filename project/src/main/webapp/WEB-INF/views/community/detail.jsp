<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="../common/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" type="text/css" href="/views/css/board-detail.css" />
<link rel="stylesheet" type="text/css" href="/views/css/board-comment.css" />
</head>
<body>
<div class='main-container'>
	  <%-- <input type="hidden" name="page"  value="${pageRequestDTO.page}"> --%>
	<div class="detail-container">
	    <a class="tag" href="#">${community.cb_tag}></a>
	    <h2 class="title">${community.cb_title}</h2>
	  
		<div>
			<div class="writerInfo">
			  	${community.cb_writer}<br>
			  	${community.cb_date}
			</div>
	    </div>
	    <hr>
	  
	    <div class="content">
	  		${community.cb_content}
	    </div>
	  
	    <div class="comments-container">
	    	<h6>댓글</h6>
	    	<hr>
	    	<div class="comments" >
	    		<ul>
	    			<li class="comment">
	    				<div>
		    				<span>User</span>
				    		<p>comments contents</p>
		    				<div class="comment-info">
				    			<span>2023-01-02</span>
				    			<span class="writing-reply">댓글쓰기</span>
				    		</div>
		    				<div class="write reply-form hidden">
					    		<span>User</span>
					    		<textarea rows="1" placeholder="내용 입력"></textarea>
					    		<div class="register">
						    		<input class="cancellation" type="button" value="취소">
						    		<input type="button" value="등록">
					    		</div>
					    	</div>
	    				</div>
	    			</li>
	    			
	    			<li class="comment reply">
	    				<div>
		    				<span>User</span>
				    		<p>comments contents</p>
		    				<div class="comment-info">
				    			<span>2023-01-02</span>
				    			<span class="writing-reply">댓글쓰기</span>
				    		</div>
		    				<div class="write reply-form hidden">
					    		<span>User</span>
					    		<textarea rows="1" placeholder="내용 입력"></textarea>
					    		<div class="register">
						    		<input class="cancellation" type="button" value="취소">
						    		<input type="button" value="등록">
					    		</div>
					    	</div>
	    				</div>
	    			</li>
	    			
	    			<li class="comment">
	    				<div>
		    				<span>User</span>
				    		<p>comments contents</p>
		    				<div class="comment-info">
				    			<span>2023-01-02</span>
				    			<span class="writing-reply">댓글쓰기</span>
				    		</div>
		    				<div class="write reply-form hidden">
					    		<span>User</span>
					    		<textarea rows="1" placeholder="내용 입력"></textarea>
					    		<div class="register">
						    		<input class="cancellation" type="button" value="취소">
						    		<input type="button" value="등록">
					    		</div>
					    	</div>
	    				</div>
	    			</li>
	    			
	    		</ul>
	    	</div>
	    	
	    	<div class="write commnet-form">
	    		<span>User</span>
	    		<textarea rows="1" placeholder="내용 입력"></textarea>
	    		<div class="register">
					<input type="button" value="등록">
				</div>
	    	</div>
	    </div>
	</div>
	
	<div class="d-flex justify-content-end">
	    <a href="/community/edit/?no=${community.cb_no}" class="btn btn-primary">수정</a>
	    <a href="/community/delete/?no=${community.cb_no}" class="btn btn-success">삭제</a>
	    <a href="/community" class="mx-2 btn btn-secondary">목록</a>
	</div>
</div>
	  
<%@include file="../common/footer.jsp"%>
</body>
<script src="/views/js/darkMode.js"></script>
<script type="text/javascript">
	const writing_replys = document.querySelectorAll(".writing-reply");
	const reply_form = document.querySelector(".reply-form");
	writing_replys.forEach( writing_reply => {
		writing_reply.onclick = (e) => {
			e.target.parentElement.parentElement.querySelector(".reply-form").classList.remove("hidden");
		}
	});
	
	const cancellations = document.querySelectorAll(".cancellation");
	cancellations.forEach( cancellation => {
		cancellation.onclick = (e) => {
			e.target.parentElement.parentElement.classList.add("hidden");
		}
	});
</script>
</html>