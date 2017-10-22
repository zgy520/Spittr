<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spittr</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/style.css" />" >
</head>
<body>
	<h1><s:message code="spittr.welcome"></s:message></h1>
	<s:url value="/spittles" var="spittlesUrl">
		<s:param name="max" value="60"></s:param>
		<s:param name="count" value="20"></s:param>
	</s:url>
	<s:url value="/spitter/{username}" var="spitterUrl">
		<s:param name="username" value="zgu"></s:param>
	</s:url>
	<a href="<c:url value="/spittles" />">Spittles</a>
	<%-- <a href='<c:url value="/spitter/register"></c:url>'>Register</a> --%>
	<a href='<s:url value="/spitter/register"></s:url>'>Register</a>
</body>
</html>