<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, enrollBean.*" %>

<html><head><title> 수강신청 입력 </title></head>
<body>
<%
String s_id = (String)session.getAttribute("user");
String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" scope="page"/>
<%
	String result=enrollMgr.insertEnroll(s_id, c_id, c_id_no);
%>
<script>
alert("<%= result %>");
location.href="insert.jsp"; 
</script>


</body></html>