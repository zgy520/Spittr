<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	span.error{
		color: red;
	}
	label.error{
		color:red;
	}
	input.error{
		background-color: #ffcccc;
	}
	div.errors{
		background-color: #ffcccc;
		border: 2px solid red;
	}
</style>
<title>Spittr</title>
</head>
<body>
	<h1>Register</h1>
	<form method="POST">
		First Name:<input type="text" name="firstName" /><br />
		Last Name:<input type="text" name="lastName"/><br />
		UserName:<input type="text" name="username"/><br />
		Password:<input type="password" name="password"><br />
		<input type="submit" value="Register" />
	</form>
	<sf:form method="POST" commandName="spitter" enctype="multipart/form-data">
		<sf:errors path="*" element="div" cssClass="errors"></sf:errors>
		<sf:label path="firstName" cssErrorClass="error">First Name:</sf:label>
		<sf:input path="firstName" cssErrorClass="error"/>
		<%-- <sf:errors path="firstName" cssClass="error"></sf:errors> --%> <br>
		Last Name:<sf:input path="lastName"/><br>
		Email:<sf:input path="Emial"/><br>
		userName:<sf:input path="username"/><br>
		Password:<sf:password path="password"/><br>
		Profile Picture:<sf:input path="profilePicture" type="file" accept="image/jpeg,image/png"/><br/>
		<input type="submit" value="Register" />
	</sf:form>
</body>
</html>