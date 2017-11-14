<!--
    Document:operate.jsp
    author:Hemraj
-->
  Using Expression language:
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${param.radio1=='addition'}">
        <c:out value="sum of two numbers  ${param.txt1+param.txt2}"/>
    </c:when>
    <c:when test="${param.radio1=='subtraction'}">
        <c:out value=" subtraction of two numbers  ${param.txt1-param.txt2}"/>
    </c:when>
         <c:otherwise>
               <c:out value="multiplication of two numbers  ${param.txt1*param.txt2}"/>

         </c:otherwise>
 </c:choose>      
 </br>  
   Using request.getParameter() Method

  <% int a,b;
         a=Integer.parseInt(request.getParameter("txt1"));
         b=Integer.parseInt(request.getParameter("txt2"));
         if (request.getParameter("radio1").equals("addition")) {
             out.print("sum of two numbers is: ");
             out.print(a+b);   	
         }
         else if (request.getParameter("radio1").equals("subtraction")) {
              out.print("Difference of two numbers is: ");
         	  out.print(a-b);
         }
         else  if (request.getParameter("radio1").equals("multiplication")) {
              out.print("Product of two numbers is: ");
         	  out.print(a*b);
         }
   %>      
