// // index page 로딩시 검색 지역 설정
// let serviceKey =
//   "9Xo0vlglWcOBGUDxH8PPbuKnlBwbWU6aO7%2Bk3FV4baF9GXok1yxIEF%2BIwr2%2B%2F%2F4oVLT8bekKU%2Bk9ztkJO0wsBw%3D%3D";
// let areaUrl =
//   `https://apis.data.go.kr/B551011/KorService1/areaCode1?serviceKey=${serviceKey}&numOfRows=20&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json`;

//   fetch(areaUrl)
//     .then((response) => response.json())
//     .then((data) => makeOption(data));

// function makeOption(data) {
//   console.log(data);
//   let areas = data.response.body.items.item;
//   let sel = document.getElementById("search-area");
//   areas.forEach(function (area) {
//     let opt = document.createElement("option");
//     //<option></option>
//     //<option value="1">서울</option>
//     opt.setAttribute("value", area.code);
//     opt.appendChild(document.createTextNode(area.name));
//     sel.append(opt);
//   });
// }


// 로그인
function login() {
    let input_id = document.querySelector("#input_id").value;
    let input_pw = (document.querySelector("#input_pw").value);

    if (input_id == "") {
        alert("아이디 입력!!!");
        return;
    }

    if (input_pw == "") {
        alert("비밀번호 입력!!!");
        return;
    }

    if (input_id == "ssafy" && input_pw == "1234") {
        alert("로그인 성공!!!");

        document.querySelector("#before_login").setAttribute("style", "display: none;");
        document.querySelector("#after_login").setAttribute("style", "display: block;");
    }

}

function logout() {
    document.querySelector("#before_login").setAttribute("style", "display: block;");
    document.querySelector("#after_login").setAttribute("style", "display: none !important;");
}