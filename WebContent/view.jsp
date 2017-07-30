<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, java.util.*, enrollBean.*" %>
<html><head><title>������û ��ȸ</title></head>
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
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr"></jsp:useBean>
<% if (session_id==null) response.sendRedirect("login.jsp");
Vector vlist =null;
if(request.getParameter("year") == null)
	vlist = enrollMgr.getEnrollList(session_id);
else{
	int year = Integer.parseInt(request.getParameter("year"));
	int semester = Integer.parseInt(request.getParameter("semester"));
	vlist = enrollMgr.getEnrollList(session_id, year, semester);
}
%>
<script>
function searchCheck(frm){
    //�˻�
   
    if(frm.year.value == "" || frm.semester.value == ""){
        alert("�˻� �б�� �⵵�� �Է��ϼ���.");
        frm.keyWord.focus();
        return;
    }
    var a = frm.year.value;
    var b = frm.semester.value;
    location.href("view.jsp?year="+ encodeURI(a, "UTF-8")+"&semester="+encodeURI(b, "UTF-8"));      
}
</script>
<br><br><br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<br>
<tr height = "30">
<th bgcolor="#FFAB19"><div align="center"><font color="white">�����ȣ</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">�й�</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">�����</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">����</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">�ð�</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">���</font></div>
</tr>
<%
int counter = vlist.size();
int totUnit = 0;

for(int i=0; i<vlist.size();i++){
   viewList en  = (viewList)vlist.elementAt(i);
   System.out.println(en.getC_id());
   totUnit += en.getC_unit();
   
%>
<tr bgcolor="white" >
<td align="center"><%= en.getC_id() %></td> <td align="center"><%= en.getC_id_no() %></td>
<td align="center"><%= en.getC_name() %></td><td align="center"><%= en.getC_unit() %></td>
<td align="center"><%= en.getC_time() %></td><td align="center"><%= en.getC_location() %></td>
</tr>
<%} %>
</table><br><br><br><br><br>

<table align="center"  frame="void" cellspacing="1" >
<tr height = "30">
<th bgcolor="#FFAB19" width="20%"><div align="center"><font color="white">�� ��û ���� ��</font></div>
<td align="center" height="30" width="20%"bgcolor="white"><%=counter %></td>
</tr>
<tr>
<th bgcolor="#FFAB19"><div align="center"><font color="white">�� ��û ����</font></div>
<td align="center" height="30"bgcolor="white"><%=totUnit %></td>
</tr>
</table>
<br><br><br><br>
<form method="get" action="view.jsp">
<table width="40%" align="center">
<tr>

<td align="center" ><input type="text" size = "8px" id="year"> </input></td> 
<td align="center" width="10%">�⵵ </td>
<td align="center"><input type="text" size = "8px" id="semester"></input> </td>
<td align="center" width="10%">�б� </td>
<td align="center" width="10%"> <input class="buttons"  type="button" value="�˻�" onclick="searchCheck(form)" /></td>
</form>
</tr>
</table>
</table></body></html>
