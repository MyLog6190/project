<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao JavaScript SDK</title>

</head>
<body>
  <h1> Kakao Login Test</h1>
<script src="https://developers.kakao.com/sdk/js/kakao.js">
</script>
<script>
  Kakao.init('4caf48cfb67028e3113eebfc2a9f060e'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakao-login-btn" href="javascript:loginWithKakao()">
  <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
    alt="카카오 로그인 버튼" />
</a>
<p id="token-result"></p>

<script>



  function loginWithKakao() {
    Kakao.Auth.login({
      scope: 'profile_nickname, profile_image, account_email, gender',
      success: authObj => {
    	  console.log(authObj);
    	  Kakao.API.request({
    		  url:"/v2/user/me",
    		  success: res =>{
    			  const kakao_account = res.kakao_account;
    			  const email = kakao_account.email;
    			  const gender = kakao_account.gender;
    			  const name = kakao_account.profile.nickname;
    			  const profile_image = kakao_account.profile.profile_image_url;
    			console.log({
    				email, gender, name, profile_image
    			})
    		  }
    	  });
      }
    });
  }

  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    var token = getCookie('access-token');
    if(token) {
      Kakao.Auth.setAccessToken(token);
      Kakao.Auth.getStatusInfo()
        .then(function(res) {
          if (res.status === 'connected') {
           console.log('login success, token: ' + Kakao.Auth.getAccessToken());
          }
        })
        .catch(function(err) {
          Kakao.Auth.setAccessToken(null);
        });
    }
  }

  function getCookie(name) {
    var parts = document.cookie.split(name + '=');
    if (parts.length === 2) { return parts[1].split(';')[0]; }
  }
</script>




</body>
</html>