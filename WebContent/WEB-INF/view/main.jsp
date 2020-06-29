<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login = (String) session.getAttribute("user_name");
%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../Assets/css/style_min.css" />
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.5.0.js"
            integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
            crossorigin="anonymous"
    ></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <title>오늘의 날씨</title>
</head>
<!--
   //////////////////////////////////////////////////////
   2020 2학년 1학기 개인 프로젝트
   주제 : 날씨에 맞춘 의상 추천 서비스 (pytorch 활용)
   페이지 명: index 페이지
   Email: 1920110007@office.kopo.ac.kr
   //////////////////////////////////////////////////////
   hi
-->
<body>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b0e826187e793a3d9af09edc3bcbc7"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92b0e826187e793a3d9af09edc3bcbc7&libraries=services"></script>

<script>

    let today = new Date;

    let year = today.getFullYear();
    let month = today.getMonth()+1;
    month = month >= 10 ? month : '0' + month;
    let date = today.getDate()-1;
    date = date >= 10 ? date : '0' + date;

    let wantedDate = year + month + date;

    console.log("date : " + today);
    console.log("year : " + year);
    console.log("month : " + month);
    console.log("date : " + date);
    console.log("wanted date : " + wantedDate);

    let curlat;
    let curlng;

    navigator.geolocation.getCurrentPosition(function (position) {

            curlat = position.coords.latitude;
            curlng = position.coords.longitude;

            console.log("현재좌표 : " + curlat, curlng);

        curlat = 60;
        curlng = 127;

    });



    $(function(){
         $.getJSON('http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=XaKtAETlOg3ZQgrqFus97F8g4WPQHowNI26e0VcFLFZZQcL9nJ07kvBEzdSNz4boXMekfP9caFiyrJmk%2BF0REg%3D%3D&numOfRows=153&pageNo=1&base_date=' + wantedDate + '&base_time=2330&nx=' + curlat + '&ny=' + curlng + '&dataType=json',function(data){
            const borderData = data.response.body;
            console.log("total data : " + data);
            console.log("border Data : " + borderData);

            const realData = borderData.items.item;
            console.log("real Data : " + realData);

            const tempData = [[], []];

            let popData = 0;

            let tmnData;

            let tmxData;

            for(let i = 0 ; i<realData.length ; i++){
                if(realData.fcstDate === wantedDate + 2){
                    break;
                }
                //console.log("i :" + i);
                //console.log(realData[i].category);
                //console.log(realData[i].fcstValue);

                tempData[0][i] = realData[i].category;
                //console.log("tempData [0] [" + i + "] : " + tempData[0][i]);
                tempData[1][i] = realData[i].fcstValue;
                //console.log("tempData [1] [" + i + "] : " + tempData[1][i]);

                //console.log("tempData " + i + " : " + tempData[0][i] + " , " + tempData[1][i]);

                if (realData[i].category === "POP"){
                    popData = popData + Number(realData[i].fcstValue);

                    console.log(popData);
                }

                else if (realData[i].category === "TMN"){
                    tmnData = realData[i].fcstValue;
                }

                else if (realData[i].category === "TMX"){
                    tmxData = realData[i].fcstValue;
                }

                //console.log("popData : " + popData);
                //console.log("tmnData : " + tmnData);
                //console.log("tmxData : " + tmxData);


            }


             const minTemp = document.getElementById("minTemp");
             minTemp.innerHTML = "min temp : " + tmnData;

             const maxTemp = document.getElementById("maxTemp");
             maxTemp.innerHTML = "max temp : " + tmxData;

             console.log("강수 : " + popData/16);

             if (popData/16 >= 50) {
                 const rainPop = document.getElementById("rainPop");
                 rainPop.innerHTML = "rain";

             }

             else {
                 const rainPop = document.getElementById("rainPop");
                 rainPop.innerHTML = "no rain";

                 const wIcon = document.getElementById("rainimage");
                 wIcon.src = "/Assets/img/sun.png";

             }



             const avgtemp = document.getElementById("avgtemp");
             avgtemp.value = (tmxData*1 + tmnData*1)/2;
             console.log("avgtemp : "+ avgtemp);
         });


    });

</script>

<div class="container">
    <div class="login_bar">
        <%
            if (session.getAttribute("user_name") == null) {
        %>

        <a
                href="https://kauth.kakao.com/oauth/authorize?client_id=63864be6b254a58d1104f56d171a9285&redirect_uri=http://localhost:8080/kakaologin.do&response_type=code">
            <img src="/Assets/img/kakaologin.png" style="width: 20%">
        </a>
        <%
        } else {
        %>
        <div><a class="memberId" href="/myPage.do"><%=session.getAttribute("user_name")%></a></div>
        <div><a class="logout" href="/kakaologout.do">LOGOUT</a></div>
        <%
            }
        %>
    </div>
    <div style="text-align: -webkit-center;">
        <div class="Wicon"><img id = "rainimage" src = "/Assets/img/rain.png"/></div>
        <p id="city">서울</p>
        <p><span id='minTemp'>minimum temperature</span><span>℃</span></p>
        <p><span id='maxTemp'>maximum temperature</span><span>℃</span></p>
        <p><span id='rainPop'>rain</span></p>
    </div>
    <div>
        <form id='searchForm' action="search.do">
            <input type="text" id="searchText" autocomplete="off" name = "SearchQuery" required style="font-family: Jua !important;">
            <i class="fa fa-search" type="submit"></i>
        </form>
    </div>

    <script>
        const SearchQuery = $("#searchText").val();
        console.log("search query : " + SearchQuery);
    </script>

<%--    검색결과가 없을 경우 alert 창으로 알림띄우기--%>

        <div class="page">
            <%
                if (session.getAttribute("user_name") != null) {
            %>
            <form action="/recom.do" method="post">
            <button class = "fun-btn" type="submit"> choose today's outfit </button>
                <input type = "hidden" name = "avgtemp" id = "avgtemp" value = "(maxTemp+minTemp)/2">
            </form>
            <%
                }
            %>
    </div>

</div>


</body>
</html>