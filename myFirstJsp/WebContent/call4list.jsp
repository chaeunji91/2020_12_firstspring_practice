<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, a.b.c.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	List<MemberVO> list = new ArrayList<>();
	for (int i = 0; i< 10; i++) {
		list.add(new MemberVO(i, "길동" + i, true));
	}
	request.setAttribute("list", list);
	%>
	<c:redirect url="ListMember.jsp"></c:redirect>
</body>
</html>