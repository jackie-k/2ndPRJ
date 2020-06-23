<%--
  Created by IntelliJ IDEA.
  User: data16
  Date: 2020/06/23
  Time: 4:23 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Upload completed</h1>


<div class="result-images">

    <img src="${pageContext.request.contextPath }${url }" style="width:150px">

</div>



<p> <a href='/form.do'> 다시 업로드 하기 </a> </p>

</body>
</html>
