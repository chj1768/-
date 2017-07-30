<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<html><head><title>학생 조회</title></head>
<style>
	.buttons
	{
		background-color : #FFFFFD;
		border : thick solid #FFFFFD;
	 	border-radius : 6px 6px 6px 6px;
		padding : 1px;
		font-size : 15px;
	}
	   a {text-decoration:none; }
	a{ color : #FFFFFF; }
	
</style>
<body>
<%@ include file="top_professor.jsp" %>
<% if (session_id==null) response.sendRedirect("login_professor.jsp");
request.setCharacterEncoding("EUC-KR");
String year = request.getParameter("year");
String semester = request.getParameter("semester");
String c_id = request.getParameter("c_id");
int c_id_no =Integer.parseInt(request.getParameter("c_id_no"));
int count =0;
%>

<br><br><br><br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<br>
<tr height = "30">
<th bgcolor="#FFAB19"><div align="center"><font color="white">이름</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">학년</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">학번</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">전공</font></div>
</tr>
<%

mySQL = "select student.s_name, student.s_grade, student.s_id, student.s_major, enroll.c_id, enroll.c_id_no, enroll.e_year, enroll.e_semester, enroll.s_id from student, enroll where enroll.c_id= '"+ c_id+"'and enroll.c_id_no = '"+ c_id_no +"'and enroll.e_year ='"+year+"' and enroll.e_semester='"+semester+"'and enroll.s_id = student.s_id";
myResultSet = stmt.executeQuery(mySQL);
if (myResultSet != null) {
	
while (myResultSet.next()) {
   String s_name = myResultSet.getString(1);
   int s_grade = myResultSet.getInt(2);
   String s_id = myResultSet.getString(3);
   String s_major = myResultSet.getString(4);

   count++;
   
%>
<tr bgcolor="white">
<td align="center" height="30"><%= s_name %></td><td align="center" height="30"><%= s_grade %></td>
<td align="center" height="30"><%= s_id %></td><td align="center" height="30"><%= s_major %></td>
</tr>

<%
}
}
%>
</table><br><br><br><br><br>
<table  width="60%" align="center"  frame="void" cellspacing="1" >
<tr height = "30" >
<td align="left" height="30" class="buttons" width = "130"><a href="view_professor.jsp?year=<%=year%>&semester=<%=semester%>"><font color="black">이전으로 돌아가기</font></a></td><td align="center" height="30"></td>
<th bgcolor="#FFAB19" width="20%"><div><font color="white">총 학생 수</font></div>
<td align="center" height="30" width="20%"bgcolor="white"><%= count %></td>
</tr>
</table>

<% 
	stmt.close(); myConn.close();
%>
</table></body></html>
