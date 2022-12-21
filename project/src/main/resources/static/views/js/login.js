function kakao_login(){
	
	location.href="https://kauth.kakao.com/oauth/authorize?client_id=59cc93f38a07bc58003afcc13ee2a761&redirect_uri=http://localhost:8888/auth/kakao/callback&response_type=code";
}



function logout(login_group){
	let REST_API_KEY;
	let LOGOUT_REDIRECT_URI;
	if(login_group === "kakao"){
		REST_API_KEY = "59cc93f38a07bc58003afcc13ee2a761";
		LOGOUT_REDIRECT_URI = "http://localhost:8888/auth/kakao/logout";
		location.href = `https://kauth.kakao.com/oauth/logout?client_id=${REST_API_KEY}&logout_redirect_uri=${LOGOUT_REDIRECT_URI}`;
		return;
	} else if(login_group === "naver"){
		
	} else if(login_group === "normal"){
		location.href = '/logout'
	}
}

function loginPage(){
	location.href="http://localhost:8888/auth/loginPage";
}

function normal_login(){
	
}


