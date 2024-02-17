<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "clseditt";%> 
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
                overflow-y: hidden;
                overflow-x: hidden;
            }
            #content-section {
                margin-left: 15%;
                height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .content {
                margin-top: -10px;
                height: 105vh;
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
            #but {
                border: none;
                outline: none;
                padding: 10px 10px;
                cursor: pointer;
                font-size: medium;
                border-radius: 5px;
                margin-top: 25px;
                width: 11%;
                position: center;
                margin-left: 43%;
                background-color: rgb(74, 177, 242);
                color: #fff;
            }
            #but:hover {
                background-color: #1074d8;
                color: aliceblue;
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
                padding: 10px;
                height: 52px;
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
                    EDIT CLASS TIME TABLE
                </h3> 
        
                <form action="clsedit.jsp" method="get">
                    <label for="class">Select Class</label>&nbsp;
                    <select name="class" id="class" required>
                        <option value="">Select</option>
                        <option value="10">10</option>
                        <option value="9">9</option>
                        <option value="8">8</option>
                        <option value="7">7</option>
                        <option value="6">6</option>
                        <option value="5">5</option>
                        <option value="4">4</option>
                        <option value="3">3</option>
                        <option value="2">2</option>
                        <option value="1">1</option>
                    </select>
                    &nbsp; &nbsp;
                    <label for="section">Select Section</label>&nbsp;
                    <select name="section" id="section" required>
                        <option value="">Select</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="E">E</option>
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
                String qry = "select subcode from timetable where cls='" + cls + "' and sec='" + sec + "' and dayorder="+j+" and period = "+ i +" order by period";
                Vector v = db.getData(stmt, qry, 8, 1);
                   qry = "select distinct subcode from timetable where cls='" + cls + "' and sec='" + sec+"'";
                   Vector vec = db.getData(stmt,qry,20,1);
                   int r = db.getRows(vec);
                   int c = db.getCols(vec);
                   %>
                    <form action="clschange.jsp" method="post">
                   <td>
                      
                       <select style="ont-size: large;padding: 5px;border-radius: 5px;ackground-color: #fff;width: fit-content;" name="edit" id="edit" required>
                       <%
                           if(v.get(1).equals("0")) {
                   %>
                        <option value="-">-</option>
                        <% }else{ %>
                        <option value="<%=v.get(1)%>"><%=v.get(1)%></option>
                      <% } for(int h=1;h<=r*c;h++)
                        { if(!v.get(1).equals(vec.get(h))) {
                      %>
                            
                      <option value="<%=vec.get(h)%>"><%=vec.get(h)%></option>
                            <% } }  %>
                           </select></td>
                   
                  <%
               // qry = "select teachername from timetable join teacher1 on timetable.teachermail=teacher1.teachermail where cls='" + cls + "' and sec='" + sec + "' and dayorder="+j+" AND PERIOD = "+ i +"order by period";
               // out.println(qry);
                //Vector vec = db.getData(stmt,qry,8,1);
               
             }}

             session.setAttribute("cls",cls);
             session.setAttribute("sec",sec);
             

             
               %>
        </tr>
        
              
        </table>
                    
                    
                </div>
                <button id="but" type="submit" name="Change">Save Changes</button> 
                 <% } %>    
                 <% 
                        } catch (Exception e) {
                            System.out.println(e);
                        }

                db.close();
                    %>
                    </form>
            </div>
        </div>
    </body>
</html>