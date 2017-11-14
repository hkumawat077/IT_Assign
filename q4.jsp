<!--
    Document:
    Author:Hemraj
-->
<!DOCTYPE html>
<html>
    <head>
        <title></title>
       
    </head>
    <body>
        <form action="q4.jsp" name="f3" method="GET">
            Enter Your Name<input type="text" name="txt">
            <input type="submit" value="click" name="button">
        </form>
            </body>
</html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" import="java.util.Date" %>
<jsp:useBean id= "date" class="java.util.Date">
    <c:choose>
        <c:when test="${date.hours>=5 && date.hours<12}">
            <c:out value="GOOD MORNING $param.txt"/>
        </c:when>
          <c:when test="${date.hours>=12 && date.hours<18}">
            <c:out value="GOOD AFTERNOON ${param.txt}"/>
        </c:when>
        <c:when test="${date.hours>=18&& date.hours<22}">
            <c:out value="GOOD EVENING ${param.txt}"/>
        </c:when>
            <c:otherwise>
                <c:out value="GOOD NIGHT ${param.txt}"/>
            </c:otherwise>
    </c:choose>
</jsp:useBean>
