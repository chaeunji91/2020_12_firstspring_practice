<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<table>
	<tr><th>이름</th><th>로그인 아이디</th><th>잔고</th></tr>
	<c:forEach var="party" items="${listParty}">
		<tr>
			<td><c:out value="${party.name}"></c:out></td>
			<td><c:out value="${party.loginId}"></c:out></td>
			<td><c:out value="${party.balance}"></c:out></td>
		</tr>
	</c:forEach>
</table>


</body>
</html>
