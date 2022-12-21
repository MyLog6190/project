<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
  <title>login-success</title>
 <%-- <meta http-equiv="refresh" content="5;url=home/in"> --%>
  <link rel="stylesheet" href="/views/css/naverloginsuccess.css">
  <script>
        //변수 num 선언
        var num = 5;
        //countdown 함수 선언
        function countdown(){
            //document 객체의 document.getElementById 메소드 사용 : id 있는 곳에 시간문자 삽입
            document.getElementById("second").innerHTML = 5;
            
            //window 객체의 setInterval 메소드 : n초마다 실행
            window.setInterval(
                //실행할 코드
                function(){
                    document.getElementById("second").innerHTML = --num;
                    if(num==1){location.replace("home/in");}
                }
                //n초마다 실행
                , 1*1000);
        }
    </script>
  </head>
  <body onLoad = "countdown();">
  <section>
        <div class="container">
            <div>
               <h1 class ="text-title">환영합니다!</h1>
               <p class="text-affirm"> 
                  <span>${name}</span>님의 로그인 성공!<br><br> 이메일 주소는 <strong>${email}</strong>입니다.
               </p>
            </div>
            <div class="start-home">
                 <button type="button" class="start-btn" onclick="location.href='home/in'">시작하기</button>
            </div>
            <div class= "count-alarm">
                <p class="alarm-notice"><span id = "second"></span>초 후에 메인페이지로 이동합니다.</p>
            </div>
        </div>
    </section>
    </body>
    </html> <%-- naverloginsuccess.jsp --%>