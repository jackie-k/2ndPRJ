<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MainDTO mDTO = (MainDTO)request.getAttribute("mDTO");
    String c[] = (String[]) request.getAttribute("c");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../Assets/css/style_min.css" />
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>recommendation</title>
</head>
<body>

<div class="recomContainer">
    <div class="homeDiv"><a href = "/main.do" class="hrefHome"><i class="fas fa-home"></i></a></div>
    <div>
        <div class = "imageShow row">

            <%for (int i = 0 ; i<3; i++){%>
            <div class = "recomShow col-md-4" id="DI<%=i%>">
                <img class = "recomPic" src="/<%=mDTO.getSeq()%>/<%=c[i]%>">
            </div>
            <%}%>
        </div>


    <div class="page">

        <button onClick="window.location.reload()" class = "fun-btn"> reload </button>

    </div>
    </div>
</div>

</body>
</html>