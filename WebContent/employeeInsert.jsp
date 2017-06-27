<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet part = null;
	ResultSet position = null;

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

		<form action="addEmployee.jsp" method="post">
			<div id="em-add-content">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title" id="em-inner-head">사 진</h3>
					</div>
					<div class="panel-body" id="em-inner-body">
						<label class="control-label">사 진 </label>
					</div>
				</div>
				<div class="panel panel-primary" id="em-inside-left">
					<div class="panel-heading" id="em-inner-head">
						<h3 class="panel-title">신상 정보</h3>
					</div>
					<div class="panel-body" id="em-inner-body">
						<div class="form-group">
							<label class="control-label" for="inputDefault"> 성 명 </label> <input
								type="text" class="form-control" id="em_name" name="em_name">
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 영문 성명 </label> <input
								type="text" class="form-control" id="em_ename" name="em_ename">
						</div>
						<div class="form-group">
							<label class="control-label">성 별</label> &nbsp; <label> <input
								type="radio" name="em_gender" id="em_gender" value="남자"
								checked=""> male
							</label> <label> <input type="radio" name="em_gender"
								id="em_gender" value="여자"> female
							</label>
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 생년 월일 </label> <input
								type="date" class="form-control" id="em_brith" name="em_birth">
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 이메일 </label> <input
								type="email" class="form-control" id="em_email" name="em_email">
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 전화 번호 </label> <input
								type="tel" class="form-control" id="em_tel" name="em_tel">
							-을 제외한 숫자만 입력하세요.
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 핸드폰 번호 </label>
							<input type="tel" class="form-control" id="em_cell"
								name="em_cell"> -을 제외한 숫자만 입력하세요.
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 입사 일자 </label> <input
								type="date" class="form-control" id="em_join" name="em_join">
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 입사 구분 </label> <select
								name="em_emp" id="em_emp">
								<option value="일용">일용</option>
								<option value="수시">수시</option>
								<option value="계약">계약</option>
								<option value="정규">정규</option>
							</select>
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 부서 </label> 
							<select name="em_part" id="em_part">
								<%
									while (part.next()) {
								%>
								<option value="<%=part.getString("part_name")%>">
									<%=part.getString("part_name")%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label class="control-label" for="inputDefault"> 직급 </label> <select
								name="em_pos" id="em_pos">
								<%
									while (position.next()) {
								%>
								<option value="<%=position.getString("pos_name")%>">
									<%=position.getString("pos_name")%></option>
								<%
									}
								%>
							</select>
						</div>

					</div>
				</div>
				<div id="em-inside-right">
					<div class="panel panel-info">
						<div class="panel-heading" id="em-inner-head">
							<h3 class="panel-title">퇴 직</h3>
						</div>
						<div class="panel-body" id="em-inner-body">
							<div class="form-group">
								<label class="control-label">퇴직 여부</label> &nbsp; <label>
									<input type="radio" name="em_out" id="em_out" value="true">
									O
								</label> <label> <input type="radio" name="em_out" id="em_out"
									value="false" checked=""> X
								</label>
							</div>
							<div class="form-group">
								<label class="control-label" for="inputDefault"> 퇴직 일자 </label>
								<input type="date" class="form-control" id="em_outdate"
									name="em_outdate">
									퇴직 하지 않았다면 공백
							</div>

							<div class="form-group">
								<label class="control-label" for="inputDefault"> 퇴직 사유 </label>
								<input type="text" class="form-control" id="em_outt"
									name="em_outt">
									퇴직 하지 않았다면 공백
							</div>
						</div>
					</div>

					<div class="panel panel-danger">
						<div class="panel-heading" id="em-inner-head">
							<h3 class="panel-title">계좌 정보</h3>
						</div>
						<div class="panel-body" id="em-inner-body">
							<div class="form-group">
								<div class="form-group">
									<label class="control-label" for="inputDefault"> 명 의 </label> <input
										type="text" class="form-control" id="em_bankname"
										name="em_bankname">
								</div>
								<label class="control-label" for="inputDefault"> 은 행 </label> <input
									type="text" class="form-control" id="em_bank" name="em_bank">
							</div>
							<div class="form-group">
								<label class="control-label" for="inputDefault"> 계좌 번호 </label>
								<input type="text" class="form-control" id="em_account"
									name="em_account">
							</div>
						</div>
					</div>
					<div id="em-button">
						<input class="btn btn-primary btn-lg" type="submit" value="추가하기">
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 사원 등록 -->
</body>
</html>
