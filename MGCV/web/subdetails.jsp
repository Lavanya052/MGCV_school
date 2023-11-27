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
            .wrapper {
                display: flex;
                position: relative;
            }

            .wrapper .sidebar {
                width: 200px;
                height: 100%;
                background-image: url("logo.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-color: rgba(255, 255, 255, 0.15);
                padding: 30px 0px;
                position: fixed;
            }
            .wrapper .sidebar h2 {
                font-size: x-large;
                text-transform: uppercase;
                text-align: center;
                margin-bottom: 30px;
            }
            .wrapper .sidebar ul li {
                padding: 15px;
                border-bottom: 1px solid #bdb8d7;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                border-top: 1px solid rgba(255, 255, 255, 0.05);
            }
            .wrapper .sidebar ul li a {
                color: #000;
                font-size: large;
                display: block;
            }
            .wrapper .sidebar ul li a .fas {
                width: 25px;
            }
            .wrapper .sidebar ul li:hover {
                background-color: #4ab1f2;
            }

            .wrapper .sidebar ul li:hover a {
                color: #fff;
            }

            #content-section {
                margin-left: 13%;
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
                font-size: 30px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
            }

            .widget-subtitle {
                margin-top: 15px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
            }
            .sidebar h2{
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <% try { %>
        <div class="wrapper">
            <div class="sidebar">
                <h2><a href="dashboard.html">MGCV</a></h2>
                <ul>
                    <li>
			<a href="classtt.jsp"><i class="fas classtt"></i>Class TT</a>
                    </li>
                    <li>
			<a href="teachertt.jsp"><i class="fas teachertt"></i>Teacher TT</a>
                    </li>
                    <li>
                        <a href="substitution.jsp"><i class="fas substitution"></i>Substitution</a>
                    </li>
                    <li>
                        <a href="subdetails.jsp"><i class="fas subdetails"></i>Substitution Details</a>
                    </li>
                    <li>
                        <a href="index.html"><i class="fas index"></i>Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <div id="content-section">
            <div class="content" style="background-color: #fff">
                <div class="mb70 mb-xs-40 text-center">
                    <h5 style="color: #1e73be !important" class="widget-title">
                        Mahatma Gandhi Centenary Vidyalaya
                    </h5>
                    <div
                        style="color: #000000 !important"
                        class="widget-subtitle"
                        >
                        No.35,Tennur High Road,Tiruchirappali - 620017,Phone :
                        0431 - 2792666,Email ID : office@mgcvschool.ac.in
                    </div>
                </div>
                &nbsp; &nbsp;
                <h3 style="text-align: center; margin: 1vh 0;margin-top: 3vh;">
                    SUBSTITUTION DETAILS
                </h3>
                <form action="subdetails.jsp" method="get">
                    <label for="date">Select Date</label>&nbsp;
                    <input type="date" id="date" name="date" value="" required> 
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
                            <th>Day</th>
                            <th>Period</th>
                            <th>Class</th>
                            <th>Section</th>
                            <th>Actual Staff</th>
                            <th>Substituted Staff</th>
                        </tr>
                        <% int sno=1;%>
                            <%
                                String qry = "select * from subtt where dat='"+date+"'";
                                Vector v = db.getData(stmt,qry,100,1);
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
    <script>var today = new Date(); 
var dd = String(today.getDate()).padStart(2, '0'); 
var mm = String(today.getMonth() + 1).padStart(2, '0'); 
var yyyy = today.getFullYear(); 
 
today = yyyy + '-' + mm + '-' + dd; 
document.getElementById('date').value = today;  </script>
</body>
</html>