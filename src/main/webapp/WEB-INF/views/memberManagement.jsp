<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <link href="${path}/resources/css/header.css" rel="stylesheet"/>  --%>

<style>
	 header{
    background-color : blanchedalmond;
    height: 150px;   
  }

  #headline{
    height: 105px;  
  }
</style>

</head>
<body class="container">
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
     	 <span>     ${sessionScope.loginID}님 환영합니다.</span>
     </c:if> 
     	 
      <c:if test="${empty sessionScope.loginID }">
        <button class="btn btn-outline-primary btn float-right" data-bs-toggle="modal" data-bs-target="#exampleModal" style="float: right;">Login</button>
      </c:if>
      
      <c:if test="${!empty sessionScope.loginID }">
        <a href="logout"><button class="btn btn-outline-primary" style="float: right;">Logout </button></a> 
      </c:if>
      
      <c:if test="${empty sessionScope.loginID }">
        <a href="/signup" style="float: right;" class="m-2 " id="singin">회원가입</a>
      </c:if>
      
       <c:if test="${!empty sessionScope.loginID }">
        <a style="float: right;" class="m-2 " >mypage</a> 
       </c:if> 
      </div>

    </div>
  	</header>

 
  	<main >
	<h2 class="mt-5"> 운영자 전용 멤버관리 페이지 입니다. </h2>
	  <table class="table table-striped table-hover" style="width: 90%; margin-left: auto; margin-right: auto;">
        <thead>
            <tr>
                <th>회원 번호</th>
                <th>프로필 사진</th>
                <th>ID</th>
                <th>이름</th>
                <th>MBTI</th>
                <th>삭제</th>
            </tr>
        </thead>
   		 <c:forEach items="${member}" var="member">
			<tr>
				<td>${member.m_number}</td>
	   			<td><img alt="" src="/resources/upload/member/${member.m_profile}" class="img-responsive rounded-circle" style="height: 40px; width: 40px;"> </td> 				
				<td>${member.m_id} </td>
				<td>${member.m_name} </td>			
				<td>${member.m_mbti} </td>
				<td><a href="/memberManagement/delete?m_number=${member.m_number}">삭제</a> </td>
			 </tr> 
			<br>
		</c:forEach>
    </table>  
    </main>
        <!-- 푸터 -->
    <footer>
        <div class="container bg-light">
            <div class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
                <div class="col-md-4 d-flex align-items-center">
                  <a href="/" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                    <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
                  </a>
                  <span class="text-muted">&copy; 2021 your name</span>
                </div>
                <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
                  <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16">
                      <path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
                    </svg></a></li>
                  <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-instagram" viewBox="0 0 16 16">
                      <path d="M8 0C5.829 0 5.556.01 4.703.048 3.85.088 3.269.222 2.76.42a3.917 3.917 0 0 0-1.417.923A3.927 3.927 0 0 0 .42 2.76C.222 3.268.087 3.85.048 4.7.01 5.555 0 5.827 0 8.001c0 2.172.01 2.444.048 3.297.04.852.174 1.433.372 1.942.205.526.478.972.923 1.417.444.445.89.719 1.416.923.51.198 1.09.333 1.942.372C5.555 15.99 5.827 16 8 16s2.444-.01 3.298-.048c.851-.04 1.434-.174 1.943-.372a3.916 3.916 0 0 0 1.416-.923c.445-.445.718-.891.923-1.417.197-.509.332-1.09.372-1.942C15.99 10.445 16 10.173 16 8s-.01-2.445-.048-3.299c-.04-.851-.175-1.433-.372-1.941a3.926 3.926 0 0 0-.923-1.417A3.911 3.911 0 0 0 13.24.42c-.51-.198-1.092-.333-1.943-.372C10.443.01 10.172 0 7.998 0h.003zm-.717 1.442h.718c2.136 0 2.389.007 3.232.046.78.035 1.204.166 1.486.275.373.145.64.319.92.599.28.28.453.546.598.92.11.281.24.705.275 1.485.039.843.047 1.096.047 3.231s-.008 2.389-.047 3.232c-.035.78-.166 1.203-.275 1.485a2.47 2.47 0 0 1-.599.919c-.28.28-.546.453-.92.598-.28.11-.704.24-1.485.276-.843.038-1.096.047-3.232.047s-2.39-.009-3.233-.047c-.78-.036-1.203-.166-1.485-.276a2.478 2.478 0 0 1-.92-.598 2.48 2.48 0 0 1-.6-.92c-.109-.281-.24-.705-.275-1.485-.038-.843-.046-1.096-.046-3.233 0-2.136.008-2.388.046-3.231.036-.78.166-1.204.276-1.486.145-.373.319-.64.599-.92.28-.28.546-.453.92-.598.282-.11.705-.24 1.485-.276.738-.034 1.024-.044 2.515-.045v.002zm4.988 1.328a.96.96 0 1 0 0 1.92.96.96 0 0 0 0-1.92zm-4.27 1.122a4.109 4.109 0 1 0 0 8.217 4.109 4.109 0 0 0 0-8.217zm0 1.441a2.667 2.667 0 1 1 0 5.334 2.667 2.667 0 0 1 0-5.334z"/>
                    </svg></a></li>
                  <li class="ms-3"><a class="text-muted" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
                      <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
                    </svg></a></li>
                </ul>
              </div>
        </div>
    </footer>
    

</body>
</html>