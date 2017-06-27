<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String part_value = request.getParameter("part_name");
	String pos_value = request.getParameter("pos_name");

	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;

	dbs.dbConnect();
	if( !part_value.isEmpty() ){
		dbs.dbPartInsert(part_value);
	}
	if( !pos_value.isEmpty() ){
		dbs.dbPositionInsert(pos_value);
	}
	response.sendRedirect("employeePart.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>