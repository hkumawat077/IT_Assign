/*
  Using MySql in xammp
*/
import java.sql.*;
import java.util.*;
public class menu
{ public static void main(String args[])
   { try{ int i=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student?autoReconnect=true&useSSL=false","root","");
	int ch; 
    while(true)
	{
	System.out.println("\n MENU:-\n 1 Find total number of students");
	System.out.println("2 Print average marks for each subject input by user");
	System.out.println("3 Find the name of student getting highest marks");
	System.out.println("4 Find no of students getting first, second and third division");
	System.out.println("5 Find subject wise toppers");
	System.out.println("6 Find the average marks");
	System.out.println("7 Find the student getting second highest marks");
	System.out.println("8 Exit");
    System.out.println("chose any one option");
    Scanner s=new Scanner(System.in);
	ch=s.nextInt();
	PreparedStatement ps=null;
	ResultSet rs=null;
        
		switch(ch)
	{ case 1:
	      ps=con.prepareStatement("select count(*) as total_no_of_Students from stu");
	      rs=ps.executeQuery();
		while(rs.next())
		{  i=rs.getInt("total_no_of_Students");
			System.out.println("Total no. of Students:"+i);
		} 
	   rs.close();	
	   break;
 	   case 2:
	    	ps=con.prepareStatement("select TOC from stu");
	    rs=ps.executeQuery();
	   float sum=0;
	   while(rs.next())
		{ sum+=rs.getInt("TOC");
		} 
	   System.out.println("Average marks for TOC="+sum/i);
	   rs.close();	
	    ps=con.prepareStatement("select SP from stu");
	    rs=ps.executeQuery();
	    sum=0;
	   while(rs.next())
		{ sum+=rs.getInt("SP");
		} 
	   System.out.println("Average marks for SP="+sum/i);
	   rs.close();	
	    ps=con.prepareStatement("select IT from stu");
	    rs=ps.executeQuery();
	    sum=0;
	   while(rs.next())
		{ sum+=rs.getInt("IT");
		} 
	   System.out.println("Average marks for IT="+sum/i);
	   rs.close();	
	    ps=con.prepareStatement("select ALGO from stu");
	    rs=ps.executeQuery();
	    sum=0;
	   while(rs.next())
		{ sum+=rs.getInt("ALGO");
		} 
	   System.out.println("Average marks for ALGO="+sum/i);
  		break;
	   case 3:
		ps=con.prepareStatement("select name,MAX(total_marks) from stu,result  where stu.rollno=result.rollno");
	  	 rs=ps.executeQuery();
	   	while(rs.next())
			{  String n=rs.getString("name");
				System.out.println("Student having highest marks:- "+n);
			} 
	   rs.close();
	   break;
	   case 4:
		ps=con.prepareStatement("select division,count(*) as no from result GROUP BY division");
	  	 rs=ps.executeQuery();
	   	ResultSetMetaData rsm=rs.getMetaData();
	   	int column=rsm.getColumnCount();	
	  	for(i=1;i<=column;i++)
			System.out.print(rsm.getColumnName(i)+"	");
			System.out.println();
	   	while(rs.next())
			{   	for(i=1;i<=column;i++)
				{  System.out.print(rs.getString(i)+"		");
				}
	 			System.out.println();
			} 
	   	rs.close();	
		break;
	   case 5:
		String n=null;
		ps=con.prepareStatement("select  name,MAX(TOC) from stu");
	   	 rs=ps.executeQuery();
	  	 while(rs.next())
			{  n=rs.getString("name");
				System.out.println("Topper in TOC:- "+n);
			} 
	   	rs.close();	
	    	ps=con.prepareStatement("select name,MAX(SP) from stu");
	    	rs=ps.executeQuery();
	    
	  	 while(rs.next())
			{ n=rs.getString("name");
				System.out.println("Topper in SP:- "+n);
			} 
	  
	   	rs.close();	
	   	 ps=con.prepareStatement("select name,MAX(IT) from stu");
	    	rs=ps.executeQuery();
	    
	   	while(rs.next())
			{ n=rs.getString("name");
				System.out.println("Topper in IT:- "+n);
			} 
	   
	   	rs.close();	
	   	 ps=con.prepareStatement("select name,MAX(ALGO) from stu");
	    	rs=ps.executeQuery();
	    
	   	while(rs.next())
			{ n=rs.getString("name");
				System.out.println("Topper in ALGO:- "+n);
			} 
	   	rs.close();
		break;
	   case 6:
		int n1=0;
		ps=con.prepareStatement("select count(*) as no from result");
	   	 rs=ps.executeQuery();
	   	while(rs.next())
			{   n1=rs.getInt("no");
			} 
	   	rs.close();	
	    	ps=con.prepareStatement("select SUM(total_marks) as t  from result");
	    	rs=ps.executeQuery();
	   	while(rs.next())
			{  int in=rs.getInt("t");
				System.out.println("Average Marks:- "+(float)in/n1);
			} 
	   	rs.close();	
		break;
	   case 7:
		ps=con.prepareStatement("select name from stu,result where stu.rollno=result.rollno order by total_marks desc limit 1,1");
	  	 rs=ps.executeQuery();
	   	while(rs.next())
			{     
				String n2=rs.getString("name");
				System.out.println("Student having second highest marks:- "+n2);
			} 
	   	rs.close();	
		break;
	   default:
		con.close();
		System.exit(0);
	}
  	}
	
	}
	catch(Exception e)
		{ System.out.println("EXCEPTION :"+e);
		}
	}
   }
Q2. Create a procedure in MySQL to count the number of Rows in table 'Student'. Use CallableStatement to call this method from Java code.

import java.sql.*;
public class callable
{ public static void main(String args[])
   { try{ String i=null;
	Class.forName("com.mysql.jdbc.Driver");
	    System.out.println("Driver Registered");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student?autoReconnect=true&useSSL=false","root","urvashi@");
	   String query="call countstudent(?)";
	   CallableStatement cs=con.prepareCall(query);
	   cs.registerOutParameter(1,Types.INTEGER);
	   cs.execute();
	   System.out.println("Total no. of Students = "+cs.getInt(1));
	   con.close();

	}
	catch(Exception e)
		{ System.out.println("EXCEPTION :"+e);
		}
   }
}
