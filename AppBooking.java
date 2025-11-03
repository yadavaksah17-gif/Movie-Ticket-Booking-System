import java.sql.*;
public class AppBooking {
  public static void main(String[] args)throws Exception{
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/ORCLPDB1","movie_admin","movie_pwd");
    CallableStatement cs=con.prepareCall("{call book_ticket(?,?,?,?,?,?)}");
    cs.setInt(1,1); cs.setString(2,"A1"); cs.setString(3,"Vishal Sharma"); cs.setString(4,"9876543210");
    cs.setDouble(5,250); cs.registerOutParameter(6,Types.NUMERIC);
    try{ cs.execute(); System.out.println("Booking Successful, ID="+cs.getInt(6)); }
    catch(SQLException e){ System.out.println("Error:"+e.getMessage()); }
    con.close();
  }
}
