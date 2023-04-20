<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>여행 정보 공유</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
        <script src="https://kit.fontawesome.com/5f164fb894.js" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#navbar").load("../static/navbar.html");
                $("#footer").load("../static/footer.html");
            });
        </script>
    </head>

    <body>
        <!-- 상단 navbar start -->
        <div id="navbar"></div>
        <!-- 상단 navbar end -->
	    <div class="sb-nav-fixed">
	      <div class="mt-5 pt-5">
	        <div class="container px-4">
	          <h1 class="mt-4 d-flex justify-content-center">좋은 정보 공유해요!</h1>
	          <div class="container rounded bg-success bg-opacity-75 text-white text-center fs-2 p-4">
	            글수정
	          </div>
	  
	          <div class="container">
	            <form action="/insertProc" method="post">
	              <div class="pt-4 pb-4">
	                <!-- <label for="subject">제목</label> -->
	                제목
	                <input
	                  type="text"
	                  class="form-control"
	                  id="subject"
	                  name="subject"
	                  placeholder="글제목입니다."
	                />
	                제목을 입력하세요
	              </div>
	  
	              <div class="pb-4">
	                <!-- <label for="content">내용</label> -->
	                내용
	                <textarea
	                  class="form-control"
	                  id="content"
	                  name="content"
	                  rows="3"
	                  placeholder="내용입니다.
내용입니다.
내용입니다.
내용입니다."
	                ></textarea>
	              </div>
	            </form>
	          </div>
	          <div class="d-flex flex-column flex-sm-row justify-content-between">
	            <div class=" col-md-1 text-nowrap">
	              <a class="btn btn-primary" href="./list_result.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 글 수정
	              </a>
	            </div>
	            <div class=" col-md-1 ms-2 text-nowrap">
	              <a class="btn btn-danger" href="./list.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 목록
	              </a>
	            </div>
	          </div>
	        </div>
	      </main>
	    </div>
        <!-- 하단 footer start -->
        <div id="footer"></div>
        <!-- 하단 footer end -->

        <!-- 회원가입 modal start -->
        <div class="sb-nav-fixed">
	      <div class="mt-5 pt-5">
	        <div class="container px-4">
	          <h1 class="mt-4 d-flex justify-content-center">좋은 정보 공유해요!</h1>
	          <div class="container rounded bg-success bg-opacity-75 text-white text-center fs-2 p-4">
	            글작성
	          </div>
	  
	          <div class="container">
	            <form action="/insertProc" method="post">
	              <div class="pt-4 pb-4">
	                <!-- <label for="subject">제목</label> -->
	                제목
	                <input
	                  type="text"
	                  class="form-control"
	                  id="subject"
	                  name="subject"
	                  placeholder="제목을 입력하세요."
	                />
	                제목을 입력하세요
	              </div>
	  
	              <div class="pb-4">
	                <!-- <label for="content">내용</label> -->
	                내용
	                <textarea
	                  class="form-control"
	                  id="content"
	                  name="content"
	                  rows="3"
	                  placeholder="내용을 입력하세요."
	                ></textarea>
	              </div>
	            </form>
	          </div>
	          <div class="d-flex flex-column flex-sm-row justify-content-between">
	            <div class=" col-md-1 text-nowrap">
	              <a class="btn btn-primary" href="./list_result.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 글 작성
	              </a>
	            </div>
	            <div class=" col-md-1 ms-2 text-nowrap">
	              <a class="btn btn-danger" href="./list.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 목록
	              </a>
	            </div>
	          </div>
	        </div>
	      </main>
	    </div>
        <!-- 회원가입 modal end -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
        <script src="./../js/main.js"></script>
    </body>

    </html>