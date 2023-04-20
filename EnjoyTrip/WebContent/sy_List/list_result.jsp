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
	
	          <div class="container rounded bg-secondary bg-opacity-25 text-primary text-center fs-2 p-4 mb-2">
	            등록 완료
	            <div class="text-secondary text-center fs-4">글작성이 완료되었습니다</div>
	            <div class="d-flex justify-content-center text-nowrap">
	              <a class="btn btn-outline-primary" href="./list_contents.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 등록글 보기
	              </a>
	            </div>
	          </div>
	          <div class="container rounded bg-secondary bg-opacity-25 text-primary text-center fs-2 p-4 mb-2">
	            등록 실패
	            <div class="text-danger text-center fs-4">글작성이 완료되었습니다</div>
	            <div class="d-flex justify-content-center text-nowrap">
	              <a class="btn btn-outline-danger" href="./list.html">
	                <!-- <i class="fas fa-table me-1"></i> -->
	                <i class="fas fa-edit"></i> 목록 이동
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