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
	    <div class="row m-5">
	      <div class="container-fluid px-4">
	        <h1 class="mt-4 d-flex justify-content-center">좋은 정보 공유해요!</h1>
	        <div>
	          <div class="row justify-content-between">
	            <div class="col-md-4">
	              <a class="btn btn-outline-primary" href="./makinglist.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 글 작성
	              </a>
	            </div>
	
	            <div class="col-md-4">
	              <div class="d-flex flex-row-reverse">
	                <button type="button" class="btn btn-outline-secondary text-nowrap">검색</button>
	                <input type="text" class="form-control" placeholder="검색어 입력" />
	                <select class="form-select" aria-label="Default select example">
	                  <option selected>select</option>
	                  <option value="1">One</option>
	                  <option value="2">Two</option>
	                  <option value="3">Three</option>
	                </select>
	              </div>
	            </div>
	          </div>
	
	          <div>
	            <table class="table table-striped table-hover">
	              <thead>
	                <tr>
	                  <th class="col-md-1 text-center">글번호</th>
	                  <th class="col-md-6 text-center">제목</th>
	                  <th class="col-md-2 text-center">작성자</th>
	                  <th class="col-md-2 text-center">작성일</th>
	                  <th class="col-md-1 text-center">조회수</th>
	                </tr>
	              </thead>
	              <tbody>
	                <tr>
	                  <th class="col-md-1 text-center">1</th>
	                  <th class="col-md-6 text-center"><a href="./list_contents.html">글제목입니다.</th>
	                  <th class="col-md-2 text-center">이시영</th>
	                  <th class="col-md-2 text-center">2022.07.07 11:11:11</th>
	                  <th class="col-md-1 text-center">11</th>
	                </tr>
	                <tr>
	                  <th class="col-md-1 text-center">2</th>
	                  <th class="col-md-6 text-center">2</th>
	                  <th class="col-md-2 text-center">2</th>
	                  <th class="col-md-2 text-center">2</th>
	                  <th class="col-md-1 text-center">2</th>
	                </tr>
	                <tr>
	                  <th class="col-md-1 text-center">3</th>
	                  <th class="col-md-6 text-center">3</th>
	                  <th class="col-md-2 text-center">3</th>
	                  <th class="col-md-2 text-center">3</th>
	                  <th class="col-md-1 text-center">3</th>
	                </tr>
	              </tbody>
	            </table>
	            <nav aria-label="Page navigation example">
	              <ul class="pagination d-flex justify-content-center">
	                <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Previous">
	                    <span aria-hidden="true">&laquo;</span>
	                  </a>
	                </li>
	                <li class="page-item"><a class="page-link" href="#">1</a></li>
	                <li class="page-item"><a class="page-link" href="#">2</a></li>
	                <li class="page-item"><a class="page-link" href="#">3</a></li>
	                <li class="page-item">
	                  <a class="page-link" href="#" aria-label="Next">
	                    <span aria-hidden="true">&raquo;</span>
	                  </a>
	                </li>
	              </ul>
	            </nav>
	          </div>
	        </div>
	      </div>
	    </div>

        <!-- 하단 footer start -->
        <div id="footer"></div>
        <!-- 하단 footer end -->

        <!-- 회원가입 modal start -->
        <div class="modal fade m-3" id="write_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <header class="modal-header">
                        <h5 class="modal-title">좋은 정보 공유해요.</h5><button type="button" aria-label="Close"
                            class="btn-close" data-bs-dismiss="modal"></button>

                    </header>

                    <!-- Modal body -->

                    <div class="col m-3" style="text-align: left;">
                        <form class="">
                            <div id="subject-group" role="group" class="form-group"><label id="subject-group__BV_label_"
                                    for="subject" class="d-block">제목:</label>
                                <div><input id="subject" type="text" placeholder="제목 입력..." required="required"
                                        aria-required="true" class="form-control"
                                        aria-describedby="subject-group__BV_description_"><!----><!----><small
                                        tabindex="-1" id="subject-group__BV_description_"
                                        class="form-text text-muted">제목을 입력하세요.</small>
                                </div>
                            </div>
                            <div id="content-group" role="group" class="form-group"><label id="content-group__BV_label_"
                                    for="content" class="d-block">내용:</label>
                                <div><textarea id="content" placeholder="내용 입력..." wrap="soft" class="form-control"
                                        style="resize: none; overflow-y: scroll; height: 254px;"></textarea><!----><!----><!---->
                                </div>
                        </form>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer m-2">
                        <button type="button" id="btn-poll-create" class="btn btn-primary btn-sm"
                            data-bs-dismiss="modal">
                            글작성
                        </button>
                        <button type="button" class="btn float-right btn-danger btn-sm" data-bs-dismiss="modal">
                            목록
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 회원가입 modal end -->

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
        <script src="./../js/main.js"></script>
    </body>

    </html>