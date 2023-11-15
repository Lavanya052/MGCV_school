<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>name list display</title>
		<meta
			http-equiv="Content-Type"   
			content="text/html; charset=iso-8859-1"
		/>
		<link href="fontstyle.css" rel="stylesheet" type="text/css" />
		<script></script>
		<style>
			table tr td {
				border: 2px solid green;
				background: cyan;
				font-size: 150%;
				padding: 2px;
				margin: auto;
				width: 70%;
			}
		</style>
	</head>

	<body>
		<% String file = "namelist"; %> 
                <%@ include file="mgcvdb.jsp"%>
		<% int sno=1; 
		
                String query = "select * from teacher"; 
                Vector v =db.getData(stmt,query,500,1);
                int nr = db.getRows(v);// 
                int nc =db.getCols(v);//3 
db.close(); 
                %>

		<table>
			<tr>
				<td>s.no</td>
				<td>Teachername</td>
                                <td>Dept</td>
				<td>teachermail</td>
				
			</tr>
			<% 
                            for(int i = 1;i<=nr*nc;i+=nc) 
                            {
                                %>
			<tr>
				<td><%=sno++%></td>
				<td><%=v.get(i)%></td>
				<td><%=v.get(i+1)%></td>
                                <td><%=v.get(i+2)%></td>
				
			</tr>
			<% } %>
		</table>
	</body>
</html>
