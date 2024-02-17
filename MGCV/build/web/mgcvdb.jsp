<jsp:useBean id="db" class="MGCVBean.MGCVBean" />
<% 
   java.sql.Connection con=null; 
   java.sql.Statement stmt=null;
   //db.setLog(file+".log");
   boolean oks = db.isDbcon();
   if(!oks)
   {
       session.putValue("mes",db.getErr()+" - Database error....");
%>
	<jsp:forward page="error.jsp" />
<%	   
   }
   con=db.getCon();
   con.setAutoCommit(false);
   stmt=con.createStatement();
   if(stmt==null)
   {
       session.putValue("mes",db.getErr()+" - Database error");
%>
<jsp:forward page="error.jsp" />
<%
   } 
%>
