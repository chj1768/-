<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<style>
    * {margin:0; pading:0;}
    a{text-decoration:none; }
	a:visited { color : white;}
	
	}
</style>
<html><head><title>수강신청 입력</title></head>
<body>
<%@ include file="top.jsp" %>
<% if (session_id==null)	response.sendRedirect("login.jsp"); %>
<table frame="void" width="75%" align="center" frame="void" cellspacing="1" >
<br><br><br><br>

<tr height="30" bgcolor="#FFAB19"><th><font color="white">과목번호</font></th><th><font color="white">분반</font></th><th><font color="white">과목명</font></th><th><font color="white">학점</font></th>
<th><font color="white">수강신청</font></th></tr>
<%

mySQL = "select distinct c_id,c_id_no,c_name,c_unit from course where c_id not in (select c_id from enroll where s_id='" + session_id + "') " ;
myResultSet = stmt.executeQuery(mySQL);
if (myResultSet != null) {
while (myResultSet.next()) {
   String c_id = myResultSet.getString("c_id");
   int c_id_no = myResultSet.getInt("c_id_no");
   String c_name = myResultSet.getString("c_name");
   int c_unit = myResultSet.getInt("c_unit");
%>
<tr bgcolor="white">
<td align="center" height="30"><%= c_id %></td> <td align="center"><%= c_id_no %></td>
<td align="center" height="30"><%= c_name %></td><td align="center"><%= c_unit %></td>
<td align="center" height="30"><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%=c_id_no %>"><font color="black">신청</font></a></td>
</tr>
<%
}
}
stmt.close(); myConn.close();
%>
</table></body></html>