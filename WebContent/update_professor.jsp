<style>
body{background-color : #FEF6F0}

	.buttons
	{
		background-color : #FFFFFD;
		border : thick solid #FFFFFD;
	 	border-radius : 6px 6px 6px 6px;
		padding : 1px;
		font-size : 15px;
	}
</style>
<%@ page contentType="text/html; charset=EUC-KR" %> <%@ page import="java.sql.*" %> 
<html><head><title>수강신청 사용자 정보 수정</title></head> <body> 
<%@ include file="top_professor.jsp" %>
<%

Class.forName(dbdriver); 
myConn = DriverManager.getConnection(dburl, user1, passwd); 
stmt = myConn.createStatement(); 
%>
<% 
session_id= (String)session.getAttribute("user");
if (session_id==null) response.sendRedirect("login_professor.jsp");
mySQL = "select * from professor where p_id='" + session_id + "'";
myResultSet = stmt.executeQuery(mySQL);
if(myResultSet != null){
	while(myResultSet.next()){
		 String p_id =  myResultSet.getString("p_id");
		 String p_pwd =  myResultSet.getString("p_pwd");
		 String p_name =  myResultSet.getString("p_name");
		 String p_major =  myResultSet.getString("p_major");
%>
<br><br><br>
<form method="post" action="update_prof_verify.jsp">
<div id="image" align = "center">
<a href="start.jsp"><img src = "question_password.png" with = "120" height = "40" /></a>
</div>
<br>
<table width="60%" align="center" frame="void" cellspacing="1" >
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">ID</div></td>
<td bgcolor = "#F6F6F6" ><div align="center" ><input type="text" style="border: 0px;background-color:#F6F6F6" name="userID" value="<%=p_id %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">패스워드</div></td>
<td bgcolor = "white"><div align="center" ><input type="password"  name="userPassword" style="border: 0px;" value="<%=p_pwd %>" ></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">이름</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  style="border: 0px;background-color:#F6F6F6" name="userName" value="<%=p_name %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">전공</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text" style="border: 0px;background-color:#F6F6F6"  name="userMajor" value="<%=p_major %>" readonly="true" ></div></td>
</tr >
</table>
<br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<tr height = "40">
<td colspan=2><div align="right" >
<INPUT  class="buttons" TYPE="RESET" VALUE="취소">&nbsp;&nbsp;
<INPUT class="buttons" TYPE="SUBMIT" NAME="Submit" VALUE="수정완료">&nbsp;
</div></td>
</tr>
</table>
<%
}
	}
%>
</form></body></html>
