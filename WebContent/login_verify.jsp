<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%
String userID = request.getParameter("userID");
String id = null;
String userPassword = request.getParameter("userPassword");
int check = -1;
Connection myConn = null;
Statement stmt = null;
String mySQL = null;
String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
String user = "db01";
String passwd = "ss2";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='"
+ userPassword + "'";


ResultSet myResultSet = stmt.executeQuery(mySQL);


if(myResultSet != null){
	if(myResultSet.next())
	{
		id = myResultSet.getString("s_id");
		if(userID.equals(id))
			check = 1;
	}
}

if(check == 1)
{
	session.setAttribute("user",id);
	session.setAttribute("session_pw", userPassword);
	response.sendRedirect("main.jsp");
}

else
	response.sendRedirect("login.jsp");

stmt.close();
myConn.close();
%>