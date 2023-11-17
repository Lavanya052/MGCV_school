<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "login"; %> 
<%@ include file="mgcvdb.jsp"%>
<%
    String username = request.getParameter("name");
    String psw = request.getParameter("psw");
    String qry ="SELECT * FROM login WHERE username='" + username + "' AND password='" + psw + "'";
    Vector v = db.getData(stmt,qry,100,1);
    if(v.contains(username) && v.contains(psw)) {
    String name = (String)v.get(1);
    String pass = (String)v.get(2);

     if(username.equals(name) && psw.equals(pass))
        {
            String targetURL = "dashboard.html";
            response.sendRedirect(targetURL);
        }
    }
     else {
        
             %>
        <script type="text/javascript">
            alert("Login Failure. Please try again.");
            window.location.href = "index.html";
        </script>
<%
     }
    db.close();
%>