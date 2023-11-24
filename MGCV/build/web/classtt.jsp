<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "classtt";%> 
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
                margin-top: -10px;
                height: 100vh;
                padding: 2%;
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
                margin-top: -3vh;
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

            table {
                border-collapse: collapse;
                width: 105%;
                margin: auto;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                font-size: medium;
            }

            th,
            td {
                padding: 10px;
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
                <h3 style="text-align: center; margin: 1vh 0;margin-top: 1vh;">
                    CLASS TIME TABLE
                </h3>
                <form action="classtt.jsp" method="get">
                    <label for="class">Select Class</label>&nbsp;
                    <select name="class" id="class" required>
                        <option value="">Select</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                    &nbsp; &nbsp;
                    <label for="section">Select Section</label>&nbsp;
                    <select name="section" id="section" required>
                        <option value="">Select</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                    </select>
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <input type="submit" value="Show Timetable" name="submit" />
                </form>
                <%
                    String cls = request.getParameter("class");
                    String sec = request.getParameter("section");
                    if (request.getParameter("submit") != null) {

                %>
                <div style="margin-top: 2vh">
                    <h3 style="margin-bottom: 4vh"><%out.println("Class: " + cls + " - " + sec);%></h3>
                    <table style="margin-top: -2vh">
                        <tr>
                            <th>DO.</th>
                            <th>1<br />(time)</th>
                            <th>2<br />(time)</th>
                            <th>3<br />(time)</th>
                            <th>4<br />(time)</th>
                            <th>5<br />(time)</th>
                            <th>6<br />(time)</th>
                            <th>7<br />(time)</th>
                            <th>8<br />(time)</th>
                        </tr>
                        <% for(int j=1;j<7;j++) { %>
                        <tr>
                        <td><% out.println(j); %></td>
                  <%
                for(int i=1;i<9;i++) {
                String qry = "select subcode from timetable where cls='" + cls + "' and sec='" + sec + "' and dayorder="+j+"";
                Vector v = db.getData(stmt, qry, 8, 1);
                qry = "select teachername from timetable join teacher1 on timetable.teachermail=teacher1.teachermail where cls='" + cls + "' and sec='" + sec + "' and dayorder="+j+"order by period";
                Vector vec = db.getData(stmt,qry,8,1);
             %>
             <td><p style="font-size: 16px;"><%=v.get(i)%></p><p style=" font-weight: bold;font-size: 14px;margin-top: 1vh;"><%=vec.get(i)%></p></td>
            <% } %>
        </tr>
        <% } %>
                        
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