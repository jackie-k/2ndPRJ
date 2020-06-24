<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<MainDTO> mList = (List<MainDTO>) request.getAttribute("mList");
%>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="/Assets/css/insta_css.css?ver=2" />
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

    <title>Title</title>
</head>
<body>

<div class = "big">
    <div class = "profile">
        <div class = "imageArea">
            <div class = "pImage">

                <img src="<%=session.getAttribute("user_profile_image")%>" style="height: 150px; width: 150px; border-radius: 50%;">

            </div>

        </div>
        <div class = "pInfo">
            <div class = "pName">

                <%=session.getAttribute("user_name")%>

            </div>
            <div class ="pMail">

                <%=session.getAttribute("user_mail")%>

            </div>

        </div>

    </div>
    <div>
        <button onclick="location.href='http://localhost:8080/form.do'"> add to closet </button>
    </div>

    <hr width = "910px" size = "0.5" style="color: grey;">

    <div class = "imageList">
        <div class = "singlePic">
            <img class = "instaPic" src="/fileFolder/20205249122236.jpg">
        </div>
        <div class = "singlePic">
            <img class = "instaPic" src="/fileFolder/20205249136504.jpg">
        </div>
        <div class = "singlePic">
            <img class = "instaPic" src="/fileFolder/202052491531208.jpg">
        </div>

    </div>


</div>

</body>
</html>
