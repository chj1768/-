<%@ page contentType="text/html; charset=EUC-KR" %>
<html><head>
<title>데이터베이스를 활용한 수강 신청 시스템입니다.</title></head>
<body>
<%@ include file="top_professor.jsp"%>
<table width="75%" align="center" height="100%">
<% if (session_id != null) { %>
<tr>
<td align="center"><%=session_id%> 님 방문을 환영합니다.</td>
</tr>
<% } else { %>
<tr>
<td align="center">로그인한 후 사용하세요.</td>
</tr>
<%
}
%>
</table>
</body>
</html>
