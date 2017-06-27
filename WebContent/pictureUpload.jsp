<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.oreilly.servlet.MultipartRequest, java.util.*, com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%
	String uploadPath = "picture/";

	int size = 10 * 1024 * 1024; // 업로드 파일 최대 크기 지정
	

	try {
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());
		String m_name = multi.getParameter("m_name");
		String m_nickname = multi.getParameter("m_nickname");
		 
		// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다.

	} catch (Exception e) {
		e.printStackTrace();
	}

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