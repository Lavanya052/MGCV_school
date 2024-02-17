<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*,java.lang.*" %>
<% String file = "subdetails";%> 
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
            body{
              overflow-x: hidden;
              overflow-y: hidden;
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
            }

            .content form select {
                font-size: large;
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
            .content form input[type="date"] {
                border: 1px solid black;
                outline: none;
                padding: 6px 20px;
                cursor: pointer;
                font-size: medium;
                border-radius: 5px;
                margin-top: 40px;
            }
            table {
                border-collapse: collapse;
                width: 100%;
                margin: auto;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                font-size: large;
            }

            th,
            td {
                padding: 15px;
                text-align: center;
                border-bottom: 1px solid #ddd;
                border-right: 1px solid #ddd;
            }
             
            th {
                background-color: rgb(74, 177, 242);
                color: #fff;
                position: sticky;
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
        <% try { %>
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
                    SUBSTITUTION DETAILS
                </h3> 
        
                <form action="subdetails.jsp" method="get">
                    <label for="date">Select Date</label>&nbsp;
                    <input type="date" name="date" required />
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <input type="submit" value="Get Details" name="submit" />
                </form>
                <%
                    String date = request.getParameter("date");
                    if (request.getParameter("submit") != null) {

%> <br>
                <h3 style="margin-top: 1.5vh;"><%out.println("Date: " + date);%></h3>
                <div style="margin-top: 4.5vh;overflow-y: auto; height: 500px;">
                    <table>
                        <tr>
                            <th>S.No.</th>
                            <th>Date</th>
                            <th>DO.</th>
                            <th>Period</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Actual Staff</th>
                            <th>Substituted Staff</th>
                        </tr>
                        <% int sno=1;%>
                            <%
                                String qry = "select * from subtt where day='"+date+"'";
                                Vector v = db.getData(stmt,qry,100,1);
                                db.close();
                                int nr = db.getRows(v);
                                int nc = db.getCols(v); 
                                for(int i=1;i<=nc*nr;i+=nc)
                                { %>
                                <tr>
                                    <td><%out.print(sno++);%></td>
                                    <td><%=v.get(i)%></td>
                                    <td><%=v.get(i+1)%></td>
                                    <td><%=v.get(i+2)%></td>
                                    <td><%=v.get(i+3)%></td>
                                    <td><%=v.get(i+4)%></td>
                                    <td><%=v.get(i+5)%></td>
                                    <td><%=v.get(i+6)%></td>
                                </tr>  
                                <%       }
                                %>           
        </table>
                    <% }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>