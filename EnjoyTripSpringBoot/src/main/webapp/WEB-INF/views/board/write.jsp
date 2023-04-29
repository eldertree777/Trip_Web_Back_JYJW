<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%
String root = request.getContextPath();
%>
<%@ include file="/common/header.jsp" %>
<%@ include file="/common/confirm.jsp" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
        <script src="https://kit.fontawesome.com/5f164fb894.js" crossorigin="anonymous"></script>
	    <div class="sb-nav-fixed">
	      <div class="mt-5 pt-5">
	        <div class="container px-4">
	          <h1 class="mt-4 d-flex justify-content-center">좋은 정보 공유해요!</h1>
	          <div class="container rounded bg-success bg-opacity-75 text-white text-center fs-2 p-4">
	            글작성
	          </div>
	  
	          <div class="container">
	            <form id="form-register" method="POST" action="">
	              <input type="hidden" name="action" value="write">
	              <div class="pt-4 pb-4">
	                <label for="subject" class="form-label">제목 : </label>
		              <input
		                type="text"
		                class="form-control"
		                id="subject"
		                name="subject"
		                placeholder="제목..."
		              />
	                제목을 입력하세요
	              </div>
	  
	              <div class="pb-4">
	                <label for="content" class="form-label">내용 : </label>
              		<textarea class="form-control" id="content" name="content" rows="7"></textarea>
	              </div>
	            </form>
	          </div>
	          <div class="d-flex flex-column flex-sm-row justify-content-between">
	            <div class=" col-md-1 text-nowrap">
	              	<button type="button" id="btn-register" class="btn btn-outline-primary mb-3">
                	글작성
              		</button>
	            </div>
	            <div class=" col-md-1 ms-2 text-nowrap">
	              <button type="reset" class="btn btn-outline-danger mb-3">초기화</button>
	            </div>
	          </div>
	        </div>
	      </main>
	    </div>
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
            </script>
        <script>
      document.querySelector("#btn-register").addEventListener("click", function () {
        if (!document.querySelector("#subject").value) {
          alert("제목 입력!!");
          return;
        } else if (!document.querySelector("#content").value) {
          alert("내용 입력!!");
          return;
        } else {
          let form = document.querySelector("#form-register");
          form.setAttribute("action", "${root}/article");
          form.submit();
        }
      });
    </script>
<%@ include file="/common/footer.jsp" %>
