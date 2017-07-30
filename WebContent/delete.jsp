<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, java.util.*, enrollBean.*" %>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr"></jsp:useBean>
<html><head><title>수강신청 삭제</title></head>
<style>
	.buttons
	{
		background-color : #FFFFFD;
		border : thick solid #FFFFFD;
	 	border-radius : 6px 6px 6px 6px;
		padding : 1px;
		font-size : 15px;
	}
</style>
<body>
<%@ include file="top.jsp" %>


<br><br><br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<br>
<tr height = "30" align="center" >
<th bgcolor="#FFAB19"><div align="center"><font color="white">과목번호</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">분반</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">과목명</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">학점</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">수강신청</font></div>
</tr>
<% if (session_id==null) response.sendRedirect("login.jsp");
Vector vlist =null;
vlist = enrollMgr.getEnrollList(session_id);
%>
<tr align="center"  height="30" >
<%
int counter = vlist.size();
int totUnit = 0;

for(int i=0; i<vlist.size();i++){
   viewList en  = (viewList)vlist.get(i);
  
%>

<td height="30" bgcolor="white"><div align="center"><%=en.getC_id() %></div></td>
<td  height="30" bgcolor="white"><div align="center"><%=en.getC_id_no() %></div></td>
<td height="30" bgcolor="white"><div align="center"><%=en.getC_name() %></div></td>
<td  height="30" bgcolor="white"><div align="center"><%=en.getC_unit() %></div></td>
<td  height="30" bgcolor="white"><div align="center"><a href="delete_verify.jsp?c_id=<%=en.getC_id()%>&c_id_no=<%=en.getC_id_no()%>"><font color="black">삭제</font></a></div></td>
</tr>
<%} %>
</table><br><br><br><br><br>

</body></html>