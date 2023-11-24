<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*,java.lang.*" %>
<% String file = "subd";%> 
<%@ include file="mgcvdb.jsp"%>
<%
    try{
                    Vector<Integer> cls = new Vector<Integer>();
                    Vector<String> sec = new Vector<String>();
                    Vector<Integer> period = new Vector<Integer>();
                    String date = (String)session.getAttribute("date");
                    String actual = (String)session.getAttribute("actual");
                    int dayorder = Integer.parseInt((String)session.getAttribute("dayorder"));
                    String[] sub = request.getParameterValues("sub");
                    //String qry = "select teachername from timetable join teacher on teacher.teachermail=timetable.teachermail where teachername='"+actual+"' and dayorder="+dayorder+" order by period";
                    //Vector v = db.getData(stmt,qry,10,1);
                    if(!(Arrays.asList(sub).contains(""))) {
                    String qry = "select cls,sec,period from timetable join teacher on teacher.teachermail=timetable.teachermail where teachername='"+actual+"' and dayorder="+dayorder+" order by period";
                    ResultSet rs = stmt.executeQuery(qry);
                    while(rs.next()) {
                        cls.add(rs.getInt(1));
                        sec.add(rs.getString(2));
                        period.add(rs.getInt(3));
                    } 
                    int n = 0;
                    for(int i=0,j=0;j<sub.length;i++,j++) {
                     qry = "INSERT INTO subtt VALUES ('" + date + "', " + dayorder + ", " + period.get(i) + ", " + cls.get(i) + ", '" + sec.get(i) + "', '" + actual + "', '" + sub[j] + "')";
                     n = stmt.executeUpdate(qry);
                    }
                      con.commit();
                     if (n > 0) {
                        String targetURL = "subdetails.jsp";
                        response.sendRedirect(targetURL);
                }
                     else
                     {
                         %>
        <script type="text/javascript">
            alert("Error Occured. Please try again.");
            window.location.href = "substitution.jsp";
        </script>
<%
                     }
                    }
else
{
     %>
        <script type="text/javascript">
            alert("No Values Selected. Please try again.");
            window.location.href = "substitution.jsp";
        </script>
<%
}
                     
  
                   
                   }catch(Exception e){}
%>
