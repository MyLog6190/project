<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log-in</title>
<link rel="stylesheet" href="/views/css/login.css">
        <!-- BOOTSTRAP CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>

<div class="login-container">
	<img src="/views/images/logimages/Start_Fit_logo_fin.png" class="center1" alt="로고">

<form class="" method="POST" action="/auth/normal/login">

  <div class="mb-3" style="color:white;">
  	<h1>로그인</h1>
  </div>

  <div class="mb-3">
    <label for="user_id" class="form-label" style="color:white;">이메일(아이디)</label>
    <input type="email" class="form-control" name="user_id" id="user_id"  placeholder="name@example.com">
  </div>

  <div class="mb-3">
    <label for="password" class="form-label" style="color:white;">비밀번호</label>
    <input type="password" class="form-control" name="password" id="password">
  </div>
  <button type="submit" class="login-btn">로그인</button>
  </form>
</div>

<script src="/views/js/login.js"></script>

</body>
</html>