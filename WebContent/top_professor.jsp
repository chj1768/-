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
String user = request.getParameter("user"); 
String session_id = (String)session.getAttribute("user");
String log;
Connection myConn = null;
ResultSet myResultSet = null;
Statement stmt = null;
String mySQL = "";
String dburl = "jdbc:oracle:thin:@주소:orcl";
String user = "아이디";
String passwd = "비밀번호";
String dbdriver = "oracle.jdbc.driver.OracleDriver";
try {
Class.forName(dbdriver);
myConn = DriverManager.getConnection (dburl, user, passwd);
stmt = myConn.createStatement();
} catch(SQLException ex) { System.err.println("SQLException: " + ex.getMessage());
}

if (session_id==null) log="<a href=start.jsp>로그인</a>";
else log="<a href=logout.jsp>로그아웃</a>";

int current_year;
int current_semester;
CallableStatement cstmt = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
cstmt.execute();
current_year = cstmt.getInt(1);

CallableStatement cstmt_s = myConn.prepareCall("{ ? = call Date2EnrollSemester(SYSDATE)}");
cstmt_s.registerOutParameter(1, java.sql.Types.INTEGER);
cstmt_s.execute();
current_semester = cstmt_s.getInt(1);


%>
<br><br>
<div id="image" align = "center">
<a href="main_professor.jsp"><img src = "banner1.png" with = "160" height = "60" /></a>
</div>
<br>
<br>
<table width="75%" align="center" frame="void" cellspacing="1" height="30" bgcolor="#A36F05">
<tr>
<td align="center" width = "200"><b><font color="white"><%=log%></font></b></td>
<td align="center" width = "200"><b><a href="update_professor.jsp"><font color="white">사용자 정보 수정</font></b></td>
<td align="center" width = "200"><b><a href="view_professor.jsp?year=<%=current_year%>&semester=<%=current_semester%>"><font color="white">수강신청 조회</font></b></td>
</tr>
</table>
</div>
