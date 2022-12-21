<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <%@include file="common/header.jsp"%>
<title>회원가입</title>
</head>
<body>
<div class="container">
  <h1>회원가입</h1>
<form class="" method="POST" action="/auth/register" enctype="multipart/form-data">
  <div class="mb-3 mx-3">
    <label for="user_id" class="form-label">이메일(아이디)</label>
    <input type="email" class="form-control" name="user_id" id="user_id" placeholder="name@example.com">
  </div>

  <div class="mb-3 mx-3">
    <label for="password" class="form-label">비밀번호</label>
    <input type="password" class="form-control" name="password" id="password">
  </div>
  
   <div class="mb-3 mx-3">
    <label for="password2" class="form-label">비밀번호 확인</label>
    <input type="password" class="form-control" id="password2">
  </div> 
  
    <div class="mb-3 mx-3">
    <label for="name" class="form-label" >이름</label>
    <input type="text" class="form-control" name="name" id="name">
  </div>
  
    <div class="mb-3 mx-3">
    <label for="weight" class="form-label">몸무게</label>
    <input type="text" class="form-control" name="weight" id="weight">
  </div>
  
  <div class="d-flex">
    <div class="mb-3 mx-3 form-check">
      <input type="radio" class="form-check-input" checked name="sex" value="male" id="male">
      <label class="form-check-label"  for="male">남</label>
    </div>
    <div class="mb-3 mx-3 form-check">
      <input type="radio" class="form-check-input" name="sex" value="female" id="female">
      <label class="form-check-label" for="female">여</label>
    </div>
  </div>

  
  <div class="mb-3">
  <label for="profile_image" class="form-label">프로필 사진</label>
  <input class="form-control" type="file" name="file" id="profile_image">
</div>
  
    <input type="hidden" class="form-control" name="login_group" value="normal" id="login_group">
    <input type="hidden" class="form-control" name="role" value="USER" id="login_group">
    
  
 <div class="d-flex justify-content-center">
  <button type="submit" class="mx-2 btn btn-primary">등록</button>
  <button type="reset" class="mx-2 btn btn-secondary">초기화</button>
  </div>
</form>

</div>
</body>
  <%@include file="common/footer.jsp"%>
</html>