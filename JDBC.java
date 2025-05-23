import java.sql.*;

public class JDBC {
	public static void main(String[] args)
	{
		try 
		{
			Class.forName("org.postgresql.Driver");
		} 
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:postgresql://localhost:5432/House Boat";
		String name="postgres";
		String password="8500287327";
		Connection conn;
		try 
		{
			conn = DriverManager.getConnection(url, name, password);
			Statement st = conn.createStatement();
			ResultSet rs= st.executeQuery("select * from Houseboat"); 
			conn.close();
			while(rs.next())
			{
				String uname=rs.getString("H_id");
				String pass=rs.getString("first_name");
				String c=rs.getString("last_name");
				String d=rs.getString("Rate_per_hour_adult");
				System.out.println(uname+" "+pass+" "+c+" "+d);
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}