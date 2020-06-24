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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">


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
        <button onclick="location.href='http://localhost:8080/form.do'"> + </button>
    </div>

    <hr width = "910px" size = "0.5" style="color: grey;">

    <div class = "imageList row">
        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/fileFolder/20205249122236.jpg">
        </div>
        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/fileFolder/20205249136504.jpg">
        </div>
        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/fileFolder/202052491531208.jpg">
        </div>
        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/fileFolder/202052491531208.jpg">
        </div>
        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/fileFolder/202052491531208.jpg">
        </div>

    </div>


</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
