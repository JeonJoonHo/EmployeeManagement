<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet emView = null;
	ResultSet emRetire = null;

	dbs.dbConnect();

	emView = dbs.dbEmployee();
	emRetire = dbs.dbEmployeeRetire();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="backgroud.css">
<meta charset="utf-8">
<title>사원 관리 프로그램</title>
</head>
<body>
	<div id="em-container">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid" id="jb-header">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> 홈 </a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-2">
				<ul class="nav navbar-nav">
					<li class="active"><a href="employeePart.jsp""> 부서 목록 <span
							class="sr-only">(current)</span></a></li>
					<li class="active"><a href="employeeList.jsp"> 사원 목록 <span
							class="sr-only">(current)</span></a></li>
				</ul>
				<form class="navbar-form navbar-right" role="search"
					action="employeeSerach.jsp">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search"
							id="serach" name="search">
					</div>
					<button type="submit" class="btn btn-default">검색하기</button>
				</form>	
			</div>
		</div>
		</nav>
		<!-- 네비바 -->
		<div id="em-add-content">
			<a class="btn btn-primary" href="employeeInsert.jsp">사원 추가하기</a>
			<div id="em=list=top">
				<h2>재직자 명단</h2>
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th class="info">사원 번호</th>
							<th class="success">성 명</th>
							<th class="danger">부 서</th>
							<th class="warning">직 급</th>
							<th class="active">입사 일자</th>
							<th class="success">계좌 번호</th>
							<th class="warning">이메일</th>
							<th>비 고</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (emView.next()) {
						%>
						<tr>
							<td><a
								href="employeeView.jsp?page=<%=emView.getInt("em_num")%>"><%=emView.getInt("em_num")%></a></td>
							<td><%=emView.getString("em_name")%></td>
							<td><%=emView.getString("em_part")%></td>
							<td><%=emView.getString("em_pos")%></td>
							<td><%=emView.getString("em_join")%></td>
							<td><%=emView.getString("em_account")%></td>
							<td><%=emView.getString("em_email")%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<div id="em-list-bottom">
				<h2>퇴직자 명단</h2>
				<table class="table table-striped table-hover ">
					<thead>
						<tr>
							<th class="info">사원 번호</th>
							<th class="success">성 명</th>
							<th class="danger">부 서</th>
							<th class="warning">직 급</th>
							<th class="active">입사 일자</th>
							<th class="success">계좌 번호</th>
							<th class="warning">이메일</th>
							<th>비 고</th>
						</tr>
					</thead>
					<tbody>
						<%
							while (emRetire.next()) {
						%>
						<tr>
							<td><a
								href="employeeView.jsp?page=<%=emRetire.getInt("em_num")%>"><%=emRetire.getInt("em_num")%></a></td>
							<td><%=emRetire.getString("em_name")%></td>
							<td><%=emRetire.getString("em_part")%></td>
							<td><%=emRetire.getString("em_pos")%></td>
							<td><%=emRetire.getString("em_join")%></td>
							<td><%=emRetire.getString("em_account")%></td>
							<td><%=emRetire.getString("em_email")%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
</body>
</html>