<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.ssafy.member.model.MemberDto"%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
<script src="https://kit.fontawesome.com/5f164fb894.js"
	crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
.carousel-inner {
	width: auto;
	height: 500px;
	/* 이미지 높이 변경 */
}

.carousel-item {
	width: 100%;
	height: 100%;
}

.d-block {
	display: block;
	width: auto;
	height: 100%;
}
</style>
</head>

<body>
	<!-- 상단 navbar start -->
	<%@ include file="/static/navbar.jsp"%>
	<!-- 상단 navbar end -->

	<div class="container">
		<div class="row">
			<div class="col-12 text-center">
				<!-- main 영역 start -->
				<div class="p-3 ">
					<!-- 사진 silde start -->
					<div id="carouselExampleCaptions" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="0" class="active" aria-current="true"
								aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="2" aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="3" aria-label="Slide 4"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="4" aria-label="Slide 5"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions"
								data-bs-slide-to="5" aria-label="Slide 6"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-thumbnail" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>1</h5>
									<p>1</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-fluid img-thumbnail"
									alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>2</h5>
									<p>2</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-fluid img-thumbnail"
									alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>3</h5>
									<p>3</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-fluid img-thumbnail"
									alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>4</h5>
									<p>4</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-fluid img-thumbnail"
									alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>5</h5>
									<p>5</p>
								</div>
							</div>

							<div class="carousel-item">
								<img src="./resource/img/top1.jpg"
									class="d-block w-100 card_img_top img-fluid img-thumbnail"
									alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5>6</h5>
									<p>6</p>
								</div>
							</div>

						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<!-- 사진 silde end -->


					<!--추천 관광지-->
					<div class="mt-5 text-center div_center">
						<h2>지역별 추천 여행지</h2>
					</div>
					<div class="row mt-3">
						<div class="col-sm-3">
							<div class="card mt-3">
								<img class="card-img-center" src="resource/img/img5.jpg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="card mt-3">
								<img class="card-img-center" src="resource/img/img6.jpeg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="card mt-3">
								<img class="card-img-center" src="resource/img/img5.jpg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="card mt-3">
								<img class="card-img-center" src="resource/img/img6.jpeg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>
					</div>
					<!--추천 관광지-->

					<!--핫플 관광지-->
					<div class="mt-5 text-center">
						<h2>핫플레이스 여행지</h2>
					</div>
					<div class="row mt-3">
						<div class="col-sm-3" height="100px">
							<div class="card mt-3 h-100">
								<img class="card-img-center h-75" src="resource/img/food.jpg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>
						<div class="col-sm-3" height="100px">
							<div class="card mt-3 h-100">
								<img class="card-img-center h-75"
									src="resource/img/festival1.jpg" alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>

						<div class="col-sm-3" height="100px">
							<div class="card mt-3 h-100">
								<img class="card-img-center h-75" src="resource/img/cafe2.jpeg"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>

						<div class="col-sm-3">
							<div class="card mt-3 h-100">
								<img class="card-img-center h-75"
									src="resource/img/festival2.jpg" alt="Card image cap">
								<div class="card-body">
									<p class="card-text">내용</p>
								</div>
							</div>
						</div>
					</div>
					<!--핫플 관광지-->


					<!--나만의 여행계획!!-->
					<div class="mt-5 text-center">
						<h2>여행 정보 공유</h2>
					</div>
					<div class="row mt-3">
						<div class="col-sm-4">
							<div class="card mt-3">
								<img class="card-img-top" src="resource/img/img1.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">제목</h5>
									<p class="card-text">내용</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">설명1</li>
								</ul>
								<div class="card-body">
									<a href="#" class="btn btn-outline-dark">예약하기</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="card mt-3">
								<img class="card-img-top" src="resource/img/img2.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">제목</h5>
									<p class="card-text">내용</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">설명1</li>
								</ul>
								<div class="card-body">
									<a href="#" class="btn btn-outline-dark">예약하기</a>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<div class="card mt-3">
								<img class="card-img-top" src="resource/img/img3.jpg"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title">제목</h5>
									<p class="card-text">내용</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">설명1</li>
								</ul>
								<div class="card-body">
									<a href="#" class="btn btn-outline-dark">예약하기</a>
								</div>
							</div>
						</div>
					</div>


					<!-- <div class="row mt-3">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">제목</h5>
                        <p class="card-text">내용</p>
                        <a href="#" class="btn btn-primary">예약하기</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">제목</h5>
                        <p class="card-text">내용</p>
                        <a href="#" class="btn btn-primary">예약하기</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">제목</h5>
                        <p class="card-text">내용</p>
                        <a href="#" class="btn btn-primary">예약하기</a>
                    </div>
                </div>
            </div>
        </div> -->
				</div>
				<!-- main 영역 end -->
			</div>
		</div>
	</div>





	<!-- 하단 footer start -->
	<%@ include file="/static/footer.jsp"%>
	<!-- 하단 footer end -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
        </script>
	<script>   
      document.querySelector("#btn-login").addEventListener("click", function () {
        if (!document.querySelector("#userid_login").value) {
          alert("아이디 입력!!");
          return;
        } else if (!document.querySelector("#userpwd_login").value) {
          alert("비밀번호 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-login");
          form.setAttribute("action", "<%=root%>/user?action=login");
          form.submit();
        }
      });

      <%--
      
      let isUseId = false;
      document.querySelector("#userid").addEventListener("keyup", function () {
  		let userid = this.value;
  		console.log(userid);
    	 	let resultDiv = document.querySelector("#idcheck-result");
    	 	if(userid.length < 4 || userid.length > 16) {
    		 	//resultDiv.setAttribute("class", "mb-3 text-dark");
    		 	//resultDiv.textContent = "아이디는 4자 이상 16자 이하 입니다.";
    		 	alert("아이디는 4자 이상 16자 이하 입니다.");
    		 	isUseId = false;
    	 	} else {
    		 	fetch("<%= root %>/user?action=idcheck&userid=" + userid)
  	   		.then(response => response.text())
  	   		.then(data => {
  	   			console.log(data);
  		 		if(data == 0) {
  		   			//resultDiv.setAttribute("class", "mb-3 text-primary");
  	       			//resultDiv.textContent = userid + "는 사용할 수 있습니다.";
  	       			alert(userid + "는 사용할 수 있습니다.");
  	       			isUseId = true;
  		 		} else {
  		   			//resultDiv.setAttribute("class", "mb-3 text-danger");
   		       		//resultDiv.textContent = userid + "는 사용할 수 없습니다.";
  	       			alert(userid + "는 사용할 수 없습니다.");
   		     		isUseId = false;
  		 		}
    		   });
    	 	}
      });
      
      --%>
      document.querySelector("#btn-join").addEventListener("click", function () {
          if (!document.querySelector("#username").value) {
            alert("이름 입력!!");
            return;
          } else if (!document.querySelector("#userid").value) {
            alert("아이디 입력!!");
            return;
          } else if (!document.querySelector("#userpwd").value) {
            alert("비밀번호 입력!!");
            return;
          } else if (document.querySelector("#userpwd").value != document.querySelector("#pwdcheck").value) {
            alert("비밀번호 확인!!");
            return;
          } 
          
          <%-- 
          
          else if (isUseId == false) {
        	  alert("아이디 확인!!");
              return;
          } 
          
          --%>
          
          else {
            let form = document.querySelector("#form-join");
            form.setAttribute("action", "<%=root%>/user?action=join");
            form.submit();
          }
        });
      
		<%if (memberDto != null) {%>
		

      
      document.querySelector("#btn-logout").addEventListener("click", function () {
      	location.href = "<%=root%>/user?action=logout";});
      
      document.querySelector("#userid-update").placeholder="<%=memberDto.getUserId()%>"; 
      
      document.querySelector("#btn-update").addEventListener("click", function () {
    	  	if (!document.querySelector("#userpwd-update").value) {
              alert("수정 안할꺼야? 제대 입력!!");
              return;
            }else {
              let form = document.querySelector("#form-update");
              form.setAttribute("action", "<%=root%>/user?action=update&userid=<%=memberDto.getUserId()%>");
              form.submit();
            }
        });
      
      document.querySelector("#btn-delete").addEventListener("click", function () {
    	  location.href = "<%=root%>/user?action=delete&userid=<%=memberDto.getUserId()%>";
      });
      
      
     	<%}%>

	</script>
</body>

</html>