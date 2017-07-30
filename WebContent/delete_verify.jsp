<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*, enrollBean.*" %>
<html><head><title> 수강신청 삭제 확인 </title></head>
<body>
<%
String s_id = (String)session.getAttribute("user");
String c_id = request.getParameter("c_id");
int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
%>
<jsp:useBean id="enrollMgr" class="enrollBean.EnrollMgr" scope="page"/>
<%

enrollMgr.deleteEnroll(s_id, c_id, c_id_no);

%>
<script>
alert("해당 과목이 수강신청 목록에서 삭제되었습니다.");
location.href("delete.jsp");
</script>





</body></html>