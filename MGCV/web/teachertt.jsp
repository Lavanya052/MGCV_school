<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "teachertt";%> 
<%@ include file="mgcvdb.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Timetable</title>
		<link rel="icon" type="image/jpg" href="logo.jpg" />
                <link rel="stylesheet" href="styles.css" />
		<style>
			@import url("https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&family=Satisfy&display=swap");
                         @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap");
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
				list-style: none;
				text-decoration: none;
				font-family: "Roboto", sans-serif;
			}

			#content-section {
				margin-left: 15%;
				height: 100vh;
				display: flex;
				flex-direction: column;
			}

			.content {
				height: 100vh;
				padding: 2%;
                                margin-top: -10px;
				display: flex;
				flex-direction: column;
			}

			.content h2 {
				margin: 2vh 0;
			}

			.content form {
				font-family: "Helvetica";
				font-size: large;
                                font-weight: bold;
                                margin-top: -1.5vh;
			}
                        body{
                            overflow-x: hidden;
                            overflow-y: hidden;
                        }

            .content form select {
                font-size: 17px;
                padding: 5px;
                border-radius: 5px;
                background-color: #fff;
                width: fit-content;
            }

			.content form input[type="submit"] {
				border: none;
				outline: none;
				padding: 9px 25px;
				cursor: pointer;
				font-size: medium;
				border-radius: 5px;
				margin-top: 40px;
			}

			.content form input[type="submit"]:hover {
				background-color: #1074d8;
				color: aliceblue;
			}

			table {
				border-collapse: collapse;
				width: 100%;
				margin: auto;
				background-color: #fff;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
				border-radius: 10px;
				overflow: hidden;
				font-size: medium;
			}

			th,
			td {
				padding: 15px;
                                width: fit-content;
				text-align: center;
				border-bottom: 1px solid #ddd;
				border-right: 1px solid #ddd;
			}

			th {
				background-color: rgb(74, 177, 242);
				color: #fff;
			}

			tr:hover {
				background-color: #f5f5f5;
			}

			tr:nth-child(even) {
				background-color: #f2f2f2;
			}
                        
                        .widget-title {
                font-weight: 750;
                font-size: 25px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
                color: white;
            }

            .widget-subtitle {
                margin-top: 15px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
            }
            .title{
                margin-left: 10%;
                margin-top: 2px;
                font-family: sans-serif;
            }
            .tt{
                margin-left: -18%;
            }
            nav ul{
                margin-left: -25px;
            }
		</style>
	</head>
<body>
	<div id="content-section">
            <div class="content" style="background-color: #fff">
                <nav>
			<ul>
                                <li><a href="dashboard.html">Home</a></li>
				<li class="dropdown">
					<a href="#" class="dropbtn">Time Table</a>
					<div class="dropdown-content">
						<a href="classtt.jsp">Class TT</a>
						<a href="teachertt.jsp">Teacher TT</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="#" class="dropbtn">Update TT</a>
					<div class="dropdown-content">
						<a href="clsedit.jsp">Class TT</a>
						<a href="teachedit.jsp">Teacher TT</a>
					</div>
				</li>
				<li class="dropdown">
					<a href="#" class="dropbtn">Substitution</a>
					<div class="dropdown-content">
						<a href="substitution.jsp">Add Substitution</a>
						<a href="subdetails.jsp">Substitution Details</a>
					</div>
				</li>
				<li><a href="index.html">Logout</a></li>
                                <div class="title">
                                <li><h5  class="widget-title">
                        Mahatma Gandhi Centenary Vidyalaya, Trichy - 620017
                    </h5></li>
                                </div>
			</ul>
		</nav>
           <div class="tt">
                &nbsp; &nbsp;
                <h3 style="text-align: center;margin-left: -10%; margin: 1vh 0;margin-top: 1vh;">
                    TEACHER TIME TABLE
                </h3> 
       
    <form action="#" method="get">
        <%
        String teacherqry = "select distinct teachermail from timetable order by 1";
        Vector vteacher = db.getData(teacherqry,100,1);
        int nrt = db.getRows(vteacher);
        int nrc = db.getCols(vteacher);
        
        %>
        <label for="teacher">Select Teacher</label>&nbsp;
        
        <select name="teacher" id="teacher" required>
            <option value="">Select</option>
            <%
                for(int a = 1;a<=nrt*nrc;a+=nrc)
                {   if(!vteacher.get(a).equals("-")) {
                    %>
                    <option value="<%=vteacher.get(a)%>"><%=vteacher.get(a)%></option>
                <%
                } }
                %>
	    
            
        </select>
        &nbsp;
        &nbsp;
        &nbsp;
        &nbsp;&nbsp;
        &nbsp;
        
        <input type="submit" value="Show Timetable" name="submit">
        <%
            String teachername = request.getParameter("teacher");
            if(request.getParameter("submit")!=null)
            {
            %>
    </form><br>

    <h3 style="margin-top: 1vh"><%out.println("Teacher Name: "+teachername);%></h3><br>
    <table style="margin-top: 1vh;">
        <tr>
            <th>DO.</th>
            <th>1<br>(time)</th><th>2<br>(time)</th>
            <th>3<br>(time)</th><th>4<br>(time)</th>
            <th>5<br>(time)</th><th>6<br>(time)</th>
            <th>7<br>(time)</th><th>8<br>(time)</th>  
        </tr>
        <% for(int j=1;j<7;j++) { %>
         <tr>
         <td><% out.println(j); %></td>
            <%
                String period="";
                for(int i=1;i<9;i++) {
                String qry = " select cls,sec from timetable  where teachermail='"+teachername+"' and dayorder="+j+" and period="+i+"";
              //  out.println(qry);
                Vector v = db.getData(stmt,qry,10,1);
                
                if(v.contains("0"))
                    period="-";
                else
                    period = v.get(1)+" - "+(String)v.get(2);
            %>
            <td><%out.println(period);%></td>
            <% } %>
        </tr>
        <% } %>
    </table>
    <% }db.close();%>
   </div>
                </div>
                </body>
</html>
