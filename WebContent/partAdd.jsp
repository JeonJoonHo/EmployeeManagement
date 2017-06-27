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
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
				</div>
			</div>
		</nav>
		<!-- 네비바 -->
		<div id="em-add-content">
			<form action="addPart.jsp" method="post">
				<div class="form-group">
					<label class="control-label" for="focusedInput">부 서</label> <input
						type="text" id="part_name" name="part_name" class="form-control">
				</div>

				<div class="form-group">
					<label class="control-label" for="focusedInput">직 급</label> <input
						type="text" id="pos_name" name="pos_name" class="form-control">
				</div>
				<div id="em-button">
					<input type="submit" class="btn btn-primary" value="추가하기">
				</div>
			</form>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</html>