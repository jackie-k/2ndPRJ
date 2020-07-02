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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <title>Title</title>
</head>
<!-- jQuery load -->
<script
        src="https://code.jquery.com/jquery-3.5.0.js"
        integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
        crossorigin="anonymous"
></script>
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

        <div class="homeDiv"><a href = "/main.do" class="hrefHome"><i class="fas fa-home" style="font-size: 30px;"></i></a></div>
        <div class="recomDiv"><a href = "/recomList.do"><img src="/Assets/img/stars.png" style="width: 25px; position: absolute; top: 20%; right: 27.05%;"></a></div>

        <div style="position: absolute; right: 26.5%; top : 30%;">
            <!-- 파일 업로드 버튼 -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#fileupload" style="background-color: #64b3f3 !important; border-color: #64b3f3 !important;">
                파일업로드
            </button>

        </div>

    </div>
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
                    <div class="modal-body" style="font-size: 1.2rem; text-align: left;">
                        <div>
                            <div><input type="file" value="파일 선택" name="file1"/></div>
                        </div>
                    </div>
                    <div style="margin-bottom: 7px;">
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
                    </div>

                    <div class="modal-footer" style="margin-bottom: -30px;">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary">업로드</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <hr width = 100% size = "0.5" style="background-color: white;">

    <div class = "imageList row" style="margin-right: 0px !important; margin-left: 0px !important;">
        <%for(int i = iList.size()-1 ; i > -1 ; i--) { %>

        <div class = "singlePic col-md-4" id="DI<%=i%>">
            <img class = "instaPic" src="/<%=iList.get(i).getSeq()%>/<%=iList.get(i).getFile_name()%>">
        </div>
    <% } %>

    </div>


</div>
<script>
    <%for(int i = 0 ; i < iList.size(); i++) { %>
    $('#DI<%=i%>').click(function () {
       if (confirm('이미지를 삭제하시겠습니까?')){
           $.ajax({
               url: "/DelImg.do",
               type : 'POST',
               data : {
                   "seq" : '<%=iList.get(i).getSeq()%>',
                   "img" : '<%=iList.get(i).getFile_name()%>'
               },success : function (data) {
                   console.log(data)
                   if (data==="0"){
                       alert('이미지가 삭제되었습니다.')

                   }
               }
           });
            alert('삭제가되었어요')
           window.location.reload(true);
       }
    })
    <%}%>
</script>
</body>


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</html>
