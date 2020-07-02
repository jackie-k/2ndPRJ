<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<MainDTO> rList = (List<MainDTO>) request.getAttribute("rList");
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="/Assets/css/insta_css.css?ver=2"/>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <title>Title</title>
</head>
<!-- jQuery load -->
<script
        src="https://code.jquery.com/jquery-3.5.0.js"
        integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
        crossorigin="anonymous"
></script>
<body>
<div class="big">
    <div class="profile">
        <div class="imageArea">
            <div class="pImage">

                <img src="<%=session.getAttribute("user_profile_image")%>"
                     style="height: 150px; width: 150px; border-radius: 50%;">

            </div>

        </div>
        <div class="pInfo">
            <div class="pName">

                <%=session.getAttribute("user_name")%>

            </div>
            <div class="pMail">

                <%=session.getAttribute("user_mail")%>

            </div>

        </div>

        <div class="homeDiv"><a href="/main.do" class="hrefHome"><i class="fas fa-home"
                                                                    style="font-size: 30px;"></i></a></div>

        <div style="position: absolute; right: 26.5%; top : 30%;">

        </div>

    </div>

    <hr width=100% size="0.5" style="background-color: white;">

    <div class="biggest">
        <div class="bigger" id="recomList">
            <% if (rList.size() == 0) {%>
            <div class="head_top_title">
                등록된 추천 내역이 없습니다.
            </div>
            <% } else { %>
            <% for (int i = rList.size()-1 ; i > -1 ; i--) {%>
            <div class="tbl_type">
                <div class="tbl_col">
                    <div class="recom_info">
                        <div class="recomList" id="DelList<%=i%>" style="cursor: pointer; position: relative;">
                            <img class="ListPic" src="<%=rList.get(i).getOuters()%>">
                            <img class="ListPic" src="<%=rList.get(i).getTop()%>">
                            <img class="ListPic" src="<%=rList.get(i).getBottom()%>">
                            <div class="ListPoint"><%=rList.get(i).getPoint()%>점</div>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>
            <%}%>
        </div>
    </div>
</div>

<script>
    <%for(int i = 0 ; i < rList.size(); i++) { %>
    $('#DelList<%=i%>').click(function () {
        if (confirm('추천내역을 삭제하시겠습니까?')) {
            $.ajax({
                url: "/DelList.do",
                type: 'POST',
                data: {
                    "email": '<%=rList.get(i).getEmail()%>',
                    "top": '<%=rList.get(i).getTop()%>'
                }, success: function (data) {
                    console.log(data)
                    if (data === "0") {
                        alert('추천내역이 삭제되었습니다.')

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


<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>

</html>