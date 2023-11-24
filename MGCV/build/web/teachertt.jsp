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
                                margin-top: -1.5vh;
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
                    TEACHER TIME TABLE
                </h3>
        
    <form action="#" method="get">
        
        <label for="teacher">Select Teacher</label>&nbsp;
        <select name="teacher" id="teacher" required>
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
                String qry = " select cls,sec from timetable join teacher on teacher.teachermail=timetable.teachermail where teachername='"+teachername+"' and dayorder="+j+" and period="+i+"";
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
    <% }%>
   </div>
                </div>
                </body>
</html>
