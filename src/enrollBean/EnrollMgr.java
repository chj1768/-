package enrollBean;

import java.sql.*;
import java.util.*;

import javax.sql.*;

import oracle.jdbc.pool.*;


public class EnrollMgr implements java.io.Serializable{
   private OracleConnectionPoolDataSource ocpds = null;
   private PooledConnection pool = null;
   private Connection conn = null;
   PreparedStatement pstmt = null;
   CallableStatement cstmt = null;
   
   
   public EnrollMgr()
   {
      try
      {
         ocpds = new OracleConnectionPoolDataSource();
         ocpds.setURL("jdbc:oracle:thin:@주소:orcl");
         ocpds.setUser("아이디");
         ocpds.setPassword("비밀번호");         
         pool = ocpds.getPooledConnection();
         conn = pool.getConnection();
      }catch (Exception e){
         System.out.println("Error : 커넥션 얻어오기 실패");
      }
   }

   public String insertEnroll(String s_id, String c_id, int c_id_no){
      ResultSet rs = null;
      String result = null;
      
      try{
         cstmt = conn.prepareCall("{call InsertEnroll(?,?,?,?)}");
         cstmt.setString(1, s_id);
         cstmt.setString(2, c_id);
         cstmt.setInt(3,c_id_no);
         cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);
                  
         cstmt.execute();         
         result = cstmt.getString(4);
         System.out.println(result);
         cstmt.close();
         pstmt.close();
         conn.close();
         
      }catch(Exception ex)
      {
         System.out.println("Exception" + ex);
      }
      
      
      return result;
      
   }
      
   public Vector getEnrollList(String s_id)
   {
      ResultSet rs = null;
      Vector vecList = new Vector();
      
      int current_semester = 0;
      int current_year = 0;
      
      
      try{
         conn = pool.getConnection();
         cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
         cstmt.registerOutParameter(1,  java.sql.Types.INTEGER);
         cstmt.execute();
         current_year  = cstmt.getInt(1);
         
         
         
         cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
         cstmt.registerOutParameter(1,  java.sql.Types.INTEGER);
         cstmt.execute();
         current_semester  = cstmt.getInt(1);
         
         String mySQL = "select distinct enroll.c_id,enroll.c_id_no, course.c_name, course.c_location, course.c_unit,course.c_time, enroll.e_year, enroll.e_semester from enroll , course where course.c_id= enroll.c_id and course.c_id_no = enroll.c_id_no and  enroll.s_id= ? and enroll.e_year =? and enroll.e_semester= ? order by course.c_time";
         pstmt = conn.prepareStatement(mySQL);
         pstmt.setString(1,s_id);
         pstmt.setInt(2,current_year);
         pstmt.setInt(3,current_semester);
         rs = pstmt.executeQuery();
         while (rs.next())
         {
        	 viewList en = new viewList();
        	 en.setS_id(s_id);
            en.setC_id(rs.getString(1));
            en.setC_id_no(rs.getInt(2));
            en.setC_name(rs.getString(3));
            en.setC_location(rs.getString(4));
            en.setC_unit(rs.getInt(5));
            en.setC_time(rs.getInt(6));
            en.setE_year(rs.getInt(7));
            en.setE_semester(rs.getInt(8));
            vecList.add(en);
         }
         
         cstmt.close();
         pstmt.close();
         conn.close();
         
      }catch(Exception ex)
      {
         System.out.println("Exception" + ex);
      }
      return vecList;
      
      
   }

  public Vector getEnrollList(String s_id, int year, int semester)
   {
      ResultSet rs = null;
      Vector vecList = new Vector();
      
      try{
         conn = pool.getConnection();
         String mySQL = "select distinct enroll.c_id,enroll.c_id_no, course.c_name, course.c_location, course.c_unit,course.c_time, enroll.e_year, enroll.e_semester from enroll , course where course.c_id= enroll.c_id and course.c_id_no = enroll.c_id_no and  enroll.s_id= ? and enroll.e_year =? and enroll.e_semester= ? order by course.c_time";
         pstmt = conn.prepareStatement(mySQL);
         pstmt.setString(1,s_id);
         pstmt.setInt(2,year);
         pstmt.setInt(3,semester);
         rs = pstmt.executeQuery();
         while (rs.next())
         {
        	 viewList en = new viewList();
        	 en.setS_id(s_id);
            en.setC_id(rs.getString(1));
            en.setC_id_no(rs.getInt(2));
            en.setC_name(rs.getString(3));
            en.setC_location(rs.getString(4));
            en.setC_unit(rs.getInt(5));
            en.setC_time(rs.getInt(6));
            en.setE_year(rs.getInt(7));
            en.setE_semester(rs.getInt(8));
            vecList.add(en);
         }
         
         cstmt.close();
         pstmt.close();
         conn.close();
         
      }catch(Exception ex)
      {
         System.out.println("Exception" + ex);
      }
      return vecList;
      
   }   
   


  public void deleteEnroll(String s_id, String c_id, int c_id_no)
  {
           
     ResultSet rs = null;
     Vector vecList = new Vector();
     int current_semester = 0;
     int current_year = 0;

     try{
       
        conn = pool.getConnection();
        cstmt = conn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
        cstmt.registerOutParameter(1,  java.sql.Types.INTEGER);
        cstmt.execute();
        current_year  = cstmt.getInt(1);
        
        
        
        cstmt = conn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
        cstmt.registerOutParameter(1,  java.sql.Types.INTEGER);
        cstmt.execute();
        current_semester  = cstmt.getInt(1);
        
        
         String mySQL = "delete from enroll where s_id='" + s_id + "' and c_id='" + c_id + "'and c_id_no='" + c_id_no + "'and e_year='" + current_year + "'and e_semester='" + current_semester+ "'";
           
          
    
        pstmt = conn.prepareStatement(mySQL);
        rs = pstmt.executeQuery();
     
        cstmt.close();
        pstmt.close();
        conn.close();
  
     }catch(Exception ex)
     {
        System.out.println("Exception" + ex);
     }
  }
}
