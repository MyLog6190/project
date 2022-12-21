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
    <a id="kakao-login-btn" href="javascript:kakao_login()">
      <img src="/views/images/logimages/kakao_login_button.png" width="300px" height="45px"
        alt="카카오 로그인 버튼" />
    </a>
</div>
<div class="center3">
<img src="/views/images/logimages/naver_login_button.png" width=300px height=45px alt="네이버버튼">
</div>
<button onclick="loginPage();" class="login-btn">이메일로 로그인</button>
</div>
<script src="/views/js/login.js"></script>
</body>

</html>