<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log-in</title>
<link rel="stylesheet" href="/views/css/login.css">
</head>
<body>
<div class="container">
<img src="/views/images/logimages/Start_Fit_logo_fin.png" class="center1" alt="로고">
<div class="center2">
    <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=59cc93f38a07bc58003afcc13ee2a761&redirect_uri=http://localhost:8888/auth/kakao/callback&response_type=code">
      <img src="/views/images/logimages/kakao_login_button.png" width="300px" height="45px"
        alt="카카오 로그인 버튼" />
    </a>
</div>
<div class="center3">
<img src="/views/images/logimages/naver_login_button.png" width=300px height=45px alt="네이버버튼">
</div>
<button class="login-btn">이메일로 로그인</button>
</div>
</body>
</html>