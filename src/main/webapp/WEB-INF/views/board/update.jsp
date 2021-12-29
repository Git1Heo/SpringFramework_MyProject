<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/lang/summernote-ko-KR.js"></script>

	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body style="background-color: whitesmoke;">
<div class="content-wrapper container">
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-12">
            <div class="card  card-primary card-outline">
              <div class="card-body">
                <h4 class="px-4">글 수정</h4>
                <div class="card-body register-card-body">		
					<form action="/board/update" method="post">
				      <table class="table table-write" id="add_mt">
						<colgroup>			
						<col style="width:120px" />
						<col style="width:*" />						
						</colgroup>
						<tr>						
							<th>작성자</th>
							<td>				
								<img alt="" src="/resources/upload/member/${member.m_profile}" class="img-responsive rounded-circle" style="height: 40px; width: 40px;">
								<span class="mx-2 fw-bold">${member.m_mbti}</span>
								<span class="fw-bolder" >${sessionScope.loginID} </span>			
							</td>
						</tr>
						<tr>						
							<th>제목</th>
							<td><input type="text" class="form-control" id="title" name="b_title" placeholder="제목" value="${board.b_title}" required></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea id="summernote" name="b_contents">${board.b_contents}</textarea>
							</td>
						</tr>
					</table>			      
			     	 <input type="hidden" name="b_number" value="${board.b_number }">
					<input type="hidden" class="form-control" name="b_mbti"  value="${member.m_mbti}" >
					<input type="hidden" class="form-control" name="b_profile"  value="${member.m_profile}" >
					<input type="hidden" class="form-control" name="b_writer" value="${sessionScope.loginID}">
			  	 	 <div style="text-align: center;">
						<input type="submit" value="수정 완료">
					</div>
			    </form>
			    </div>
			    
              </div>
            </div>
		  </div>
        </div>
      </div>
    </div>
  </div>


      <div class="container">
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
<script>

$('#summernote').summernote({
	height: 600,                 // 에디터 높이
	minHeight: null,             // 최소 높이
	maxHeight: null,             // 최대 높이
	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	lang: "ko-KR",					// 한글 설정
	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
		onImageUpload : function(files) {
			uploadSummernoteImageFile(files[0],this);
		},
		onPaste: function (e) {
			var clipboardData = e.originalEvent.clipboardData;
			if (clipboardData && clipboardData.items && clipboardData.items.length) {
				var item = clipboardData.items[0];
				if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
					e.preventDefault();
				}
			}
		}
	}
});



/**
* 이미지 파일 업로드
*/
function uploadSummernoteImageFile(file, editor) {
data = new FormData();
data.append("file", file);
$.ajax({
data : data,
type : "POST",
url : "/uploadSummernoteImageFile",
contentType : false,
processData : false,
success : function(img_name) {
	$(".spinner-border").css("display","inline-block");
	setTimeout(function() {
		$(".spinner-border").css("display","none");
		$(editor).summernote('insertImage', img_name.url);
		console.log(img_name);
		console.log(img_name.url);
	}, 4000);
}
});
}

</script>
</html>