package enrollBean;

public class Enroll {
   
   private String s_id = null;
   private String c_id = null;
   private int c_id_no = 0;
   private int e_year = 0;
   private int e_semester = 0;
   
   public String getSId()
   {
      return s_id;
   }
   public String getCId()
   {
      return c_id;
   }   
   public int getCIdNo()
   {
      return c_id_no;
   }
   public int getEYear()
   {
      return e_year;
   }
   public int getESemester()
   {
      return e_semester;
   }
   
   
   public void setSId(String id)
   {
      s_id = id;
   }
   public void setCId(String id)
   {
      c_id = id;
   }   
   public void setCIdNo(int no)
   {
      c_id_no = no;
   }
   public void setEYear(int year)
   {
      e_year = year;
   }
   public void setESemester(int semester)
   {
      e_semester = semester;
   }   
}