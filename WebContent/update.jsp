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
<html><head><title>������û ����� ���� ����</title></head> <body> 
<%@ include file="top.jsp" %>

<% 
session_id= (String)session.getAttribute("user");
if (session_id==null) response.sendRedirect("login.jsp");
mySQL = "select * from student where s_id='" + session_id + "'";
myResultSet = stmt.executeQuery(mySQL);
if(myResultSet != null){
	while(myResultSet.next()){
		 String s_id =  myResultSet.getString("s_id");
		 String s_pwd =  myResultSet.getString("s_pwd");
		 String s_name =  myResultSet.getString("s_name");
		 String s_addr =  myResultSet.getString("s_addr");
		 int s_grade =  myResultSet.getInt("s_grade");
		 String s_univ =  myResultSet.getString("s_univ");
		 String s_major =  myResultSet.getString("s_major");
	

%>
<br><br><br>
<form method="post" action="update_verify.jsp">
<div id="image" align = "center">
<a href="start.jsp"><img src = "question_password.png" with = "120" height = "40" /></a>
</div>
<br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">ID</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  name="userID" size = "30" style="border: 0px;background-color:#F6F6F6" value="<%=s_id %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">�̸�</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  name="userName" size = "30" style="border: 0px;background-color:#F6F6F6" value="<%=s_name %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">�н�����</div></td>
<td bgcolor = "white" ><div align="center"><input type="password"  name="userPassword" size = "30" style="border: 0px;" value="<%=s_pwd %>" ></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">�ּ�</div></td>
<td bgcolor = "white" ><div align="center"><input type="text" name="userAddr" size = "30" style="border: 0px;" value="<%=s_addr %>">
</div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">�г�</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  name="userGrade" size = "30" style="border: 0px;background-color:#F6F6F6" value="<%=s_grade %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">�б���</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  name="userUniv" size = "30" style="border: 0px;background-color:#F6F6F6" value="<%=s_univ %>" readonly="true"></div></td>
</tr>
<tr height = "40">
<td bgcolor="#FFAB19"><div align="center">����</div></td>
<td bgcolor = "#F6F6F6" ><div align="center"><input type="text"  name="userMajor" size = "30" style="border: 0px;background-color:#F6F6F6" value="<%=s_major %>" readonly="true" ></div></td>
</tr>
</table>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<tr height = "40">
<td colspan=2><div align="right" >
<INPUT  class="buttons" TYPE="RESET" VALUE="���">&nbsp;&nbsp;
<INPUT class="buttons" TYPE="SUBMIT" NAME="Submit" VALUE="�����Ϸ�">&nbsp;
</div></td>
</tr>
</table>
<%
}
	}
%>
</form></body>
 </HTML>