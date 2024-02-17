<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*,java.lang.*" %>
<% String file = "teachchange";%> 
<%@ include file="mgcvdb.jsp"%>
<% try{
        String name = (String)session.getAttribute("teachername");
        String edit[] = request.getParameterValues("edit");
        int key=0;
        String cls="",sec="",qry="";
        for(int i=1;i<7;i++)
        {
            for(int j=1;j<9;j++)
            {
                if(edit[key].equals("-"))
                {
                    qry = "select * from timetable where teachermail='"+name+"' and dayorder="+i+" and period="+j+"";
                    ResultSet rs = stmt.executeQuery(qry);
                    if(rs.next())
                    {
                        qry = "update timetable set teachermail='-',subcode='-' where dayorder="+i+" and period="+j+"";
                        stmt.executeUpdate(qry);
                    }
                }
                else {
                    if(edit[key].length()==5)
                    {
                        cls = edit[key].substring(0,1);
                        sec = edit[key].substring(4,5);
                    } 
                    else if(edit[key].length()==6)
                    {
                        cls = edit[key].substring(0,2);
                        sec = edit[key].substring(5,6);
                    }   
                String query = "select distinct subcode from timetable where cls="+cls+" and sec='"+sec+"' and teachermail='"+name+"'";
                Vector v = db.getData(stmt,query,10,1);
                qry = "update timetable set teachermail='"+name+"' ,subcode='"+v.get(1) +"' where cls="+cls+"and sec='"+sec+"' and dayorder="+i+"and period="+j+"";
                int n = stmt.executeUpdate(qry); 
                if(n>0)
                { %>
                    <script type="text/javascript">
                    alert("Changes Saved Successfully!!!");
                    window.location.href = "clsedit.jsp";
                    </script>
                <%       
                }
                else {
                %>
        <script type="text/javascript">
            alert("Something went Wrong. Please try again.");
            window.location.href = "clsedit.jsp";
        </script>
           <%     } }
                key++; 
                }
        }
        con.commit();
        db.close();
}catch(Exception e){out.println(e);}
%>