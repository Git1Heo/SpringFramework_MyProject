<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="${path}/resources/js/signup.js"></script> 
    <style>
        body{
            background-color: white;
        }
        input{
            height: 50px;
            font-size: xx-large;
        }
        #endButton{
            height: 60px;
        }
        #select{
            color: gray;
            font-size: large;
        }
        #ddd{
            background-color: rgb(250,250,250);
        }
    </style>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script>
	    	
	function idDuplicate(){
		
	    const exp = /^(?=.*[a-z])(?=.*\d)[a-z\d-_]{5,20}$/; 
		const id=document.getElementById("id").value;
		console.log(id);
		const checkResult=document.getElementById("idoutput");
		
		$.ajax({
			type:'post', 
			url: 'idDuplicate', 
			data : {'id':id}, 
			dataType : 'text', 
			success : function(result){ 
/* 				console.log('ajax성공')
				console.log(result) */
				
				if(result=="ok"){

				    if(id.length==0){
				    	checkResult.innerHTML="필수 입력값입니다.";
				    	checkResult.style.color="red";
				    }
				    else if(id.match(exp)){
				       /*  console.log("유효한 형식입니다.") */
				        checkResult.innerHTML="GOOD";
				        checkResult.style.color="green"
				    }
				    else{
				        /* console.log("유효하지 않은 형식입니다.") */
				        checkResult.innerHTML="유효하지 않은 형식입니다.";
				        checkResult.style.color="red"
				    }
				    
				}
				else{
					checkResult.style.color = 'red';
					checkResult.innerHTML='이미 사용중인 아이디입니다.';
				}
			
			},
			error : function(){
				console.log('ajax실패');
			}
		});
		
	}
	
	function signupSubmit(){
		const id=document.getElementById("idoutput").innerText
		const pw1=document.getElementById("pw1output").innerText
		const pw2=document.getElementById("pw2output").innerText
		const name=document.getElementById("nameoutput").innerText
		const phone=document.getElementById("phone-check-result").innerText
		if(id=="GOOD" && pw1=="GOOD" && pw2=="GOOD" && name=="GOOD" && phone=="GOOD")
			signup_form.submit();	
		else
			alert("다시입력하세요");
	}
	
	</script>

</head>
<body style="background-color: whitesmoke;">
    <div class="container" id="ddd">
        <div class ="py-5 text-center" >
            <h2 >Checkout form</h2>
            <p class="lead" >회원가입 페이지</p>
        </div>
        
        <div class="row" style="width: 100%">
    		<form action="signup" method="POST" name="signup" enctype="multipart/form-data" id="signup_form">
             <div style="width: 60%; float:none; margin:0 auto" >
                <div class="input-group mb-3">
                    <h4 class="mb-2">아이디</h4>
                    <input type="text" name="m_id" class="form-control md-0.8" id="id" onblur=" idDuplicate();" placeholder="영문소문자와 숫자를 사용해 아이디를 입력하세요(5~20)" style="width: 100% ;">
                    <p id="idoutput"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">비밀번호</h4>
                    <input type="password" name="m_password" class="form-control mb-0.8" id="pw1" onblur="pw1check()" placeholder="8~16 자리의 비밀번호를 영문대소문자와 숫자를 이용해 입력하세요" style="width: 100% ;">
                    <p id="pw1output"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">비밀번호 확인</h4>
                    <input type="password" class="form-control mb-0.8" id="pw2" onkeyup="pw2check()" placeholder="비밀번호를 다시 입력하세요" style="width: 100% ;">
                    <p id="pw2output"></p>
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">이름</h4>
                    <input type="text" name="m_name"  class="form-control mb-0.8" id="name" onblur="namecheck()" placeholder="이름을 입력하세요" style="width: 100% ;">
                    <p id="nameoutput"></p>
                </div>

                <div class="mb-2">
                    <h4 style="display: inline;">본인 확인 이메일</h4>
                    <span id="select">(선택)</span>
                </div>
                <div class="input-group mb-3">
                    <input type="text" name="m_mail" class="form-control" placeholder="본인 확인 이메일" style="width: 100px;" >
                    <span class="input-group-text">@</span>
                    <select name="m_com" id="@" class="form-select" >
                        <option value="선택하세요">선택하세요</option>
                        <option value="@gmail.com">gmail.com</option>
                        <option value="@naver.com">naver.com</option>
                        <option value="@daum.net">daum.net</option>
                    </select>                    
                </div>

                <div class="input-group mb-3">
                    <h4 class="mb-2">전화번호</h4>        
                    <input type="text" name="m_phone" class="form-control" id="pn" onblur="pncheck()" placeholder="OOO-OOOO-OOO 형식으로 전화번호를 입력하세요" style="width: 100% ;">
                    <p id="phone-check-result"></p>
                </div>	
						<!-- <button class="btn btn btn-primary btn-round mb-4" style="width: 100%" id="endButton" onclick="signup()">회원가입</button> -->
					    <input type="button" value="회원가입"  class="btn btn btn-primary btn-round my-4 " style="width: 100%" id="endButton" onclick="signupSubmit()">
    
             </div>
    		</form>
         </div>


    </div>
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