package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.text.*;
import java.lang.*;

public final class subdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 String file = "subdetails";
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\" />\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n");
      out.write("        <title>Timetable</title>\n");
      out.write("        <link rel=\"icon\" type=\"image/jpg\" href=\"logo.jpg\" />\n");
      out.write("        <style>\n");
      out.write("            @import url(\"https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&family=Satisfy&display=swap\");\n");
      out.write("            @import url(\"https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap\");\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                list-style: none;\n");
      out.write("                text-decoration: none;\n");
      out.write("                font-family: \"Roboto\", sans-serif;\n");
      out.write("            }\n");
      out.write("            .wrapper {\n");
      out.write("                display: flex;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .wrapper .sidebar {\n");
      out.write("                width: 200px;\n");
      out.write("                height: 100%;\n");
      out.write("                background-image: url(\"logo.jpg\");\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-size: cover;\n");
      out.write("                background-color: rgba(255, 255, 255, 0.15);\n");
      out.write("                padding: 30px 0px;\n");
      out.write("                position: fixed;\n");
      out.write("            }\n");
      out.write("            .wrapper .sidebar h2 {\n");
      out.write("                font-size: x-large;\n");
      out.write("                text-transform: uppercase;\n");
      out.write("                text-align: center;\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("            }\n");
      out.write("            .wrapper .sidebar ul li {\n");
      out.write("                padding: 15px;\n");
      out.write("                border-bottom: 1px solid #bdb8d7;\n");
      out.write("                border-bottom: 1px solid rgba(0, 0, 0, 0.05);\n");
      out.write("                border-top: 1px solid rgba(255, 255, 255, 0.05);\n");
      out.write("            }\n");
      out.write("            .wrapper .sidebar ul li a {\n");
      out.write("                color: #000;\n");
      out.write("                font-size: large;\n");
      out.write("                display: block;\n");
      out.write("            }\n");
      out.write("            .wrapper .sidebar ul li a .fas {\n");
      out.write("                width: 25px;\n");
      out.write("            }\n");
      out.write("            .wrapper .sidebar ul li:hover {\n");
      out.write("                background-color: #4ab1f2;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .wrapper .sidebar ul li:hover a {\n");
      out.write("                color: #fff;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #content-section {\n");
      out.write("                margin-left: 13%;\n");
      out.write("                height: 100vh;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content {\n");
      out.write("                height: 100vh;\n");
      out.write("                padding: 2%;\n");
      out.write("                margin-top: -10px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content h2 {\n");
      out.write("                margin: 2vh 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content form {\n");
      out.write("                font-family: \"Helvetica\";\n");
      out.write("                font-size: large;\n");
      out.write("                font-weight: bold;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content form select {\n");
      out.write("                font-size: large;\n");
      out.write("                padding: 5px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                background-color: #fff;\n");
      out.write("                width: fit-content;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content form input[type=\"submit\"] {\n");
      out.write("                border: none;\n");
      out.write("                outline: none;\n");
      out.write("                padding: 9px 25px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-size: medium;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-top: 40px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content form input[type=\"submit\"]:hover {\n");
      out.write("                background-color: #1074d8;\n");
      out.write("                color: aliceblue;\n");
      out.write("            }\n");
      out.write("            .content form input[type=\"date\"] {\n");
      out.write("                border: 1px solid black;\n");
      out.write("                outline: none;\n");
      out.write("                padding: 6px 20px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                font-size: medium;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-top: 40px;\n");
      out.write("            }\n");
      out.write("            table {\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                width: 100%;\n");
      out.write("                margin: auto;\n");
      out.write("                background-color: #fff;\n");
      out.write("                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n");
      out.write("                border-radius: 10px;\n");
      out.write("                overflow: hidden;\n");
      out.write("                font-size: large;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th,\n");
      out.write("            td {\n");
      out.write("                padding: 15px;\n");
      out.write("                text-align: center;\n");
      out.write("                border-bottom: 1px solid #ddd;\n");
      out.write("                border-right: 1px solid #ddd;\n");
      out.write("            }\n");
      out.write("             \n");
      out.write("            th {\n");
      out.write("                background-color: rgb(74, 177, 242);\n");
      out.write("                color: #fff;\n");
      out.write("                position: sticky;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            tr:hover {\n");
      out.write("                background-color: #f5f5f5;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            tr:nth-child(even) {\n");
      out.write("                background-color: #f2f2f2;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .widget-title {\n");
      out.write("                font-weight: 750;\n");
      out.write("                font-size: 30px;\n");
      out.write("                font-family: \"Poppins\", \"Helvetica\", sans-serif;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .widget-subtitle {\n");
      out.write("                margin-top: 15px;\n");
      out.write("                font-family: \"Poppins\", \"Helvetica\", sans-serif;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            .sidebar h2{\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
 try { 
      out.write("\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div class=\"sidebar\">\n");
      out.write("                <h2><a href=\"dashboard.html\">MGCV</a></h2>\n");
      out.write("                <ul>\n");
      out.write("                    <li>\n");
      out.write("\t\t\t<a href=\"classtt.jsp\"><i class=\"fas classtt\"></i>Class TT</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("\t\t\t<a href=\"teachertt.jsp\"><i class=\"fas teachertt\"></i>Teacher TT</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"substitution.jsp\"><i class=\"fas substitution\"></i>Substitution</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"subdetails.jsp\"><i class=\"fas subdetails\"></i>Substitution Details</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"index.html\"><i class=\"fas index\"></i>Logout</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div id=\"content-section\">\n");
      out.write("            <div class=\"content\" style=\"background-color: #fff\">\n");
      out.write("                <div class=\"mb70 mb-xs-40 text-center\">\n");
      out.write("                    <h5 style=\"color: #1e73be !important\" class=\"widget-title\">\n");
      out.write("                        Mahatma Gandhi Centenary Vidyalaya\n");
      out.write("                    </h5>\n");
      out.write("                    <div\n");
      out.write("                        style=\"color: #000000 !important\"\n");
      out.write("                        class=\"widget-subtitle\"\n");
      out.write("                        >\n");
      out.write("                        No.35,Tennur High Road,Tiruchirappali - 620017,Phone :\n");
      out.write("                        0431 - 2792666,Email ID : office@mgcvschool.ac.in\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                &nbsp; &nbsp;\n");
      out.write("                <h3 style=\"text-align: center; margin: 1vh 0;margin-top: 3vh;\">\n");
      out.write("                    SUBSTITUTION DETAILS\n");
      out.write("                </h3>\n");
      out.write("                <form action=\"subdetails.jsp\" method=\"get\">\n");
      out.write("                    <label for=\"date\">Select Date</label>&nbsp;\n");
      out.write("                    <input type=\"date\" name=\"date\" required />\n");
      out.write("                    &nbsp; &nbsp; &nbsp; &nbsp;\n");
      out.write("                    <input type=\"submit\" value=\"Get Details\" name=\"submit\" />\n");
      out.write("                </form>\n");
      out.write("                ");

                    String date = request.getParameter("date");
                    if (request.getParameter("submit") != null) {


      out.write(" <br>\n");
      out.write("                <h3 style=\"margin-top: 1.5vh;\">");
out.println("Date: " + date);
      out.write("</h3>\n");
      out.write("                <div style=\"margin-top: 4.5vh;overflow-y: auto; height: 500px;\">\n");
      out.write("                    ");

                                String qry = "select * from subtt where dat='"+date+"'";
                                Vector v = db.getData(stmt,qry,100,1);
                                if(v.isEmpty()) {
                                    
      out.write("<h1>No Records Found</h1>");

                                }
                                else {
                         
      out.write("\n");
      out.write("                    <table>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>S.No.</th>\n");
      out.write("                            <th>Date</th>\n");
      out.write("                            <th>DO.</th>\n");
      out.write("                            <th>Period</th>\n");
      out.write("                            <th>Class</th>\n");
      out.write("                            <th>Section</th>\n");
      out.write("                            <th>Actual Staff</th>\n");
      out.write("                            <th>Substituted Staff</th>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 int sno=1;
      out.write("\n");
      out.write("                            ");

                                int nr = db.getRows(v);
                                int nc = db.getCols(v); 
                                for(int i=1;i<=nc*nr;i+=nc)
                                { 
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>");
out.print(sno++);
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+1));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+2));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+3));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+4));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+5));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(v.get(i+6));
      out.write("</td>\n");
      out.write("                                </tr>  \n");
      out.write("                                ");
       }
                                
      out.write("           \n");
      out.write("        </table>\n");
      out.write("                    ");
 }
}
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
