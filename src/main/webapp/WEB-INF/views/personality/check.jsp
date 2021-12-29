<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="${path}/resources/css/header.css" rel="stylesheet"/> 
<link href="${path}/resources/css/check.css" rel="stylesheet"/> 
<style>
        header{
     
    background-color : blanchedalmond;
    height: 105px;   
  }

  #headline{
    height: 105px;  
  }

</style>
<script>

var arr = []; 
function update(clicked_id,event){
	
 	var value=parseInt(event.target.value); 
	console.log("id "+ clicked_id +" vlaue " +value)
	arr[clicked_id] = value;
	
	for(let i=0;i<arr.length;i++){
		console.log("[ " + i+ " ]  :  " + arr[i]);
	}
	
	var add=0;
	for(let i=0;i<arr.length;i++){
		add=add+arr[i];
	}	
	document.getElementById("end").value=add;	
/* 	var listVar = $('input[name=join1]:checked').val();
	console.log(listVar) */
}




function iiend(){
 	console.log("외않되?")
	if(arr.length>=3)
		checkEnd.submit();
	else
		alert("모든 항목을 체크하세요.");
 		
}
</script>
</head>
<body class="container" style="background-color: whitesmoke;">
	  <!-- 헤더 -->
  <header >
    <div  class="shadow p-3 mb-5 bg-body rounded opacity-75" id="headline">
      <div>
        <h4 class="text-center mt-2"><strong>MBTI 게시판</strong></h4>
      </div>
      <div>
      
      <a href="/">
      	<img alt="" src="/resources/upload/home.png" >
      </a>
  
      <c:if test="${!empty sessionScope.loginID }">
     	 <span class="ml-3">${sessionScope.loginID}님 환영합니다.</span>
     </c:if> 
     	 
      <c:if test="${empty sessionScope.loginID }">
        <button class="btn btn-outline-primary btn float-right" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right;">Login</button>
      </c:if>
      
      <c:if test="${!empty sessionScope.loginID }">
        <a href="/logout"><button class="btn btn-outline-primary" style="float: right;">Logout </button></a> 
      </c:if>
      
      <c:if test="${empty sessionScope.loginID }">
        <a href="/signup" style="float: right;" class="m-2 " id="singin">회원가입</a>
      </c:if>
      
       <c:if test="${!empty sessionScope.loginID }">
        <a href="/mypage?m_id=${sessionScope.loginID}" style="float: right;" class="m-2 " >mypage</a> 
       </c:if> 
      </div>

    </div>
  </header>
  
  <section style="background-color: rgb(250, 250, 250);">
  
  <div class="progress">
  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
</div>
  	<div>
  	
  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">1. 외로울 때 속마음을 나눌 수 있는 친구가 있다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="0" name="1" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="0" name="1" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="0" name="1" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="0" name="1" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="0" name="1" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>

  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">2. 다른 사람들이 해내는 일이라면 나는 그보다 더 잘할 수 있다고 믿는다. </p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="1" name="2" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="1" name="2" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="1" name="2" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="1" name="2" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="1" name="2" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>

  <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">3. 나의 성별에 대해 불만이 없다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="2" name="3" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="2" name="3" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="2" name="3" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="2" name="3" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="2" name="3" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  
   <div id="qna" class="mx-auto px-5 my-5">
    <p class="mx-5">3. 나의 성별에 대해 불만이 없다.</p>
    <div id="ans" class="mx-auto">
        <span style="color: rgb(51, 164, 116);">매우그렇다</span>
        <input type="radio" class="a1"  id="2" name="4" value="5" onclick="update(this.id,event)"> 
        <input type="radio" class="a2"  id="2" name="4" value="4" onclick="update(this.id,event)"> 
        <input type="radio" class="a3"  id="2" name="4" value="3" onclick="update(this.id,event)"> 
        <input type="radio" class="a4"  id="2" name="4" value="2" onclick="update(this.id,event)"> 
        <input type="radio" class="a5"  id="2" name="4" value="1" onclick="update(this.id,event)"> 
        <span style="color: rgb(136, 97, 154);">전혀아니다</span>
    </div>
  </div>
  	
  	</div>
 
    <div>
  	<form action="/personality/checkEnd" method="get" name="checkEnd">
  		<input type="text" name="checkValue" id="end" value="11">
  		<input type="button" value="검사완료" class="btn btn-primary" onclick="iiend()">
	</form>
	</div>
	
	<!-- <a href="/personality/checkEnd"><button class="btn btn-primary">검사 완료</button></a> -->	
  </section>
  
  
      <div class="container" >
        <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
          
          <div class="col-md-4 d-flex align-items-center">
            <span class="text-muted">&copy; 2021 HSW, Project</span>
          </div>      
          <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <span>My git address</span>
            <li class="ms-3"><a class="text-muted" href="https://github.com/Git1Heo/MyProject"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
              <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
            </svg></a></li>
          </ul>
        </footer>
      </div>
      
</body>
</html>