<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("page");

	String em_email = request.getParameter("em_email");
	String em_tel = request.getParameter("em_tel");
	String em_cell = request.getParameter("em_cell");
	String em_outdate = request.getParameter("em_outdate");
	String em_outt = request.getParameter("em_outt");
	String em_bank = request.getParameter("em_bank");
	String em_account = request.getParameter("em_account");
	String em_bankname = request.getParameter("em_bankname");
	String em_part = request.getParameter("em_part");
	String em_pos = request.getParameter("em_pos");
	String em_out = request.getParameter("em_out");

	if(em_outdate == null){
		em_outdate = "false";
	}
	
	if(em_outt == null){
		em_outt = "false";
	}
	
	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;

	dbs.dbConnect();

	try {
		String DB_URL = "jdbc:mysql://localhost:3306/employee";
		String DB_ID = "admin";
		String DB_PW = "1234";

		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);

		String sql = "UPDATE employees SET em_email = ? , em_tel = ? , em_cell = ? , em_outdate = ? , em_outt = ? , em_bank = ? , em_account = ? , em_bankname = ? , em_part = ? , em_pos = ? , em_out = ? WHERE em_num = " + id ;

		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, em_email);
		pstmt.setString(2, em_tel);
		pstmt.setString(3, em_cell);
		pstmt.setString(4, em_outdate);
		pstmt.setString(5, em_outt);
		pstmt.setString(6, em_bank);
		pstmt.setString(7, em_account);
		pstmt.setString(8, em_bankname);
		pstmt.setString(9, em_part);
		pstmt.setString(10, em_pos);
		pstmt.setString(11, em_out);
		
		pstmt.executeUpdate();
	} catch (SQLException e) {
		out.print(e);
	}
	response.sendRedirect("employeeList.jsp");
%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>