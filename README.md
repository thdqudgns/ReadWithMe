# :pushpin: 2. Read With Me

### 개요  
책을 읽다보면 동일한 내용을 읽은 다른 사람의 생각이 궁금할 때가 있다. 다른 사람에게 자신이 알게된 부분을 나누고 싶을 때가 있다. 책을 읽고 나누며 많은 것을 배울 수 있고 깊은 대화를 나눌 수 있다. 독서모임을 하도록 사람을 모으고, 각자의 이야기를 나누는 서비스를 제공하는 사이트를 만들고자 한다. 

### 구현기능
- 회원서비스 : (소셜)로그인, 로그아웃, (소셜)회원가입, 본인확인, 마이페이지, 탈퇴 
- 마이페이지 : 프로필 수정, 비밀번호 변경, To do List 작성 후 메일 발송, 모임일정 캘린더, 자신이 작성한 후기 조회 수정 삭제
- 커뮤니티(모임, 후기, 명언) : 목록조회, 모임신청, 글 작성, 수정, 삭제, 신고, 파일업로드, 댓글 작성, 댓글 수정, 댓글 삭제, 댓글 신고, 지도 API, 도서검색 API
- 안내&문의(공지, 질문, 문의) : 목록조회, 글 작성, 수정, 삭제, 신고, 파일업로드 
- 관리자서비스 : 회원 조회 및 제재, 게시판 조회 및 삭제, 신고내역 조회 및 삭제

### 설계의 주안점
- 다양한 SNS를 통한 로그인 시스템
- 회원가입시 본인인증 시스템
- 회원이 결심한 To do List를 이메일 발송
- 모임일정을 '마이페이지 - 캘린더'에서 확인 가능
- 독서모임을 생성하여 회원끼리 모임에 참여할 수 있음
- 후기게시판을 통해 여러 모임의 특징 및 장점과 자신이 읽은 책의 내용을 나눔
- 1:1문의 기능을 통해 자신의 질문에 답변을 확인 가능
- 메인페이지에서 모임, 후기, 공지를 간단하게 확인 가능 
- 메인페이지에서 지도 API를 통해 오프라인 모임 장소 확인 가능
- 도서 검색 API 구현하여 원하는 도서를 검색하고, 상세한 도서정보를 확인할 수 있음
- 관리자페이지를 통해 회원, 게시글, 안내&문의, 신고내역을 관리

### 사용기술 및 개발환경
- 사용기술: Java, Spring STS3, Servlet/JSP, HTML5, CSS3, Javascript, Ajax, XML, Json, jQuery
- Open source & Library: Bootstrap, ojdbc6, jstl, cos, standard
- Server: Apache Tomcat v9.0
- IDE: Eclipse, Oracle SQL Developer
- DBMS: Oracle 11g
- OS: Window 8 ,10 64bit

### 팀 구성
- 팀원 1 (팀장)
	- 이름 : 송병훈
	- 역할 : 명언게시판 및 관리, 후기게시판 및 관리, 신고관리 구현
- 팀원 2
	- 이름 : 민정은
	- 역할 : 로그인과 회원가입과 마이페이지를 비롯한 회원서비스, 회원관리, 모임관리 구현
- 팀원 3
	- 이름 : 반예지
	- 역할 : 독서모임 게시판 구현
- 팀원 4
	- 이름 : 조아연
	- 역할 : 메인페이지, 마이페이지의 후기 관리 구현
- 팀원 5
	- 이름 : 홍의표
	- 역할 : 공지사항, 자주묻는질문, 1:1질문 및 관리 구현
