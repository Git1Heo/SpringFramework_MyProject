# MyProject
1. 프로젝트 명 : 심리유형검사 게시판 (심리 유형검사와 게시판 기능을 합친 프로젝트)

2. 기획의도
  심심리 유형검사와 게시판 기능을 합친 프로젝트
  최근 MBTI검사등 심리유형검사의 인기가 높아져서 비슷한 사이트를 만들고자 하는 생각에 계획함
  로그인 후 심리유형검사를 하면 자신의 심리유형이 저장되어 게시판 기능(글쓰기,댓글쓰기)등을 할때 해당정보가 같이 입력된다.
 
3. 벤치마킹
  https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC
  mbti사이트 해당 사이트의 버튼 디자인을 참고

4. 주요기능
  - 심리유형검사
    배열을 선언해서 라디오버튼으로 설문에 답을 할 경우 해당 배열의 자리에 값이 입력된다.
    입력된 값을 합산하여 결과창에서 유형에 맞게 출력을 다르게 한다.
    로그인을 한 경우 해당결과를 사용자의 DB에 저장한다.
  - 게시판
    글쓰기(summernote활용)
    글수정(summernote활용)
    글삭제
    댓글작성
    댓글삭제
    검색
    페이징
    검색결과 페이징
    admin회원관리
 
 - summernote
  섬머노트를 활용한 웹 에디터
  파일저장 처리
  https://www.notion.so/12-07-01-03-5ed598e865b94cb2aa6100756a5f01ec
  파일을 외부에 저장후 url 형식으로 가져옴
  
  ```
  <p>수정수정<img src="/summernoteImage/54930ba3-9bd0-4d58-b8aa-ddedd81c7ac9.png" style="width: 448px;"></p><p><br></p>
  ```
