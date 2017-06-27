<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="DB.*, java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("page");
	int idx = Integer.parseInt(id);

	employeeDB dbs = new employeeDB();

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet emView = null;

	dbs.dbConnect();

	emView = dbs.dbEmployeeView(Integer.parseInt(id));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="backgroud.css">
<meta charset="utf-8">
<title>사원 관리 프로그램</title>
<script>
	var fnPrint = function() {
		document.body.innerHTML = selectArea.innerHTML;
		window.print();
	};
</script>
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
				<form class="navbar-form navbar-right" role="search" action="employeeSerach.jsp">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search" id="serach" name="search">
					</div>
					<button type="submit" class="btn btn-default">검색하기</button>
				</form>
			</div>
		</div>
		</nav>
		<!-- 네비바 -->
		<div id="em-add-content">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#profile" data-toggle="tab">신상
						정보</a></li>
				<li><a href="#account" data-toggle="tab">계 좌</a></li>
				<li><a href="#retire" data-toggle="tab">퇴 직</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> 재직 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#print" data-toggle="tab">재직 증명서</a></li>
					</ul></li>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade active in" id="profile">
					<table class="table table-striped table-hover ">
						<%
							while (emView.next()) {
						%>

						<thead>
							<tr>
								<th class="info">사원 번호</th>
								<th><%=emView.getInt("em_num")%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>성 명</td>
								<td><%=emView.getString("em_name")%></td>
							</tr>
							<tr>
								<td>영문 성명</td>
								<td><%=emView.getString("em_ename")%></td>
							</tr>
							<tr>
								<td>성 별</td>
								<td><%=emView.getString("em_gender")%></td>
							</tr>
							<tr>
								<td>생년 월일</td>
								<td><%=emView.getString("em_birth")%></td>
							</tr>
							<tr>
								<td>전화 번호</td>
								<td><%=emView.getString("em_tel")%></td>
							</tr>
							<tr>
								<td>핸드폰 번호</td>
								<td><%=emView.getString("em_cell")%></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><%=emView.getString("em_email")%></td>
							</tr>
							<tr>
								<td>부서</td>
								<td><%=emView.getString("em_part")%></td>
							</tr>
							<tr>
								<td>직급</td>
								<td><%=emView.getString("em_pos")%></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="account">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th class="info">은행</th>
								<th><%=emView.getString("em_bank")%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>계좌 번호</td>
								<td><%=emView.getString("em_account")%></td>
							</tr>
							<tr>
								<td>명의</td>
								<td><%=emView.getString("em_bankname")%></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="retire">
					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th class="info">퇴직 일자</th>
								<th><%=emView.getString("em_outdate")%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>퇴직 사유</td>
								<td><%=emView.getString("em_outt")%></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tab-pane fade" id="print">
					<!-- 성명, 생년월일, 주소, 부서, 직급, 근무기간, 용도, 발행기관, 기관장명 -->
					<input type="button" value="출력하기" onClick="fnPrint()" />
					<table class="table table-striped table-hover " id="selectArea">
						<thead>
							<tr>
								<th class="info">성 명</th>
								<th><%=emView.getString("em_name")%></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>생년 월일</td>
								<td><%=emView.getString("em_birth")%></td>
							</tr>
							<tr>
								<td>부서</td>
								<td><%=emView.getString("em_part")%></td>
							</tr>
							<tr>
								<td>직급</td>
								<td><%=emView.getString("em_pos")%></td>
							</tr>
							<tr>
								<td>입사 일자</td>
								<td><%=emView.getString("em_join")%></td>
							</tr>
							<tr>
								<td>용 도</td>
								<td>용 도</td>
							</tr>
							<tr>
								<td>발행 기관</td>
								<td>A 기관</td>
							</tr>
							<tr>
								<td>기관장명</td>
								<td>A 기관장</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<%
				}
			%>

			<div id="em-button">
				<a class="btn btn-primary" href="employeeAdjust.jsp?page=<%=idx%>">수정하기</a>
				<a class="btn btn-primary" href="deleteEmployee.jsp?page=<%=idx%>">삭제하기</a>
			</div>
		</div>

	</div>
</body>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>

</html>