<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<style>
    * {margin:0; pading:0;}
    a{text-decoration:none; }
	a:visited { color : white;}
	
	}
</style>
<html><head><title>과목 조회</title></head>
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
<%@ include file="top_professor.jsp" %>
<% if (session_id==null) response.sendRedirect("login_professor.jsp");
request.setCharacterEncoding("EUC-KR");
String year = request.getParameter("year");
String semester = request.getParameter("semester");
%>
<script>
function searchCheck(frm){
    //검색
   
    if(frm.inputYear.value == "" || frm.inputSemester.value == ""){
        alert("검색 학기와 년도를 입력하세요.");
        frm.keyWord.focus();
        return;
    }
    var a = frm.inputYear.value;
    var b = frm.inputSemester.value;
    location.href="view_professor.jsp?year=" + encodeURI( a, "UTF-8")+"&semester="+encodeURI( b, "UTF-8");      
}
</script>
<br><br><br><br>
<table width="60%" align="center"  frame="void" cellspacing="1" >
<br>
<tr height = "30">
<th bgcolor="#FFAB19"><div align="center"><font color="white">과목번호</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">분반</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">과목명</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">학점</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">시간</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">장소</font></div>
<th bgcolor="#FFAB19"><div align="center"><font color="white">학생조회</font></div>
</tr>
<%
int count =0;
int total_unit =0;
int e_year = 0, e_semester = 0;
mySQL = "select teach.p_id, teach.c_id, teach.c_id_no, course.c_name, course.c_location, course.c_unit, course.c_time, course.c_year, course.c_semester from teach, course where course.c_id = teach.c_id and course.c_id_no = teach.c_id_no and teach.p_id='"+session_id+"'and course.c_year ='"+year+"' and course.c_semester='"+semester+"'order by course.c_time";
myResultSet = stmt.executeQuery(mySQL);
if (myResultSet != null) {
while (myResultSet.next()) {
   String c_id = myResultSet.getString(2);
   int c_id_no = myResultSet.getInt(3);
   String c_name = myResultSet.getString(4);
   String c_location = myResultSet.getString(5);
   int c_unit = myResultSet.getInt(6);
   int c_time = myResultSet.getInt(7);
   e_year = myResultSet.getInt(8);
   e_semester = myResultSet.getInt(9);
   
   count++;
   total_unit += c_unit;
   
%>
<tr bgcolor="white">
<td align="center" height="30"><%= c_id %></td><td align="center" height="30"><%= c_id_no %></td>
<td align="center" height="30"><%= c_name %></td><td align="center" height="30"><%= c_unit %></td>
<td align="center" height="30"><%= c_time %></td><td align="center" height="30"><%= c_location %></td>
<td align="center" height="30"><a href="prof_student_list.jsp?c_id=<%= c_id %>&c_id_no=<%=
c_id_no %>&year=<%=current_year%>&semester=<%=current_semester%>"><font color="black">학생리스트</font></a></td>
</tr>

<%
}
}
%>
</table><br><br><br><br><br>

<table align="center"  frame="void" cellspacing="1"  width="60%"  >

<tr height = "30">
<td align="center" height="30"></td><td align="center" height="30"></td>
<td align="center" height="30"></td><td align="center" height="30"></td>
<td align="center" height="30">
<td bgcolor="#FFAB19" width="20%"><div align="center"><font color="white">총 담당 과목 수</font></div>
<td align="center" height="30" width="20%"bgcolor="white"><%= count %></td>
</tr>
<tr>
<td align="center" height="30"></td><td align="center" height="30"></td>
<td align="center" height="30"></td><td align="center" height="30"></td>
<td align="center" height="30">
<td bgcolor="#FFAB19"><div align="center"><font color="white">총 담당 학점</font></div>
<td align="center" height="30"bgcolor="white"><%= total_unit %></td>
</tr>
</table>
<br><br><br><br>

<% 
	stmt.close(); myConn.close();
%>
</table></body></html>
