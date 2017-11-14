<!-- 
    Using tomcat in xammp
    Written in SublimeText editor
    Document   : Displaying Pattern
    Author     : Hemraj
-->
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form name="f" action="q1.jsp" method="get">
           enter no of rows <input type="text" name="rows"><br>
           <input type="submit" name="b1">
           <input type="hidden" name="submitted" value="true">
        </form>
    </body>
</html>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        Using scriptlets<br>

    <c:if test="${param.submitted}">

        <%  int x=Integer.parseInt(request.getParameter("rows"));
    
                for(int i=1;i<=x;i++)
                 {
                    for(int j=1;j<=i;j++)
                      {
                        out.print(j+"  ");
                      } %>

                     <br>
              <% } 
              %>

        Using for each<br>

    <c:forEach var="i" begin="1" end="${param.rows}">

        <c:forEach var="j" begin="1" end="${i}">

            <c:out value="${j}">  

            </c:out>

        </c:forEach>

            <br>
    </c:forEach>

    </c:if>

     </body>
</html>

    
    
