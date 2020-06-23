<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>

</head>
<body>

<hr>
<input type="button" value="업로드 폴더 초기화!" onclick="location.href='delete.jsp'">
<hr>


<form action="form.jsp" method="post" enctype="multipart/form-data">
    이름 : <input type="text" name="name"><br>
    제목 : <input type="text" name="subject"><br>
    이미지 : <input type="file" name="uploadfile" onchange="readURL(this);"><br>
    <img id="blah" src="http://placehold.it/180" alt="your image" style="width:100px" /><br>

    <input type="submit" value="submit" >
</form>

<script>

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

</body>
</html>