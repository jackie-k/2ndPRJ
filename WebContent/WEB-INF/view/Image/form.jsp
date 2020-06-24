<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <link rel="stylesheet" href="../../Assets/css/style_min.css" />--%>

    <title>Image upload</title>
</head>
<body>
<fieldset>
    <legend>파일 업로드</legend>
    <table>
        <form action="upload.do" method="post" enctype="multipart/form-data">
            <div>
                <div>file : </div>
                <div><input type="file" value="파일 선택" name="file1"/></div>
            </div>
            <div>
                <div colspan="2"><input type="submit" value="업로드"/></div>
            </div>
        </form>
    </table>
</fieldset>

</body>
</html>