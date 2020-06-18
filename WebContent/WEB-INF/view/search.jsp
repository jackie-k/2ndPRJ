<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String user_id = (String) session.getAttribute("SS_USER_ID");
    String userAuthor = (String) session.getAttribute("SS_USERAUTHOR");
    MainDTO mDTO = (MainDTO) request.getAttribute("mDTO");
%>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../../../SpringForMySQL/WebContent/Assets/css/style_min.css" />
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script
            src="https://code.jquery.com/jquery-3.5.0.js"
            integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
            crossorigin="anonymous"
    ></script>
    <title>search data</title>
</head>
<!--
   //////////////////////////////////////////////////////
   2020 2학년 1학기 개인 프로젝트
   주제 : 날씨에 맞춘 의상 추천 서비스 (pytorch 활용)
   페이지 명: 검색 후 페이지
   Email: 1920110007@office.kopo.ac.kr
   //////////////////////////////////////////////////////
-->
<body>

<%--<% if (user_id == null) { %>--%>
<%--<%@include file="/WEB-INF/view/frame/TopbarLogout.jsp" %>--%>
<%--<% } else { %>--%>
<%--<% if (userAuthor.equals("1")) { %>--%>
<%--<%@include file="/WEB-INF/view/frame/TopbarLoginAdmin.jsp" %>--%>
<%--<% } else { %>--%>
<%--<%@include file="/WEB-INF/view/frame/TopbarLoginUser.jsp" %>--%>
<%--<% } %>--%>
<%--<% } %>--%>

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

    curlat = '<%=mDTO.getX()%>';
    curlng = '<%=mDTO.getY()%>';



    $(function(){
        $.getJSON('http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=XaKtAETlOg3ZQgrqFus97F8g4WPQHowNI26e0VcFLFZZQcL9nJ07kvBEzdSNz4boXMekfP9caFiyrJmk%2BF0REg%3D%3D&numOfRows=200&pageNo=1&base_date=' + wantedDate + '&base_time=2330&nx=' + curlat + '&ny=' + curlng + '&dataType=json',function(data){
            const borderData = data.response.body;
            console.log("total data : " + data);
            console.log("border Data : " + borderData);

            const realData =borderData.items.item;
            console.log("real Data : " + realData);

            const tempData = [[], []];

            const popData = [];

            let tmnData;

            let tmxData;

            for(let i = 0 ; i<realData.length ; i++){
                if(realData.fcstDate === wantedDate + 2){
                    break;
                }
                console.log("i :" + i);
                console.log(realData[i].category);
                console.log(realData[i].fcstValue);

                tempData[0][i] = realData[i].category;
                //console.log("tempData [0] [" + i + "] : " + tempData[0][i]);
                tempData[1][i] = realData[i].fcstValue;
                //console.log("tempData [1] [" + i + "] : " + tempData[1][i]);

                console.log("tempData " + i + " : " + tempData[0][i] + " , " + tempData[1][i]);

                if (realData[i].category === "POP"){
                    popData.push(realData[i].fcstValue);
                }

                else if (realData[i].category === "TMN"){
                    tmnData = realData[i].fcstValue;
                }

                else if (realData[i].category === "TMX"){.

                    tmxData = realData[i].fcstValue;
                }

                console.log("popData : " + popData);
                console.log("tmnData : " + tmnData);
                console.log("tmxData : " + tmxData);


            }

            const minTemp = document.getElementById("minTemp");
            minTemp.innerHTML = "min temp : " + tmnData;

            const maxTemp = document.getElementById("maxTemp");
            maxTemp.innerHTML = "max temp : " + tmxData;

            if (popData >= 50) {
                const rainPop = document.getElementById("rainPop");
                rainPop.innerHTML = "rain";
            }

        });


    });

</script>



<div class="container">
    <div>
        <img src="/Assets/img/sun.png" id="image"/>
        <p id="city"><%=mDTO.getName()%></p>
        <p><span id='minTemp'>temperature</span><span>℃</span></p>
        <p><span id='maxTemp'>temperature</span><span>℃</span></p>
        <p><span id='rainPop'>no rain</span></p>
    </div>
    <%--    <div>--%>
    <%--        <form id='searchForm'>--%>
    <%--            <input type="search" id="searchText">--%>
    <%--            <i class="fa fa-search"></i>--%>
    <%--        </form>--%>
    <%--    </div>--%>

    <div>
        <form id='searchForm' action="search.do">
            <input type="text" id="searchText" autocomplete="off" name = "SearchQuery" required>
            <i class="fa fa-search" type="submit"></i>
        </form>
    </div>

    <script>
        var SearchQuery = $("#searchText").val();
        console.log("search query : " + SearchQuery);
    </script>


    <div class="page">
        <button class = "fun-btn" onclick="location.href='http://localhost:8080/recom.do'"> choose today's outfit </button>
    </div>

</div>




<script src='./data.js'></script>
<script src="./config.sample.js"></script>
<script src="index.js"></script>



</body>
</html>