<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "classtt"; %> 
<%@ include file="mgcvdb.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timetable</title>
    <style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
}
.wrapper{
  display: flex;
  position: relative;
}
.wrapper .sidebar{
  width: 200px;
  height: 100%;
  background: gray;
  padding: 30px 0px;
  position: fixed;
}
.wrapper .sidebar h2{
  color: #fff;
  text-transform: uppercase;
  text-align: center;
  margin-bottom: 30px;
}
.wrapper .sidebar ul li{
  padding: 15px;
  border-bottom: 1px solid #bdb8d7;
  border-bottom: 1px solid rgba(0,0,0,0.05);
  border-top: 1px solid rgba(255,255,255,0.05);
}    
.wrapper .sidebar ul li a{
  color: white;
  display: block;
}
.wrapper .sidebar ul li a .fas{
  width: 25px;
}
.wrapper .sidebar ul li:hover{
  background-color: #594f8d;
}
    
.wrapper .sidebar ul li:hover a{
  color: #fff;
}
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: center;
            padding: 8px;
        }

        th {
        background-color: lightskyblue;
        color: #fff;
    }
    </style>
</head>
<body>
    <% try { %>
<div class="wrapper">
    <div class="sidebar">
        <h2>Sidebar</h2>
        <ul>
            <li><a href="classtt.jsp"><i class=" fas classtt"></i>Class TT</a></li>
            <li><a href="teachertt.jsp"><i class="fas teachertt"></i>Teacher</a></li>   
        </ul> 
       
    </div>
</div>
   <div style="margin-left:15%;padding:14px 16px;height:100px;">
       <h2 style='text-align:center'>Mahatma Gandhi Centenary Vidyalaya</h2><br><br>
    <h3 style='text-align:center'>CLASS TIME TABLE</h3>
    <br><br><br>
    
    &nbsp;
    &nbsp;
    <form action="classtt.jsp" method="get">
        <label for="class">Select Class:</label>
        <select name="class" id="class">
             <option value="">Select</option>
            <option value="9">9</option>
            <option value="10">10</option>
        </select>
    &nbsp;
    &nbsp;
        <label for="section">Select Section:</label>
        <select name="section" id="section">
            <option value="">Select</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
        </select>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
        <input type="submit" value="Show Timetable" name="submit">
    </form><br><br>
    <%
            String cls = request.getParameter("class");
            String sec = request.getParameter("section");
            if(request.getParameter("submit")!= null)
            {
                    
    %>
    <table>
        <tr>
            <th>Day order/period</th>
            <th>1<br>(time)</th><th>2<br>(time)</th>
            <th>3<br>(time)</th><th>4<br>(time)</th>
            <th>5<br>(time)</th><th>6<br>(time)</th>
            <th>7<br>(time)</th><th>8<br>(time)</th>  
        </tr>
        <tr>
            <td>1</td><%
                     String qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='1'";
                     Vector v = db.getData(stmt,qry,8,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr> 
        <tr>
            <td>2</td>
            <%
                     qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='2'";
                     v = db.getData(stmt,qry,8,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr> 
        <tr>
            <td>3</td>
            <%
                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='3'";
                    v = db.getData(stmt,qry,8,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr> 
        <tr>
            <td>4</td>
            <%
                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='4'";
                    v = db.getData(stmt,qry,8,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr><tr>
            <td>5</td>
            <%
                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='5'";
                    v = db.getData(stmt,qry,8,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr>
        <tr>
            <td>6</td>
            <%
                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='6'";
                    v = db.getData(stmt,qry,10,1);
            %>
            <td><%=v.get(1)%></td><td><%=v.get(2)%></td>
            <td><%=v.get(3)%></td><td><%=v.get(4)%></td>
            <td><%=v.get(5)%></td><td><%=v.get(6)%></td>
            <td><%=v.get(7)%></td><td><%=v.get(8)%></td>
            
        </tr>
    </table>
            <% } 
         }catch(Exception e){System.out.println(e);} %>
   </div>
</body>
</html>
