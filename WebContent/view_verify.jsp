<%@ page contentType="text/html; charset=EUC-KR" %> <%@ page import="java.sql.*" %>
<html><head><title> ȸ������ ���� ���ǰ˻�</title></head> <body>
<% 
request.setCharacterEncoding("EUC-KR");
String s_id = (String)session.getAttribute("session_id");
String userName = request.getParameter("userName");
String userPassword = request.getParameter("userPassword");
String userAddr = request.getParameter("userAddr");
%> 
<%  
Connection myConn = null; 
Statement stmt = null;
String mySQL = null;
String result = null; 
String dburl = "jdbc:oracle:thin:@�ּ�:orcl"; 
String user="���̵�";   
String passwd="��й�ȣ"; 
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
Class.forName(dbdriver); 
try{
myConn =  DriverManager.getConnection (dburl, user, passwd);
	mySQL = "update student set s_pwd='"+userPassword+"', s_name='" +userName+"', s_addr='"+userAddr+"' where s_id ='"+s_id+"'";
	stmt = myConn.createStatement();
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("������ �����ϼ̽��ϴ�. �������� �̵��մϴ�.");
	location.href="main.jsp";
	</script>
<%
}
catch(SQLException ex) {
	String sMessage;
	if (ex.getErrorCode() == 20002)
		sMessage="��ȣ�� 4�ڸ� �̻��̾�� �մϴ�";
	else if (ex.getErrorCode() == 20003) 
		sMessage="��ȣ�� ������ �Էµ��� �ʽ��ϴ�."; 
	else sMessage="��� �� �ٽ� �õ��Ͻʽÿ�";
 %>
 <script>
 alert("<%=sMessage%>");
 location.href="main.jsp";
 </script>
 <% 
}
 %>
</body></html>

