<%@ page contentType="text/html; charset=EUC-KR" %> <%@ page import="java.sql.*" %>
<html><head><title> ȸ������ ���� ���ǰ˻�</title></head> <body>
<% 
request.setCharacterEncoding("EUC-KR");
String p_id = (String)session.getAttribute("user");
String userName = request.getParameter("userName");
String userPassword = request.getParameter("userPassword");
%> 
<%  
Connection myConn = null; 
Statement stmt = null;
String mySQL = null;
String result = null; 
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl"; 
String user="db01";   
String passwd="ss2"; 
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();
Class.forName(dbdriver); 
try{
myConn =  DriverManager.getConnection (dburl, user, passwd);
	mySQL = "update professor set p_pwd='"+userPassword+"' where p_id ='"+p_id+"'";
	stmt = myConn.createStatement();
	ResultSet myResultSet = stmt.executeQuery(mySQL);
	%>
	<script>
	alert("������ �����ϼ̽��ϴ�.");
	location.href="update_professor.jsp";
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
 location.href="update_professor.jsp";
 </script>
 <% 
}
 %>
</body></html>
