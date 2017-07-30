<style>
body{background-color : #FEF6F0}

	.buttons
	{
		background-color : #FFFFFD;
		border : thick solid #FFFFFD;
	 	border-radius : 5px 5px 5px 5px;
		padding : 1px;
		font-size : 15px;
	}
</style>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="EUC-KR" %>
<HTML>
<head><title>수강신청 시스템 로그인</title></head>
<BODY >
</br>
</br></br></br></br></br></br></br></br>
<div id="title" align = "center">
&nbsp;&nbsp;&nbsp;&nbsp;<img src = "pic_login_prof.png" />
</div></br></br>
<table width="30%" align="center" frame="void" cellspacing="1" >
<FORM method="post" action="login_prof_verify.jsp" >
<tr height="50"><td bgcolor="#FFAB19"><div align="center"><b><font color="white">아이디</font></b></div></td>
<td bgcolor = "white"><div align="center"><input type="text" name="userID" size = "30" style="border: 0px;"></div></td>
</tr>
<tr height="50" ><td bgcolor="#FFAB19"><div align="center"><b><font color="white">패스워드</font></b></div></td>
<td bgcolor = "white" ><div align="center"><input type="password" name="userPassword" size = "30" style="border: 0px;">
</div></td>
</tr>
<tr height="70">
<td colspan=2><div align="right">
<INPUT class="buttons" TYPE="RESET" VALUE="취소" size = "10">
<INPUT class="buttons" TYPE="SUBMIT" NAME="Submit" VALUE="로그인" size = "10" >
</div></td> 
</tr>
</table>
</FORM>
</BODY>
<br />
<br /><br />
<br /><br />
<br />
</HTML>