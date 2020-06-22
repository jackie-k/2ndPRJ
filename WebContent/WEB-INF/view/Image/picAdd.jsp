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
        <form action="UploadService" method="post" enctype="multipart/form-data">
            <tr>
                <td>file : </td>
                <td><input type="file" value="파일 선택" name="file"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="업로드"/></td>
            </tr>
        </form>
    </table>
</fieldset>

</body>
</html>