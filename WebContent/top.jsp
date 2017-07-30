<style>
    * {margin:0; padding:0;}
   a {text-decoration:none; }
	a{ color : #FFFFFF; }
	body{background-color : #FEF6F0}
</style>
<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>

<div id = "top">
<%
String session_id = (String)session.getAttribute("user");
String log;
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

if (session_id==null) log="<a href=start.jsp>로그인</a>";
else log="<a href=logout.jsp>로그아웃</a>";
%>
<br><br>
<div id="image" align = "center">
<a href="main.jsp"><img src = "banner1.png" with = "160" height = "60" /></a>
</div>
<br><br>

<table width="75%" align="center" frame="void" cellspacing="1" height="30" bgcolor="#A36F05">
<tr>
<td align="center"><b><font color="white"><%=log%></font></b></td>
<td align="center"><b><a href="update.jsp"><font color="white">사용자 정보 수정</font></b></td>
<td align="center"><b><a href="insert.jsp"><font color="white">수강신청 입력</font></b></td>
<td align="center"><b><a href="delete.jsp"><font color="white">수강신청 삭제</font></b></td>
<td align="center"><b><a href="view.jsp"><font color="white">수강신청 조회</font></b></td>
</tr>
</table>
</div>
