<%@ page import="poly.dto.MainDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MainDTO mDTO = (MainDTO) request.getAttribute("mDTO");
    String c[] = (String[]) request.getAttribute("c");
    String user_email = (String) session.getAttribute("user_mail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="../../Assets/css/style_min.css"/>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <title>recommendation</title>
    <style>
        .starR1 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR2 {
            background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
            background-size: auto 100%;
            width: 15px;
            height: 30px;
            float: left;
            text-indent: -9999px;
            cursor: pointer;
        }

        .starR1.on {
            background-position: 0 0;
        }

        .starR2.on {
            background-position: -15px 0;
        }
    </style>
</head>
<body>

<div class="recomContainer">
    <div class="homeDiv"><a href="/main.do" class="hrefHome"><i class="fas fa-home"></i></a></div>
    <div>
        <div>
            <form action="ReviewAdd.do" method="post" id="review">
                <div class="imageShow row">

                    <%for (int i = 0; i < 3; i++) {%>
                    <div class="recomShow col-md-4" id="DI<%=i%>">
                        <img class="recomPic" src="/<%=mDTO.getSeq()%>/<%=c[i]%>">
                        <input type="hidden" value="/<%=mDTO.getSeq()%>/<%=c[i]%>" name="review<%=i%>">
                    </div>
                    <%}%>
                </div>

                <!--  평점-->

                <div class="starRate" style="display: flex; justify-content: center;">
                    <div class="starRev">
                        <span class="starR1" id="s05">별1_왼쪽</span>
                        <span class="starR2" id="s10">별1_오른쪽</span>
                        <span class="starR1" id="s15">별2_왼쪽</span>
                        <span class="starR2" id="s20">별2_오른쪽</span>
                        <span class="starR1" id="s25">별3_왼쪽</span>
                        <span class="starR2" id="s30">별3_오른쪽</span>
                        <span class="starR1" id="s35">별4_왼쪽</span>
                        <span class="starR2" id="s40">별4_오른쪽</span>
                        <span class="starR1" id="s45">별5_왼쪽</span>
                        <span class="starR2" id="s50">별5_오른쪽</span>
                        <input type="text" class="star_num" id="SP" value="0" readonly style="border: none"
                               onfocus='this.blur();'>
                        <input type="hidden" id="point" name="point" value="0">
                    </div>
                    <button id="Sbutton" type="submit" style="margin-left: 7px; background-color: salmon !important; color:white; border:none; border-radius: 5px;">rate</button>
                </div>
            </form>
        </div>

        <div class="page" style = "margin-top: 30px;">

            <button onClick="window.location.reload()" class="fun-btn"> reload</button>

        </div>
    </div>
</div>
<script src="/Assets/js/jquery-3.3.1.min.js"></script>
<script>
    $('.starRev span').click(function () {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        return false;
    });
    $('#s05').click(function () {
        $('#SP').attr('value', '1');
        $('#point').attr('value', '1');
    });
    $('#s10').click(function () {
        $('#SP').attr('value', '2');
        $('#point').attr('value', '2');
    });
    $('#s15').click(function () {
        $('#SP').attr('value', '3');
        $('#point').attr('value', '3');
    });
    $('#s20').click(function () {
        $('#SP').attr('value', '4');
        $('#point').attr('value', '4');
    });
    $('#s25').click(function () {
        $('#SP').attr('value', '5');
        $('#point').attr('value', '5');
    });
    $('#s30').click(function () {
        $('#SP').attr('value', '6');
        $('#point').attr('value', '6');
    });
    $('#s35').click(function () {
        $('#SP').attr('value', '7');
        $('#point').attr('value', '7');
    });
    $('#s40').click(function () {
        $('#SP').attr('value', '8');
        $('#point').attr('value', '8');
    });
    $('#s45').click(function () {
        $('#SP').attr('value', '9');
        $('#point').attr('value', '9');
    });
    $('#s50').click(function () {
        $('#SP').attr('value', '10');
        $('#point').attr('value', '10');
    });
</script>

</body>
</html>