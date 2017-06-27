<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet part = null;
	ResultSet position = null;
	ResultSet employee = null;

	dbs.dbConnect();

	part = dbs.dbPartUpdate();
	position = dbs.dbPositionUpdate();
%>
<!DOCTYPE html>
<html lang="ko">
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
						<li class="active"><a href="employeePart.jsp"> 부서 목록 <span
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
			<a class="btn btn-primary" href="partAdd.jsp">부서 및 직급 추가하기</a>
			<ul class="nav nav-tabs">
				<%
					while (part.next()) {
				%>
				<li><a href="#<%=part.getString("part_name")%>"
					data-toggle="tab"><%=part.getString("part_name")%></a></li>
				<%
					}
				%>
			</ul>
			<div id="myTabContent" class="tab-content">
				<%
					part.beforeFirst();
					while (part.next()) {
				%>
				<div class="tab-pane fade" id="<%=part.getString("part_name")%>">
					<%
						while (position.next()) {
					%>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title"><%=position.getString("pos_name")%></h3>
						</div>
					</div>
					<%
						}
							position.beforeFirst();
					%>
				</div>
				<%
					}
				%>
			</div>
		</div>
</body>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>