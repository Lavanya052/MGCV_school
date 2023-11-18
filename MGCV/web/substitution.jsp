<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "substitution";%> 
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
            .content table select {
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
            .content button {
                border: none;
                outline: none;
                padding: 10px 10px;
                cursor: pointer;
                font-size: medium;
                border-radius: 5px;
                margin-top: 40px;
                width: 13%;
                position: center;
                margin-left: 40%;
                background-color: rgb(74, 177, 242);
                color: #fff;
            }
            .content button:hover {
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
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            
            .widget-title {
                font-weight: 900;
                font-size: 30px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
            }

            .widget-subtitle {
                margin-top: 15px;
                font-family: "Poppins", "Helvetica", sans-serif;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <% try { %>
        <div class="wrapper">
            <div class="sidebar">
                <h2>MGCV</h2>
                <ul>
                    <li>
                        <a href="classtt.jsp"><i class="fas classtt"></i>Class TT</a>
                    </li>
                    <li>
                        <a href="teachertt.jsp"><i class="fas teachertt"></i>Teacher</a>
                    </li>
                    <li>
                        <a href="substitution.jsp"><i class="fas substitution"></i>Substitution</a>
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
                <h3 style="text-align: center; margin: 1vh 0">
                    TEACHER SUBSTITUTION
                </h3>
                <form action="substitution.jsp" method="get">
                    <label for="teacher">Select Teacher:</label>
        <select name="teacher" id="teacher">
	    <option value="">Select</option>
            <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option>
            <option value="Karthikeyini A" name="Karthikeyini A">Karthikeyini A</option>
            <option value="Kavitha J" name="Kavitha J">Kavitha J</option>
            <option value="Kumudini S" name="Kumudini S">Kumudini S</option>
            <option value="Manjula" name="Manjula">Manjula</option>
            <option value="Mangayarthilagam R" name="Mangayarthilagam R">Mangayarthilagam R</option>
            <option value="Sangeetha M" name="Sangeetha M">Sangeetha M</option>
            <option value="Saradha K" name="Saradha K">Saradha K</option>
            <option value="Sangeetha S" name="Sangeetha S">Sangeetha S</option>
            <option value="Senbagavalli D" name="Senbagavalli D">Senbagavalli D</option>
            <option value="Suganya S" name="Suganya S">Suganya S</option>
            <option value="Vijayalakshmi R" name="Vijayalakshmi R">Vijayalakshmi R</option>
            <option value="Pavai K" name="Pavai K">Pavai K</option>
            <option value="Amudha" name="Amudha">Amudha</option>
            <option value="Balasubramani D" name="Balasubramani D">Balasubramani D</option>
            <option value="Deepika Jayapalu" name="Deepika Jayapalu">Deepika Jayapalu</option>
            
            
        </select>
                    &nbsp; &nbsp;
                    <label for="dayorder">Select dayorder:</label>
                    <select name="dayorder" id="dayorder">
                        <option value="">Select</option>
                        <option value="1">1</option><option value="2">2</option>
                        <option value="3">3</option><option value="4">4</option>
                        <option value="5">5</option><option value="6">6</option>
                        
                    </select>
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <input type="submit" value="Show Timetable" name="submit" />
                </form>
                <%
                    String teacher = request.getParameter("teacher");
                    String dayorder = request.getParameter("dayorder");
                    if (request.getParameter("submit") != null) {

                %>
                <div style="margin-top: 4vh">
                    <h3 style="margin-bottom: 4vh"><%out.println("Teacher Name: "+teacher);%></h3>
                    <table>
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
                        <tr>
                        <td><%out.println(dayorder);%></td>
            <td>-<br><br><select></select></td>
            <td>10-A<br><br><select name="teacher" id="teacher"><option value="">Select</option>
            <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option></select></td>
            <td>9-B<br><br><select name="teacher" id="teacher"><option value="">Select</option>
            <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option></select></td>
            <td>8-D<br><br><select name="teacher" id="teacher"><option value="">Select</option>
	    <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option></select></td>
            <td>-<br><br><select></select></td>
            <td>-<br><br><select></select></td>
            <td>7-B<br><br><select name="teacher" id="teacher"><option value="">Select</option>
            <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option></select></td>
            <td>10-A<br><br><select name="teacher" id="teacher"><option value="">Select</option>
            <option value="Ambika V K" name="Ambika V K">Ambika V K</option>
            <option value="Ammaponnu P" name="Ammaponnu P">Ammaponnu P</option>
            <option value="Bharanidaran R" name="Bharanidaran R">Bharanidaran R</option>
            <option value="Kalpana T B" name="Kalpana T">Kalpana T B</option></select></td>
                    
                      
                    
                    </tr>
                    </table>
                    <% }
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>
                </div>
                <br><br>
                <button type="submit" name="Change">Save Changes</button>
            </div>
        </div>
    </body>
</html>
