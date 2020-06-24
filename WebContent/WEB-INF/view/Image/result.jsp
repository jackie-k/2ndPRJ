<%@ page import="poly.util.CmmUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = CmmUtil.nvl((String)request.getAttribute("url"));
    System.out.println("url : " + url);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Upload completed</h1>


<div class="result-images">

    <img src="/fileFolder/202052491345210.jpg" style="width:150px">

</div>



<p> <a href='/form.do'> 다시 업로드 하기 </a> </p>

</body>
</html>
