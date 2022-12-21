function kakao_login(){
	const REST_API_KEY = "59cc93f38a07bc58003afcc13ee2a761";
	const CALLBACK_URI = "http://localhost:8888/auth/kakao/callback";
	location.href=`https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${CALLBACK_URI}&response_type=code`;
}

function naver_login(){
	const REST_API_KEY = "3deOKKZcoWV8i0SQ0ubJ";
	const CALLBACK_URI = "http://localhost:8888/auth/naver/callback";
	const STATE = getUUID();
	location.href=`https://nid.naver.com/oauth2.0/authorize?client_id=${REST_API_KEY}&redirect_uri=${CALLBACK_URI}&response_type=code&state=${STATE}`;	
}


function getUUID() { // UUID v4 generator in JavaScript (RFC4122 compliant)
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 3 | 8);
    return v.toString(16);
  });
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
		location.href = '/auth/naver/logout'
	} else if(login_group === "normal"){
		location.href = '/logout'
	}
}

function loginPage(){
	location.href="/auth/loginPage";
}
