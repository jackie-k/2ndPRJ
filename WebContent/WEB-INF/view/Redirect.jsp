<%--
  Created by IntelliJ IDEA.
  User: data16
  Date: 2020/06/15
  Time: 3:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String msg = (String)request.getAttribute("msg");
    String url = (String)request.getAttribute("url");
%>


<!DOCTYPE html>
<html>
<head>
    <script>
        window.onload = function(){
            alert('<%=msg%>');
            location.href= '<%=url%>';
        };
    </script>
</head>
<body>

</body>
</html>
