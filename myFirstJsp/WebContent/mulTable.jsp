<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for (int i = 2; i <= 9; i++) {
			for (int j = 2; j <= 9; j++) {
				out.print(i + " * " + j + " = " + i * j + "<br>");
			}
		out.print("<br>");
	}
	%>
</body>
</html>