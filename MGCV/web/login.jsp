<%@ page import="java.util.*,java.io.*,java.sql.*,java.lang.*" %>
<% String file = "login"; %> 
<%@ include file="mgcvdb.jsp"%>
<%
    String username = request.getParameter("name");
    String psw = request.getParameter("psw");
    String qry ="SELECT * FROM login WHERE username='" + username + "' AND password='" + psw + "'";
    Vector v = db.getData(stmt,qry,10,1);
    String name = (String)v.get(1);
    String pass = (String)v.get(2);

     if(username.equals(name) && psw.equals(pass))
        {
            out.println("login Successful");
        }
        else
             out.println("login failure");
     
    db.close();
%>