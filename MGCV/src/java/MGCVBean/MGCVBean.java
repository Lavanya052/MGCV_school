package MGCVBean;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.sql.SQLException;
import java.lang.*;
import javax.naming.*;
import javax.sql.*;

public class MGCVBean{

   Connection con;
   Statement stmt;
   String sid="xe",uname="system",psw="welcome",ipaddr="localhost",port="1521",logfile;
   String home="sarasms",err="";
   
   static boolean Dbcon;
  
   FileOutputStream bug;
   DataSource dataSource;

   private boolean init(){
      Dbcon=false;
      return true; 
   } 

   private boolean init(ServletConfig config){
      Dbcon=false;
      return true; 
   } 
   
   public boolean connect(){
       Dbcon=false;
       err="";
       try{
    java.sql.DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
          con=DriverManager.getConnection
                       ("jdbc:oracle:thin:@"+
                        "(description="+         
                        "(address="+
                        "(host="+ipaddr+")"+
                        "(protocol=tcp)"+
                        "(port="+port+")"+
                        ")"+
                        "(connect_data="+
                        "(sid="+sid+")"+
                        ")"+
                        ")",
                        ""+uname+"",
                        ""+psw+"");
           stmt=con.createStatement();
           Dbcon=true; 
         }catch(Exception e){
            Dbcon=false;
            err="DBOpen-"+e.toString();
         }
         return Dbcon;
   }
   
   public void setPsw(String passw){
	psw=passw;
	}
   

   public String getPsw(){
   	return psw;
	}
   
   public void setSid(String sysid){
	sid=sysid;
	setIpaddr(sid);
	}
   
   public String getSid(){
   	return sid;
	}

   public void setUname(String usname){
	uname=usname;
	}
   
   public String getUname(){
   	return uname;
	}

    public void setIp(String ip){
          ipaddr=ip;
    }

    public void setIpaddr(String sidip){
		if(sidip.equals("saradb"))
		   ipaddr="172.16.1.4";
		if(ipaddr != null)
			 setAPort(ipaddr);
   	}
    	
     public void setAPort(String gport)
     	{
    	if(gport.equals("172.16.1.4"))
    	   port="1521";
    	}
    	
     public String getIpaddr(){
   	return ipaddr;
        }
	
     public void setPort(String gport)
     	{
    	   port=gport;
    	}
    	
   public String getPort(){
   	return port;
	}

   public void setHome(String Home){
      home=Home;
   }

   public void setLog(String Logfl){
	logfile=Logfl;
	}
 
   public String getLog(){
	return logfile;
	}
 
   public void bugOut(String mes){
    err="";
    try{ 
       bug=new FileOutputStream(logfile,true);
       mes=mes+"\n\r";
       bug.write(mes.getBytes());
       bug.close();
    }catch(IOException e){
      err="bugOut-"+e.toString();
    }

   }

   public boolean isDbcon(){
     
      try{
         String query="select * from test";
         ResultSet rs=stmt.executeQuery(query);
      }catch(Exception se){
         Dbcon=connect();
      }
      return Dbcon;
   }

   synchronized public void setStmt(Statement statmt){
	stmt=statmt;
	}
   
   public Statement getStmt(){
   	return stmt;
	}

    public Connection getCon(){
   	return con;
	}

    public void setCon(Connection Con){
   	   con=Con;
	}

   private void destroy(){
   try{ 
      stmt.close();
      con.close();
      System.err.println("Database Connection Closed! - "+home);
   }catch(Exception e){
     System.err.println("Connection Failed "+e+" "+home);
   }
   } 

   public void close(){
   try{ 
      stmt.close();
      con.close();
      Dbcon=false;
   }catch(Exception e){
     System.err.println("Connection Failed "+e+" "+home);
   }
   } 


   synchronized public Vector getData(Statement stmt1,String Query, int psize, int pg){
      setStmt(stmt1);
      Vector v=getData(Query,psize,pg);
      return(v);
   }

   synchronized public Vector getData(String Query, int psize, int pg){
   ResultSet rs;
   String query;
   int PSize,Pg,SRow,ERow,RCount=0,Pg1=0;
   Vector vect=new Vector();
   err="";
   try{
     query=Query;
     PSize=psize;
     Pg=pg;
     	
     if(Pg==0){
       Pg=1;
       Pg1=1;
     }
     SRow=PSize*(Pg-1)+1;
     ERow=PSize*Pg;
     rs=stmt.executeQuery(query);
     ResultSetMetaData rsmd=rs.getMetaData();

     int columnCount=rsmd.getColumnCount();
 
     String data;
     data=Integer.toString(columnCount);

     vect.add(data);

     int row=1,chk=0;
     RCount=0;
     while(rs.next())
     {
          if(row>=SRow && row <=ERow){
            for(int i=1; i<=columnCount; i++){
              data=rs.getString(i);
              if(data==null) data="";
              vect.add(data); 
          }
        RCount++;
        }
        row++;
        if(row>ERow)
        {
          chk=1;
          break;

        }
        chk=0;
   }
   
   if(Pg1==1){
     if(chk==1){
         int i=query.indexOf(" from ");
	 String query1="select count(*) "+query.substring(i);
         rs=stmt.executeQuery(query1);
         rs.next();
         data=rs.getString(1);
         RCount=Integer.parseInt(data);
      }
   }
   }catch(Exception e){
     err="getData-"+e.toString();
   }
   vect.add(Integer.toString(RCount));
   return vect;
  }

   synchronized public String getData(String Query, int psize, int pg,Vector v,Vector vect){
   ResultSet rs;
   String query;
   int PSize,Pg,SRow,ERow,RCount=0,Pg1=0;
   String emes="";
   try{
     query=Query;
     PSize=psize;
     Pg=pg;
     	
     if(Pg==0){
       Pg=1;
       Pg1=1;
     }
     SRow=PSize*(Pg-1)+1;
     ERow=PSize*Pg;
     rs=stmt.executeQuery(query);
     ResultSetMetaData rsmd=rs.getMetaData();

     int columnCount=rsmd.getColumnCount();
     for(int i=0; i<columnCount; i++)
          v.add(rsmd.getColumnName(i+1));
     String data;
     data=Integer.toString(columnCount);

     vect.add(data);

     int row=1,chk=0;
     RCount=0;
     while(rs.next())
     {
          if(row>=SRow && row <=ERow){
            for(int i=1; i<=columnCount; i++){
              data=rs.getString(i);
              if(data==null) data="";
              vect.add(data); 
          }
          RCount++;
        }
        row++;
       
        if(row>ERow)
        {
          chk=1;
          break;
        }
        chk=0;
   }
   
   if(Pg1==1){
     if(chk==1){
         int i=query.indexOf(" from ");
	 String query1="select count(*) "+query.substring(i);
         rs=stmt.executeQuery(query1);
         rs.next();
         data=rs.getString(1);
         RCount=Integer.parseInt(data);
      }
   }
   }catch(Exception e){
     emes=e.toString();
   }
   vect.add(Integer.toString(RCount));
   return emes;
  }


   synchronized public String getData(Statement STMT,String Query, int psize, int pg,Vector v,Vector vect){
   ResultSet rs;
   String query;
   int PSize,Pg,SRow,ERow,RCount=0,Pg1=0;
   String emes="";
   stmt=STMT;  
   try{
     query=Query;
     PSize=psize;
     Pg=pg;
     	
     if(Pg==0){
       Pg=1;
       Pg1=1;
     }
     SRow=PSize*(Pg-1)+1;
     ERow=PSize*Pg;
     rs=stmt.executeQuery(query);
     ResultSetMetaData rsmd=rs.getMetaData();

     int columnCount=rsmd.getColumnCount();
     for(int i=0; i<columnCount; i++)
          v.add(rsmd.getColumnName(i+1));
     String data;
     data=Integer.toString(columnCount);

     vect.add(data);

     int row=1,chk=0;
     RCount=0;
     while(rs.next())
     {
          if(row>=SRow && row <=ERow){
            for(int i=1; i<=columnCount; i++){
              data=rs.getString(i);
              if(data==null) data="";
              vect.add(data); 
          }
          RCount++;
        }
        row++;
       
        if(row>ERow)
        {
          chk=1;
          break;
        }
        chk=0;
   }
   
   if(Pg1==1){
     if(chk==1){
         int i=query.indexOf(" from ");
	 String query1="select count(*) "+query.substring(i);
         rs=stmt.executeQuery(query1);
         rs.next();
         data=rs.getString(1);
         RCount=Integer.parseInt(data);
      }
   }
   }catch(Exception e){
     emes=e.toString();
   }
   vect.add(Integer.toString(RCount));
   return emes;
  }



 public int putData(String Query){
      int nrow=0;
      String query=Query;
      err="";
      try{
         nrow=stmt.executeUpdate(query);
      }catch(Exception e){
         err="putData-"+e.toString();
      }
      return nrow;
  }
           
 public int putData(Statement stmt0,String Query){
      stmt=stmt0;
      int nrow=0;
      String query=Query;
      err="";
      try{
         nrow=stmt.executeUpdate(query);
      }catch(Exception e){
         err="putData-"+e.toString();
      }
      return nrow;
  }

  public int getRows(Vector v){
       int row;

       row=Integer.parseInt((String) v.get(v.size()-1));
       return row;
  }

  public int getCols(Vector v){
       int col;

       col=Integer.parseInt((String) v.get(0));
       return col;
  }

  public String[][] getSArray(Vector v,int pgsize)
  {
      int row=getRows(v);
      if(row > pgsize) row=pgsize;
      int col=getCols(v);
      String s[][]=new String[row][col];
      int k=1;

      for(int i=0;i<row; i++)
      {
         for(int j=0; j<col; j++)
         {
             s[i][j]=(String) v.get(k);
             k++;
         }
      }
      return s;
  }

  public String getErr(){
      return err;
  } 

  public String parse(String s)
  {
      char sp[]={39};
      char spx[]={39};
      int x;
      if(s==null) return s;
      for(int i=0; i<sp.length; i++)
      {
          x=0;
          do{
              x=s.indexOf(sp[i],x);
              if(x != -1)
              {
                 if (x==s.length())
                    s=s.substring(0,x)+spx[i]+sp[i];
                 else
                    if (x==0)
                    {
                       s=spx[i]+s.substring(x);
                    }   
                    else
                       s=s.substring(0,x)+spx[i]+sp[i]+s.substring(x+1);
                 x+=2;
              }
            }while(x != -1);
       }
       return s;
  } 
  
   public String enc(String psw) {
   String key="SARANATHANSCOLLEGE",epsw="";
   String Hex="0123456789ABCDEF";
   int j=0;char k1,k2;
   int l1,l2;
   if(psw.equals("")) return(""); 
   for(int i=0; i<psw.length(); i++)
   {
      j=psw.charAt(i)+key.charAt(i);
      l1=j/16;
      l2=j%16;
      epsw=epsw+Hex.charAt(l1)+Hex.charAt(l2);  
   }
    return(epsw);
  }    
   
   public String dec(String psw) {
   String key="SARANATHANSCOLLEGE",epsw="";
   String Hex="0123456789ABCDEF";
   String dpsw="";
   int j=0;char k1,k2;
   int l1,l2,l3;
   for(int i=0; i<psw.length(); i+=2)
   {
     l1=Hex.indexOf(psw.charAt(i));
     l2=Hex.indexOf(psw.charAt(i+1));
     l3=l1*16+l2;
     
     l3=l3- (int) key.charAt(j);
     k1=(char)l3;
     System.out.println("l1-"+l1+"  l2-"+l2+"  l3-"+l3+"  k1-"+k1);
     dpsw=dpsw+k1;
     j++;
   }      
    return(dpsw);
  } 
//////////////
String s1[]={"one","two","three","four","five","six","seven","eight","nine"};
	String s2[]={"ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"};
	String s3[]={"eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"};
	String s4;
	int b,c;
	
	public String notow(String a)
	{
		s4="";
		int d=Integer.parseInt(a);
		if(d>=10000000)
			eightdigit(d);
		else if(d>=100000)
			sixdigit(d);
		else if(d>=1000)
			fourdigit(d);
		else if(d>=100)
			threedigit(d);
		else if(d>=10)
			twodigit(d);
		else
			single(d);
		return s4;	
	}
	public void single(int a)
	{
		a=a-1;
		s4=s4+s1[a]+" ";
	}
	public void twodigit(int a)
	{
		if(a%10==0)
			s4=s4+s2[(a/10)-1]+" ";
		else if(a/10==1)
			s4=s4+s3[(a%10)-1]+" ";
		else
		{	
			s4=s4+s2[(a/10)-1]+" ";
			single(a%10);
		}
	}
	public void threedigit(int a)
	{
		if(a%100==0)
			s4=s4+s1[(a/100)-1]+" "+"hundred ";
		else
		{
			s4=s4+s1[(a/100)-1]+" "+"hundred and ";
			c=a%100;
			if(c>=10)
				twodigit(c);
			else 
				single(c);
		}
	}
	public void fourdigit(int a)
	{
		if(a%1000==0)
		{
			b=a/1000;	
			if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"thousand ";
		}
		else
		{
			b=a/1000;	
			if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"thousand ";
			c=a%1000;
			if(c>=100)
				threedigit(c);
			else if(c>=10)
				twodigit(c);
			else 
				single(c);
		}
	}
	public void sixdigit(int a)
	{
		if(a%100000==0)
		{
			b=a/100000;	
			if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"lakh ";
		}
		else
		{
			b=a/100000;	
			if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"lakh ";
			c=a%100000;
			if(c>=1000)
				fourdigit(c);
			else if(c>=100)
				threedigit(c);
			else if(c>=10)
				twodigit(c);
			else 
				single(c);

		}
	} 	
	public void eightdigit(int a)
	{
		if(a%10000000==0)
		{
			b=a/10000000;
			if(b>=100)
				threedigit(b);	
			else if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"crore ";
		}
		else
		{
			b=a/10000000;
			if(b>=100)
				threedigit(b);	
			else if(b>=10)
				twodigit(b);
			else
				single(b);
			s4=s4+"crore ";
			c=a%10000000;
			if(c>=100000)
				sixdigit(c);
			else if(c>=1000)
				fourdigit(c);
			else if(c>=100)
				threedigit(c);
			else if(c>=10)
				twodigit(c);
			else 
				single(c);
		}
	}

////////////

}
