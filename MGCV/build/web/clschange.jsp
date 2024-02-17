<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*,java.lang.*" %>
<% String file = "clschange";%> 
<%@ include file="mgcvdb.jsp"%>
<% try{
        String cls = (String)session.getAttribute("cls");
        String sec = (String)session.getAttribute("sec");
        String edit[] = request.getParameterValues("edit");
        int key = 0;
        for(int i=1;i<7;i++)
        {
            for(int j=1;j<9;j++)
            {
                String query = "select distinct teachermail from timetable where cls="+cls+" and sec='"+sec+"' and subcode='"+edit[key]+"'";
                Vector v = db.getData(stmt,query,10,1);
                String qry = "update timetable set teachermail='"+v.get(1)+"' ,subcode='"+edit[key++]+"' where cls="+cls+"and sec='"+sec+"' and dayorder="+i+"and period="+j+"";
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
<%
     }
                    
            }
        }
        con.commit();
        db.close();
}catch(Exception e){out.println(e);}
%>