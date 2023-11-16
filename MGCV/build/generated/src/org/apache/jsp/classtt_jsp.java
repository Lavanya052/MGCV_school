package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.lang.*;

public final class classtt_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 String file = "classtt"; 
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
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Timetable</title>\n");
      out.write("    <style>\n");
      out.write("*{\n");
      out.write("  margin: 0;\n");
      out.write("  padding: 0;\n");
      out.write("  box-sizing: border-box;\n");
      out.write("  list-style: none;\n");
      out.write("  text-decoration: none;\n");
      out.write("}\n");
      out.write(".wrapper{\n");
      out.write("  display: flex;\n");
      out.write("  position: relative;\n");
      out.write("}\n");
      out.write(".wrapper .sidebar{\n");
      out.write("  width: 200px;\n");
      out.write("  height: 100%;\n");
      out.write("  background: gray;\n");
      out.write("  padding: 30px 0px;\n");
      out.write("  position: fixed;\n");
      out.write("}\n");
      out.write(".wrapper .sidebar h2{\n");
      out.write("  color: #fff;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  text-align: center;\n");
      out.write("  margin-bottom: 30px;\n");
      out.write("}\n");
      out.write(".wrapper .sidebar ul li{\n");
      out.write("  padding: 15px;\n");
      out.write("  border-bottom: 1px solid #bdb8d7;\n");
      out.write("  border-bottom: 1px solid rgba(0,0,0,0.05);\n");
      out.write("  border-top: 1px solid rgba(255,255,255,0.05);\n");
      out.write("}    \n");
      out.write(".wrapper .sidebar ul li a{\n");
      out.write("  color: white;\n");
      out.write("  display: block;\n");
      out.write("}\n");
      out.write(".wrapper .sidebar ul li a .fas{\n");
      out.write("  width: 25px;\n");
      out.write("}\n");
      out.write(".wrapper .sidebar ul li:hover{\n");
      out.write("  background-color: #594f8d;\n");
      out.write("}\n");
      out.write("    \n");
      out.write(".wrapper .sidebar ul li:hover a{\n");
      out.write("  color: #fff;\n");
      out.write("}\n");
      out.write("        table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        th, td {\n");
      out.write("            border: 1px solid #dddddd;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 8px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        th {\n");
      out.write("        background-color: lightskyblue;\n");
      out.write("        color: #fff;\n");
      out.write("    }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
 try { 
      out.write("\n");
      out.write("<div class=\"wrapper\">\n");
      out.write("    <div class=\"sidebar\">\n");
      out.write("        <h2>Sidebar</h2>\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"classtt.jsp\"><i class=\" fas classtt\"></i>Class TT</a></li>\n");
      out.write("            <li><a href=\"teachertt.jsp\"><i class=\"fas teachertt\"></i>Teacher</a></li>\n");
      out.write("            <li><a href=\"subjecttt.jsp\"><i class=\"fas subjecttt\"></i>Subject</a></li>      \n");
      out.write("        </ul> \n");
      out.write("       \n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("   <div style=\"margin-left:15%;padding:14px 16px;height:100px;\">\n");
      out.write("       <h2 style='text-align:center'>Mahatma Gandhi Centenary Vidyalaya School</h2><br><br>\n");
      out.write("    <h3 style='text-align:center'>TIME TABLE</h3>\n");
      out.write("    <br><br><br>\n");
      out.write("    \n");
      out.write("    &nbsp;\n");
      out.write("    &nbsp;\n");
      out.write("    <form action=\"classtt.jsp\" method=\"get\">\n");
      out.write("        <label for=\"class\">Select Class:</label>\n");
      out.write("        <select name=\"class\" id=\"class\">\n");
      out.write("             <option value=\"\">Select</option>\n");
      out.write("            <option value=\"10\">10</option>\n");
      out.write("            <option value=\"9\">9</option>\n");
      out.write("        </select>\n");
      out.write("    &nbsp;\n");
      out.write("    &nbsp;\n");
      out.write("        <label for=\"section\">Select Section:</label>\n");
      out.write("        <select name=\"section\" id=\"section\">\n");
      out.write("            <option value=\"\">Select</option>\n");
      out.write("            <option value=\"A\">A</option>\n");
      out.write("            <option value=\"B\">B</option>\n");
      out.write("            <option value=\"C\">C</option>\n");
      out.write("        </select>\n");
      out.write("&nbsp;\n");
      out.write("&nbsp;\n");
      out.write("&nbsp;\n");
      out.write("&nbsp;\n");
      out.write("        <input type=\"submit\" value=\"Show Timetable\" name=\"submit\">\n");
      out.write("    </form><br><br>\n");
      out.write("    ");

            String cls = request.getParameter("class");
            String sec = request.getParameter("section");
            if(request.getParameter("submit")!= null)
            {
                    
    
      out.write("\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <th>Day order/period</th>\n");
      out.write("            <th>1<br>(time)</th><th>2<br>(time)</th>\n");
      out.write("            <th>3<br>(time)</th><th>4<br>(time)</th>\n");
      out.write("            <th>5<br>(time)</th><th>6<br>(time)</th>\n");
      out.write("            <th>7<br>(time)</th><th>8<br>(time)</th>  \n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>1</td>");

                     String qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='1'";
                     Vector v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr> \n");
      out.write("        <tr>\n");
      out.write("            <td>2</td>\n");
      out.write("            ");

                     qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='2'";
                     v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr> \n");
      out.write("        <tr>\n");
      out.write("            <td>3</td>\n");
      out.write("            ");

                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='3'";
                    v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr> \n");
      out.write("        <tr>\n");
      out.write("            <td>4</td>\n");
      out.write("            ");

                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='4'";
                    v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr><tr>\n");
      out.write("            <td>5</td>\n");
      out.write("            ");

                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='5'";
                    v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>6</td>\n");
      out.write("            ");

                    qry = "select subcode from timetable where cls='"+cls+"' and sec='"+sec+"' and dayorder='6'";
                    v = db.getData(stmt,qry,10,1);
            
      out.write("\n");
      out.write("            <td>");
      out.print(v.get(1));
      out.write("</td><td>");
      out.print(v.get(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(3));
      out.write("</td><td>");
      out.print(v.get(4));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(5));
      out.write("</td><td>");
      out.print(v.get(6));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(v.get(7));
      out.write("</td><td>");
      out.print(v.get(8));
      out.write("</td>\n");
      out.write("            \n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("            ");
 } 
         }catch(Exception e){System.out.println(e);} 
      out.write("\n");
      out.write("   </div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
