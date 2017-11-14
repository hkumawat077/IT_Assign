<%@ page contentType="text/html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
      <title>User Info Entry Form</title>
   </head>
<body bgcolor="white">
      <form action="q3.jsp" method="get">
        <input type="hidden" name="submitted" value="true"/>   
        <table>
          <tr>
           <td><c:if test="${param.submitted && empty param.userName}">Please enter your name --</c:if>Name:</td>
             <td>
              <input type="text" name="userName" value="${param.userName}">
             </td>
          </tr>
         <tr>
           <td><c:if test="${param.submitted && empty param.birthDate}">Please enter your birth date</c:if>Birth Date:</td>
             <td>
              <input type="text" name="birthDate" value="${param.birthDate}">
             </td>
           <td>(Use format yyyy-mm-dd)</td>
         <tr>
          <td><c:if test="${param.submitted && empty param.emailAddr}">Please enter your email address</c:if>Email Address:</td>
             <td>
               <input type="text" name="emailAddr" value="${param.emailAddr}">
             </td>
          <td>(Use format name@company.com)</td>
         </tr>
        <tr>
          <td><c:if test="${param.submitted &&  param.gender!= 'm' && param.gender!= 'f'}">Please select a valid  gender</c:if>Gender:</td>
           <td>
            <input type="radio" name="gender" value="m" checked>Male<br>
              <input type="radio" name="gender" value="f">Female
           </td>
        </tr>
        <tr>
          <td><c:if test="${param.submitted &&  param.luckyNumber<1 || param.luckyNumber>100}">Please enter lucky number between 1 and 100</c:if>Lucky number:</td>
           <td>
             <input type="text" name="luckyNumber">
           </td>
           <td>(A number between 1 and 100)</td>
        </tr>
        <tr>
          <td><c:forEach items="${paramValues.food}" var="current">
                   <c:choose>
                      <c:when test="${current=='z'}">
                         <c:set var="pizzaselected" value="true" scope="page"/>
                      </c:when>
                      <c:when test="${current=='p'}">
                         <c:set var="pastaselected" value="true"/>
                      </c:when>
                      <c:when test="${current=='c'}">
                        <c:set var="burgerselected" value="true"/>
                      </c:when>
                      <c:otherwise>
                         <c:set var="invalidselection" value="true"/>
                      </c:otherwise>        
                   </c:choose>
               </c:forEach>
            
               
                    <c:if test="${!param.submitted }">
                        <c:if test="${invalidselection}">
                            <c:out value="please select valid option"/>
                        </c:if>
                    </c:if>
        Favorite Foods:</td>
                        <td>
                           <input type="checkbox" name="food" value="z">Pizza<br>
                           <input type="checkbox" name="food" value="p">Pasta<br>
                           <input type="checkbox" name="food" value="c">Chinese
                        </td>
        </tr>
         <tr>
          <td colspan=2>
              <input type="submit" value="Send Data">
          </td>
        </tr>
   </table>

</form>

<c:if test="${param.submitted }">
You entered:<br>
Name: <c:out value="${param.userName}"></c:out><br>
Birth Date: <c:out value="${param.birthDate}" ></c:out><br>
Email Address: <c:out value="${param.emailAddr}" ></c:out><br>
Gender: <c:out value="${param.gender}" ></c:out><br>
Lucky Number: <c:out value="${param.luckyNumber}" ></c:out><br>
Favorite Food:
<c:forEach items="${paramValues.food}" var="current">
<c:out value="${current}" ></c:out>
</c:forEach>
</c:if>
   </body>
</html>