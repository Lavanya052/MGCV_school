package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import java.text.*;
import java.lang.*;

public final class sub_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 String file = "subd";
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

    try{
                    Vector<Integer> cls = new Vector<Integer>();
                    Vector<String> sec = new Vector<String>();
                    Vector<Integer> period = new Vector<Integer>();
                    String date = (String)session.getAttribute("date");
                    String actual = (String)session.getAttribute("actual");
                    String[] sub = request.getParameterValues("sub");
                    int dayorder = Integer.parseInt((String)session.getAttribute("dayorder"));
                    String qry = "select cls,sec,period from timetable join teacher on teacher.teachermail=timetable.teachermail where teachername='"+actual+"' and dayorder="+dayorder+" order by period";
                    ResultSet rs = stmt.executeQuery(qry);
                    while(rs.next()) {
                        cls.add(rs.getInt(1));
                        sec.add(rs.getString(2));
                        period.add(rs.getInt(3));
                    } 
                    for(int i=0,j=0;j<sub.length;i++,j++) {
                     qry = "INSERT INTO subtt VALUES ('" + date + "', " + dayorder + ", " + period.get(i) + ", " + cls.get(i) + ", '" + sec.get(i) + "', '" + actual + "', '" + sub[j] + "')";
                     int n = stmt.executeUpdate(qry);
                      con.commit();
                     if (n > 0) { 
      out.write("\n");
      out.write("                        <script type=\"text/javascript\">\n");
      out.write("              alert(\"Saves Changed Successfully!!!\");\n");
      out.write("             window.location.href = \"substitution.jsp\";\n");
      out.write("        </script>\n");
      out.write("               ");
 } else {
                          
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert(\"Error Occured. Please try again.\");\n");
      out.write("            window.location.href = \"substitution.jsp\";\n");
      out.write("        </script>\n");

                }
                     
                    }
                   
                   }catch(Exception e){}

      out.write('\n');
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
