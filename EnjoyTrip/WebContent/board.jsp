<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.List,com.ssafy.board.model.BoardDto,com.ssafy.board.model.dao.BoardDaoImpl"%>
<%
String root = request.getContextPath();
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articles");
%>
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
                $("#navbar").load("./static/navbar.jsp");
                $("#footer").load("./static/footer.jsp");
            });
        </script>
    </head>

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
                            <h2 class="text-secondary"><mark class="steelblue">좋은 정보
                                    공유해요!!!</mark></h2>
                            <div class="mt-4 container-fluid">
                                <div class="row mb-2 justify-content-between">
                                    <div class="mr-auto ml-2 col-auto">
			                            <button type="button" class="btn btn-outline-primary mb-3" onclick="location.href='<%= root %>/article?action=mvwrite'">
					                	글작성
					              		</button>
                                    </div>
                                    <div class="mr-2 col-auto">
                                        <form class="form-inline d-flex">
                                            <select class="form-select form-select-md" style="height: 100%;">
                                                <option value="">검색조건</option>
                                                <option value="artic
                                                le_no">글번호</option>
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
                                                        <div>조회수</div>
                                                    </th>
                                                    <th role="columnheader" scope="col" aria-colindex="5" class="">
                                                        <div>작성일</div>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <!-- tmp -->
                                            <tbody>    
                                            
	                                            <%
												for(BoardDto boardDto : list) {
												%>           
												              <tr class="text-center">
												                <th scope="row"><%= boardDto.getArticleNo() %></th>
												                <td class="text-start">
												                  <a
												                    href="#"
												                    class="article-title link-dark"
												                    data-no="<%= boardDto.getArticleNo() %>"
												                    style="text-decoration: none"
												                  >
												                    <%= boardDto.getSubject() %>
												                  </a>
												                </td>
												                <td><%= boardDto.getUserId() %></td>
												                <td><%= boardDto.getHit() %></td>
												                <td><%= boardDto.getRegisterTime() %></td>
												              </tr>
												<%
												}
												%>  
								            </tbody>
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
                                            <li class="page-item active"><a aria-label="Go to page 1"
                                                    aria-current="page" href="#1" target="_self" class="page-link">1</a>
                                            </li>
                                            <li class="page-item"><a aria-label="Go to page 2" href="#2" target="_self"
                                                    class="page-link">2</a></li><!----><!---->
                                            <li class="page-item"><a aria-label="Go to next page" href="#2"
                                                    target="_self" class="page-link">›</a></li>
                                            <li class="page-item"><a aria-label="Go to last page" href="#2"
                                                    target="_self" class="page-link">»</a></li>
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
        <!-- 하단 footer end -->

        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
        <script src="./../js/main.js"></script>
      	<script>
	      let titles = document.querySelectorAll(".article-title");
	      titles.forEach(function (title) {
	        title.addEventListener("click", function () {
	          console.log(this.getAttribute("data-no"));
	          location.href = "<%= root %>/article?action=view&articleno=" + this.getAttribute("data-no");
	        });
	      });
	
	      document.querySelector("#btn-mv-register").addEventListener("click", function () {
	        location.href = "<%= root %>/article?action=mvwrite";
	      });
   		</script>
    </body>

    </html>