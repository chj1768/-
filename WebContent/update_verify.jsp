<%@ page contentType="text/html; charset=EUC-KR" %> <%@ page import="java.sql.*" %>
<html><head><title> 회원정보 수정 조건검사</title></head> <body>
<% 
request.setCharacterEncoding("EUC-KR");
String s_id = (String)session.getAttribute("user");
String userName = request.getParameter("userName");
String userPassword = request.getParameter("userPassword");
String userAddr = request.getParameter("userAddr");
%> 
<%  
 
try{
	Connection myConn = null;
	ResultSet myResultSet = null;
	Statement stmt = null;
	String mySQL = "";
	String user1 = "db01";
	String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
	String passwd = "ss2";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	try {
	Class.forName(dbdriver);
	myConn = DriverManager.getConnection (dburl, user1, passwd);
	stmt = myConn.createStatement();
	} catch(SQLException ex) { System.err.println("SQLException: " + ex.getMessage());
	}
	mySQL = "update student set s_pwd='"+userPassword+"', s_name='" +userName+"', s_addr='"+userAddr+"' where s_id ='"+s_id+"'";
	stmt = myConn.createStatement();
	myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("수정에 성공하셨습니다.");
	location.href="update.jsp";
	</script>
<%
}
catch(SQLException ex) {
	String sMessage;
	if (ex.getErrorCode() == 20002)
		sMessage="암호는 4자리 이상이어야 합니다";
	else if (ex.getErrorCode() == 20003) 
		sMessage="암호에 공란은 입력되지 않습니다."; 
	else sMessage="잠시 후 다시 시도하십시오";
 %>
 <script>
 alert("<%=sMessage%>");
 location.href="update.jsp";
 </script>
 <% 
}
 %>
</body></html>

