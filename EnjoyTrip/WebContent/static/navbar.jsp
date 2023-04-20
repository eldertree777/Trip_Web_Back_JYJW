<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.member.model.MemberDto"%>

<%
String root = request.getContextPath();
MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");

String checked = "";
String saveId = "";
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie cookie : cookies) {
		if ("ssafy_id".equals(cookie.getName())) {
	checked = " checked";
	saveId = cookie.getValue();
	break;
		}
	}
}
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light h-100 p-4">
	<div class="container">
		<a class="navbar-brand text-primary fw-bold" href="./index.jsp">
			<h1>Enjoy Trip</h1>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="attraction.html"><i
						class="fa-solid fa-map-location-dot"></i> 지역별여행지</a></li>
				<li class="nav-item"><a class="nav-link" href="plan.html"><i
						class="fa-regular fa-calendar"></i> 나의여행계획</a></li>
				<li class="nav-item"><a class="nav-link" href="hotplace.html"><i
						class="fa-solid fa-camera"></i> 핫플자랑하기</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="<%=root%>/article?action=board"><i
						class="fa-solid fa-list"></i> 여행정보공유</a></li>
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="notice.html"><i class="fa-solid fa-list"></i> 공지사항</a></li>
			</ul>

			<%
			if (memberDto == null) {
			%>
			<!-- 로그인  전 -->
			<ul id="before_login" class="navbar-nav mb-2 me-2 mb-lg-0">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-user"></i>
				</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
						<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
							data-bs-target="#register_modal"><i
								class="fa-solid fa-user-plus"></i> 회원가입</a></li>
						<li><a class="login dropdown-item" href="#"
							data-bs-toggle="modal" data-bs-target="#login_modal"><i
								class="fa-solid fa-key"></i> 로그인 </a></li>
						<li><a class="login dropdown-item" href="#"><i
								class="fa-solid fa-key"></i> 비밀번호 찾기 </a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<!-- 로그인 후 -->
			<div id="after_login" class="d-flex">
				<div>
					<a href="#" target="_self" class="nav-link"><span
						class="badge rounded-pill bg-primary">S</span> <%=memberDto.getUserId()%>님
						환영합니다. </a>
				</div>
				<div>
					<a class="dropdown-item ms-2" href="#" data-bs-toggle="modal"
						data-bs-target="#mypage_modal"><i class="fa-solid fa-user"></i>
						마이페이지</a>
				</div>
				<div>
					<a href="<%=root%>/user?action=logout"
						class="logout dropdown-item ms-2" id="btn-logout"><i
						class="fa-solid fa-right-to-bracket" id="btn-logout"
						style="margin-left: 10px;"></i> 로그아웃</a>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</nav>



<!-- 회원가입 modal start -->
<div class="modal fade" id="register_modal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<form id="form-join" method="POST" action="">
				<!-- Modal Header -->
				<header class="modal-header">
					<h5 class="modal-title">회원가입</h5>
					<button type="button" aria-label="Close" class="btn-close"
						data-bs-dismiss="modal"></button>

				</header>

				<!-- Modal body -->

				<div class="modal-body">
					<div class="container-fluid">
						<div class="row mb-1 text-center">
							<div class="col-3">이름</div>
							<div class="col">
								<input type="text" placeholder="이름" class="form-control"
									id="username" name="username">
							</div>
						</div>
						<div class="row mb-1 text-center">
							<div class="col-3">아이디</div>
							<div class="col">
								<input type="text" placeholder="아이디" class="form-control"
									id="userid" name="userid">
							</div>
						</div>
						<!---->
						<div class="row mb-1 text-center">
							<div class="col-3">비밀번호</div>
							<div class="col">
								<input type="password" placeholder="비밀번호" class="form-control"
									id="userpwd" name="userpwd">
							</div>
						</div>
						<div class="row mb-1 text-center">
							<div class="col-3">비밀번호확인</div>
							<div class="col">
								<input type="password" placeholder="비밀번호확인" class="form-control"
									id="pwdcheck" name="pwdcheck">
							</div>
						</div>
						<div class="row mb-1 text-center">
							<div class="col-3">이메일</div>
							<div class="col-3">
								<input type="text" placeholder="이메일" class="form-control"
									id="emailid" name="emailid">
							</div>
							<div class="col-1">
								<span class="input-group-text">@</span>
							</div>
							<div class="col">
								<select class="form-select form-select-md mb-3"
									aria-label=".form-select-md example" id="emaildomain"
									name="emaildomain">
									<option value="">도메인 선택</option>
									<option value="ssafy.com">SSAFY</option>
									<option value="google.com">GOOGLE</option>
									<option value="kakao.com">KAKAO</option>
									<option value="naver.com">NAVER</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btn-join" class="btn btn-primary btn-sm">
						회원가입</button>
					<button type="button" class="btn float-right btn-danger btn-sm"
						data-bs-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 회원가입 modal end -->

<!-- 로그인 modal start -->
<div class="modal fade" id="login_modal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="form-login" method="POST" action="">
				<!-- Modal Header -->
				<header class="modal-header">
					<h5 class="modal-title">로그인</h5>
					<button type="button" aria-label="Close" class="btn-close"
						data-bs-dismiss="modal"></button>

				</header>
				<div id="login-modal___BV_modal_body_" class="modal-body">
					<div class="container-fluid">
						<div class="row mb-1 text-center">
							<div class="col-3">아이디</div>
							<div class="col">
								<input id="userid_login" type="text" placeholder="아이디"
									class="form-control" name="userid">
							</div>
						</div>
						<div class="row mb-1 text-center">
							<div class="col-3">비밀번호</div>
							<div class="col">
								<input id="userpwd_login" type="password" placeholder="비밀번호"
									class="form-control" name="userpwd">
							</div>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btn-login" class="btn btn-primary btn-sm">
						로그인</button>
					<button type="button" class="btn float-right btn-danger btn-sm"
						data-bs-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 로그인 modal end -->

<!-- 마이페이지 modal start -->

<div class="modal fade" id="mypage_modal" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="form-update" method="POST">
				<!-- Modal Header -->
				<input type="hidden" name="action" value="update">
				<header class="modal-header">

					<h5 class="modal-title">마이페이지</h5>
					<button type="button" aria-label="Close" class="btn-close"
						data-bs-dismiss="modal"></button>


				</header>
				<div id="login-modal___BV_modal_body_" class="modal-body">
					<div class="container-fluid">
						<div class="row mb-1 text-center">
							<div class="col-3">아이디 수정</div>
							<div class="col">
								<input id="userid-update" name="userid" type="text" placeholder="너굴맨"
								class="form-control" readonly>
							</div>
						</div>
						<div class="row mb-1 text-center">
							<div class="col-3">비밀번호 수정</div>
							<div class="col">
								<input id=userpwd-update name="userpwd" type="password"
									placeholder="비밀번호" class="form-control">
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->

				<div class="modal-footer">
					<button type="submit" id="btn-update"
						class="btn btn-primary btn-sm" data-bs-dismiss="modal">
						수정</button>
					<button type="button" id="btn-delete"
					class="btn float-right btn-danger btn-sm"
						data-bs-dismiss="modal">회원탈퇴</button>
				</div>

			</form>
		</div>
	</div>
</div>
<!-- 마이페이지 modal end -->