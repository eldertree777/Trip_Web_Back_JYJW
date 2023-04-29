<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>핫플레이스</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
    <script src="https://kit.fontawesome.com/5f164fb894.js" crossorigin="anonymous"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="./js/key.js"></script>
</head>
<%@ include file="./static/navbar.jsp"%>
<body>
    <!-- 상단 navbar start -->
    <div id="navbar"></div>
    <!-- 상단 navbar end -->

    <div class="container">
      <div class="row">
          <div class="col-12 text-center">
    <!-- main content start -->
    <div class="p-3">
        <!-- 관광지 검색 start -->
        <div class="row">
            <div class="col-md-6 p-3">

            
                <!-- kakao map start -->
                <div id="map" class="mt-3" style="width: 100%; height: 400px"></div>

                
                <!-- kakao map end -->
            </div>
            
            <div class="col-md-6 p-3" style="text-align: left;">
              <article>
                <div class="container" role="main">
                  <form name="form" id="form" role="form" method="post">
                    <div class="mb-3">
                      <label for="title">장소명</label>
                      <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
                    </div>

                    <div class="mb-3">
                      <label for="title">지역</label>
                      <select id="search-area" class="form-select me-2">
                        <option value="0" selected></option>
                      </select>
                    </div>

                    <div class="mb-3">
                      <label for="title">장소 유형</label>
                      <select id="search-content-id" class="form-select me-2">
                          <option value="0" selected></option>
                          <option value="12">관광지</option>
                          <option value="14">문화시설</option>
                          <option value="15">축제공연행사</option>
                          <option value="25">여행코스</option>
                          <option value="28">레포츠</option>
                          <option value="32">숙박</option>
                          <option value="38">쇼핑</option>
                          <option value="39">음식점</option>
                      </select>  
                    </div>
                  
                    <div class="mb-3">
                      <label for="content">상세 설명</label>
                      <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
                    </div>

                    <div class="mb-3">
                      <div class="form-group row">
                        <label for="inputFile" class="col-form-label"><strong>첨부 파일</strong></label>
                        <div class="col-sm-10">
                          <div class="custom-file" id="inputFile">
                            <input name="file" type="file" class="custom-file-input" id="customFile" />
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>

                  <div style="text-align: right;">
                    <button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
                  </div>
                </div>
              </article>
            </div>

        </div>
        <!-- 관광지 검색 end -->
    </div>
    <!-- main content end -->
</div>
</div>
</div>


    <!-- 하단 footer start -->
    <div id="footer"></div>
    <%@ include file="./static/footer.jsp"%>
    <!-- 하단 footer end -->


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous">
        </script>
    <script src="./js/main.js"></script>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=067b8aa6c249b51bc098f93ee739672f&libraries=services,clusterer,drawing"
    ></script>
    <script>
      document.getElementById("btnSave").addEventListener("click", () => {
        alert("핫플레스가 등록되었습니다.");
      });

      // index page 로딩 후 전국의 시도 설정.
      let areaUrl =
        "https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=" +
        serviceKey +
        "&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";

      // fetch(areaUrl, { method: "GET" }).then(function (response) { return response.json() }).then(function (data) { makeOption(data); });
      fetch(areaUrl, { method: "GET" })
        .then((response) => response.json())
        .then((data) => makeOption(data));

      function makeOption(data) {
        let areas = data.response.body.items.item;
        // console.log(areas);
        let sel = document.getElementById("search-area");
        areas.forEach((area) => {
          let opt = document.createElement("option");
          opt.setAttribute("value", area.code);
          opt.appendChild(document.createTextNode(area.name));

          sel.appendChild(opt);
        });
      }

      // 카카오지도
      var mapContainer = document.getElementById("map"), // 지도를 표시할 div
        mapOption = {
          center: new kakao.maps.LatLng(37.500613, 127.036431), // 지도의 중심좌표
          level: 5, // 지도의 확대 레벨
        };

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      var map = new kakao.maps.Map(mapContainer, mapOption);
    </script>
    
</body>

</html>