<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://kit.fontawesome.com/5f164fb894.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<%@ include file="./static/navbar.jsp"%>
<body>
    <!-- 상단 navbar start -->
    <div id="navbar"></div>
    <!-- 상단 navbar end -->

    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <!-- center content start -->
                <div class="pt-4 container-fluid">
                    <div class="text-center mb-4 col">
                        <h2 class="text-secondary"><mark class="steelblue">공지사항</mark></h2>
                        <div class="mt-4 container-fluid">
                            <div class="row mb-2 justify-content-between">
                                <div class="mr-auto ml-2 col-auto">
                                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                                        data-bs-target="#write_modal">글쓰기</button>
                                </div>
                                <div class="mr-2 col-auto">
                                    <form class="form-inline d-flex">
                                        <select class="form-select form-select-md" style="height: 100%;">
                                            <option value="">검색조건</option>
                                            <option value="article_no">글번호</option>
                                            <option value="subject">제목</option>
                                            <option value="user_id">작성자</option>
                                        </select>
                                        <input type="text" placeholder="검색어입력..." class="mr-1 form-control">
                                        <button type="button" class="col-auto btn btn-outline-secondary">검색</button>
                                    </form>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col">
                                    <table role="table" aria-busy="false" aria-colcount="5"
                                        class="table b-table table-striped table-hover"><!----><!---->
                                        <thead role="rowgroup" class=""><!---->
                                            <tr role="row" class="">
                                                <th role="columnheader" scope="col" aria-colindex="1" class="">
                                                    <div>글번호</div>
                                                </th>
                                                <th role="columnheader" scope="col" aria-colindex="2" class="">
                                                    <div>제목</div>
                                                </th>
                                                <th role="columnheader" scope="col" aria-colindex="3" class="">
                                                    <div>작성자</div>
                                                </th>
                                                <th role="columnheader" scope="col" aria-colindex="4" class="">
                                                    <div>작성일</div>
                                                </th>
                                                <th role="columnheader" scope="col" aria-colindex="5" class="">
                                                    <div>조회수</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody role="rowgroup"><!---->
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                            <tr role="row" tabindex="0" class="">
                                                <td aria-colindex="1" role="cell" class="tdClass">00</td>
                                                <td aria-colindex="2" role="cell" class="tdSubject"><a href="#"
                                                        class=""> null </a></td>
                                                <td aria-colindex="3" role="cell" class="tdClass">김싸피</td>
                                                <td aria-colindex="4" role="cell" class="tdClass">00:00:00</td>
                                                <td aria-colindex="5" role="cell" class="tdClass">0</td>
                                            </tr>
                                        </tbody><!---->
                                    </table>
                                </div>
                            </div>
                            <div class="mt-2">
                                <nav aria-hidden="false" aria-label="Pagination">
                                    <ul aria-disabled="false"
                                        class="pagination b-pagination justify-content-center b-pagination-pills">
                                        <li aria-hidden="true" class="page-item disabled"><span
                                                aria-label="Go to first page" aria-disabled="true"
                                                class="page-link">«</span></li>
                                        <li aria-hidden="true" class="page-item disabled"><span
                                                aria-label="Go to previous page" aria-disabled="true"
                                                class="page-link">‹</span></li><!----><!---->
                                        <li class="page-item active"><a aria-label="Go to page 1" aria-current="page"
                                                href="#1" target="_self" class="page-link">1</a></li>
                                        <li class="page-item"><a aria-label="Go to page 2" href="#2" target="_self"
                                                class="page-link">2</a></li><!----><!---->
                                        <li class="page-item"><a aria-label="Go to next page" href="#2" target="_self"
                                                class="page-link">›</a></li>
                                        <li class="page-item"><a aria-label="Go to last page" href="#2" target="_self"
                                                class="page-link">»</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- center content end -->
            </div>
        </div>
    </div>

    <!-- 하단 footer start -->
    <div id="footer"></div>
    <%@ include file="./static/footer.jsp"%>
    <!-- 하단 footer end -->

    <!-- 회원가입 modal start -->
    <div class="modal fade m-3" id="write_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <header class="modal-header">
                    <h5 class="modal-title">공지사항</h5><button type="button" aria-label="Close" class="btn-close"
                        data-bs-dismiss="modal"></button>

                </header>

                <!-- Modal body -->

                <div class="col m-3" style="text-align: left;">
                    <form class="">
                        <div id="subject-group" role="group" class="form-group"><label id="subject-group__BV_label_"
                                for="subject" class="d-block">제목:</label>
                            <div><input id="subject" type="text" placeholder="제목 입력..." required="required"
                                    aria-required="true" class="form-control"
                                    aria-describedby="subject-group__BV_description_"><!----><!----><small tabindex="-1"
                                    id="subject-group__BV_description_" class="form-text text-muted">제목을 입력하세요.</small>
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
                    <button type="button" id="btn-poll-create" class="btn btn-primary btn-sm" data-bs-dismiss="modal">
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
    <script src="./js/main.js"></script>
</body>

</html>