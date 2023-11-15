package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.lang.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/mgcvdb.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
 String file = "login"; 
      out.write(' ');
      out.write('\n');
      MGCVBean.MGCVBean db = null;
      synchronized (_jspx_page_context) {
        db = (MGCVBean.MGCVBean) _jspx_page_context.getAttribute("db", PageContext.PAGE_SCOPE);
        if (db == null){
          db = new MGCVBean.MGCVBean();
          _jspx_page_context.setAttribute("db", db, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');
 
   java.sql.Connection con=null; 
   java.sql.Statement stmt=null;
   //db.setLog(file+".log");
   boolean oks = db.isDbcon();
   if(!oks)
   {
       session.putValue("mes",db.getErr()+" - Database error....");

      out.write('\n');
      out.write('	');
      if (true) {
        _jspx_page_context.forward("error.jsp");
        return;
      }
      out.write('\n');
	   
   }
   con=db.getCon();
   con.setAutoCommit(false);
   stmt=con.createStatement();
   if(stmt==null)
   {
       session.putValue("mes",db.getErr()+" - Database error");

      out.write('\n');
      if (true) {
        _jspx_page_context.forward("error.jsp");
        return;
      }
      out.write('\n');

   } 

      out.write('\n');
      out.write('\n');

    String username = request.getParameter("name");
    String psw = request.getParameter("psw");
    
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta charset=\"UTF-8\" />\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("\t\t<title>Login</title>\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<span class=\"bg-filter\"></span>\n");
      out.write("\t\t\t<span class=\"bg-filter\"></span>\n");
      out.write("\t\t\t<span class=\"bg-filter\"></span>\n");
      out.write("\t\t\t<form action=\"login.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t<h2>Login</h2>\n");
      out.write("\t\t\t\t<div class=\"inputBox\">\n");
      out.write("\t\t\t\t\t<input type=\"text\" name=\"name\" required />\n");
      out.write("\t\t\t\t\t<span>UserName</span>\n");
      out.write("\t\t\t\t\t<i></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"inputBox\">\n");
      out.write("\t\t\t\t\t<input type=\"password\" name=\"psw\" required />\n");
      out.write("\t\t\t\t\t<span>Password</span>\n");
      out.write("\t\t\t\t\t<i></i>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("                \n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"Login\" />\n");
      out.write("\t\t\t</form>\n");
      out.write("                        ");
String qry = "select * from login";
    Vector v = db.getData(stmt,qry,10,1);
    int nr = db.getRows(v);
    int nc = db.getCols(v);
    int flag=0;
    for(int i=0;i<nr*nc;i+=nc)
    {
        String name = (String)v.get(i);
        String pass = (String)v.get(i+1);
        if(username.equals(name) && psw.equals(pass))
        {
            flag = 1;
            break;
        }
    }
    if(flag==1)
        out.println("Login Successful as "+username);
    else
        out.println("Login Failure");
    db.close();

      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
