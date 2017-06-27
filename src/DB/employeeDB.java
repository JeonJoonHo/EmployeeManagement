package DB;

import java.sql.*;

public class employeeDB {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	String DB_URL = "jdbc:mysql://localhost:3306/employee";
	String DB_ID = "admin";
	String DB_PW = "1234";
	static{
		try{
			Class.forName("com.mysql.jdbc.Driver");		
		} catch (ClassNotFoundException e){
			System.out.print(e.toString());
		}
	}
	
	public Connection dbConnect() throws SQLException {
			return DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	}
	
	public void dbPartInsert(String partName) throws SQLException {
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			
			String sql = "INSERT INTO empart(part_name) VALUES (?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, partName);
			
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// �μ� �Է�
	
	public void dbPositionInsert(String posName) throws SQLException {
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
			
			String sql = "INSERT INTO emposition(pos_name) VALUES (?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, posName);
			
			pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// ���� �Է�
	
	public ResultSet dbPartUpdate() throws SQLException {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
		
			String sql = "SELECT* FROM empart";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
		
			return rs;
	}
	// �μ� ���
	
	public ResultSet dbPositionUpdate() throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM emposition";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ���� ���
	
	public ResultSet dbEmployeeUpdate() throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT em_num, em_name, em_part, em_pos, em_join, em_account, em_email FROM employees";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ��� ��� ���
	
	public ResultSet dbEmployeeView(int id) throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM employees WHERE em_num =" + id;
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ��� ���� ���
	
	public ResultSet dbEmployeeRetire() throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM employees WHERE em_out = 'true'" ;
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ������ ���� ��� ���� ���
	
	public ResultSet dbEmployee() throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM employees WHERE em_out = 'false'";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ������ ���� ��� ���� ���
	
	public ResultSet dbEmployeeSerachRet(int id	) throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM employees WHERE em_out = 'true' AND em_num = " + id;
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ������ ���� ��� �˻�
	
	public ResultSet dbEmployeeSerach(int id) throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	
		String sql = "SELECT* FROM employees WHERE em_out = 'false' AND em_num = " + id;
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	
		return rs;
	}
	// ������ ���� ��� �˻�
	
	public void dbEmployeeDelete(int id) throws SQLException {
		con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
		
		String sql = "DELETE FROM employees WHERE em_num=" + id;
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.executeUpdate();
	}
	//��� ����
}
