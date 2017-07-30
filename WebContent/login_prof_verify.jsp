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
String dburl = "jdbc:oracle:thin:@주소:orcl";
String user = "아이디";
String passwd = "비밀번호";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
Class.forName(dbdriver);
myConn = DriverManager.getConnection(dburl, user, passwd);
stmt = myConn.createStatement();

mySQL = "select p_id from professor where p_id='" + userID + "' and p_pwd='"
+ userPassword + "'";


ResultSet myResultSet = stmt.executeQuery(mySQL);


if(myResultSet != null){
	if(myResultSet.next())
	{
		id = myResultSet.getString("p_id");
		if(userID.equals(id))
			check = 1;
	}
}

if(check == 1)
{
	session.setAttribute("user",id);
	session.setAttribute("session_pw", userPassword);
	response.sendRedirect("main_professor.jsp");
}

else
	response.sendRedirect("login_professor.jsp");

stmt.close();
myConn.close();
%>