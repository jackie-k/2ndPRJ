<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<MainDTO> mList = (List<MainDTO>) request.getAttribute("mList");
    List<MainDTO> iList = (List<MainDTO>) request.getAttribute("iList");
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
        <!-- 파일 업로드 버튼 -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#fileupload">
            파일업로드
        </button>

        <!-- 파일 업로드 창 -->
        <div class="modal fade" id="fileupload" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <form action="upload.do" method="post" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">파일업로드</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                            <div>
                                <div><input type="file" value="파일 선택" name="file1"/></div>
                            </div>
                    </div>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="shortSleeve" value="01" checked> 반팔
                        </label>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="longSleeve" value="02"> 긴팔
                        </label>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="shortPants" value="03"> 반바지
                        </label>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="longPants" value="04"> 긴바지
                        </label>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="thinOuter" value="05"> 얇은 겉옷
                        </label>
                        <label class="radio-inline" style="color: black; font-size: 18px; font-weight: bold;">
                            <input type="radio" name="type" id="thickOuter" value="06"> 두꺼운 겉옷
                        </label>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">업로드</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <hr width = "910px" size = "0.5" style="color: grey;">

    <div class = "imageList row">
        <%for(int i = 0 ; i <iList.size(); i++) { %>

        <div class = "singlePic col-md-4">
            <img class = "instaPic" src="/<%=iList.get(i).getSeq()%>/<%=iList.get(i).getFile_name()%>">
        </div>
    <% } %>

    </div>


</div>

</body>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
