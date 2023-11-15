package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.lang.*;

public final class namelist_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<title>name list display</title>\n");
      out.write("\t\t<meta\n");
      out.write("\t\t\thttp-equiv=\"Content-Type\"   \n");
      out.write("\t\t\tcontent=\"text/html; charset=iso-8859-1\"\n");
      out.write("\t\t/>\n");
      out.write("\t\t<link href=\"fontstyle.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\t\t<script></script>\n");
      out.write("\t\t<style>\n");
      out.write("\t\t\ttable tr td {\n");
      out.write("\t\t\t\tborder: 2px solid green;\n");
      out.write("\t\t\t\tbackground: cyan;\n");
      out.write("\t\t\t\tfont-size: 150%;\n");
      out.write("\t\t\t\tpadding: 2px;\n");
      out.write("\t\t\t\tmargin: auto;\n");
      out.write("\t\t\t\twidth: 70%;\n");
      out.write("\t\t\t}\n");
      out.write("\t\t</style>\n");
      out.write("\t</head>\n");
      out.write("\n");
      out.write("\t<body>\n");
      out.write("\t\t");
 String file = "namelist"; 
      out.write(" \n");
      out.write("                ");
      MGCVBean.MGCVBean db = null;
      synchronized (_jspx_page_context) {
        db = (MGCVBean.MGCVBean) _jspx_page_context.getAttribute("db", PageContext.PAGE_SCOPE);
        if (db == null){
          db = new MGCVBean.MGCVBean();
          _jspx_page_context.setAttribute("db", db, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\n');
 
   Connection con=null; 
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
      out.write("\t\t");
 int sno=1; 
		
                String query = "select * from teacher"; 
                Vector v =db.getData(stmt,query,500,1);
                int nr = db.getRows(v);// 
                int nc =db.getCols(v);//3 
db.close(); 
                
      out.write("\n");
      out.write("\n");
      out.write("\t\t<table>\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>s.no</td>\n");
      out.write("\t\t\t\t<td>Teachername</td>\n");
      out.write("                                <td>Dept</td>\n");
      out.write("\t\t\t\t<td>teachermail</td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t");
 
                            for(int i = 1;i<=nr*nc;i+=nc) 
                            {
                                
      out.write("\n");
      out.write("\t\t\t<tr>\n");
      out.write("\t\t\t\t<td>");
      out.print(sno++);
      out.write("</td>\n");
      out.write("\t\t\t\t<td>");
      out.print(v.get(i));
      out.write("</td>\n");
      out.write("\t\t\t\t<td>");
      out.print(v.get(i+1));
      out.write("</td>\n");
      out.write("                                <td>");
      out.print(v.get(i+2));
      out.write("</td>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</tr>\n");
      out.write("\t\t\t");
 } 
      out.write("\n");
      out.write("\t\t</table>\n");
      out.write("\t</body>\n");
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
