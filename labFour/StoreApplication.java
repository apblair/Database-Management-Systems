import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the video and bookstore database
 * interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * that an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 * Please make sure that the methods are not prone to SQL Injection
 */
public class StoreApplication {

	/**
	 * Return a list of phone numbers of customers, given a first name and
	 * last name.
	 */
	public List<String> getCustomerPhoneFromFirstLastName(Connection connection,
			String firstName, String lastName) {
		//first and last name and gets the output
		List<String> result = new ArrayList<String>();

		try {
			//Execute the query
			PreparedStatement st = connection.prepareStatement("SELECT dv_address.phone FROM dv_address WHERE dv_address.address_id = (SELECT d.address_id FROM mg_customers d WHERE d.first_name=? AND d.last_name=?)");
			
			st.setString(1, firstName);
			st.setString(2, lastName);
			ResultSet rs = st.executeQuery();
			
			int i=0;
			while(rs.next()){
				result.add(i, rs.getString(1));
				i++;
			}
			rs.close();
			st.close();
		}
		catch (SQLException e) {
			System.err.println("Query failed in someMethod()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
		}
		return result;      
	}

	/**
	 * Return list of film titles whose length is is equal to or greater
	 * than the minimum length, and less than or equal to the maximum
	 * length.
	 */
	public List<String> getFilmTitlesBasedOnLengthRange(Connection connection,
			int minLength, int maxLength) {
		List<String> result = new LinkedList<String>();
		try {

			PreparedStatement st = connection.prepareStatement("SELECT title FROM dv_film WHERE length > ? AND length < ?");
			st.setInt(1, minLength);
			st.setInt(2, maxLength);
			ResultSet rs = st.executeQuery();
			int i=0;

			while(rs.next()){
				//parse int to string

				//result = Integer.parseInt(rs.getString(1));
				result.add(i, rs.getString(1));
				i++;
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.err.println("Query failed in someMethod()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
		}
		return result;
	}

	/**
	 * Return the number of customers that live in a given district and
	 * have the given active status.
	 */
	public final int countCustomersInDistrict(Connection connection,
			String districtName, boolean active) {
		int result = -1;
		try {
			PreparedStatement st = connection.prepareStatement("SELECT COUNT(customer_id) FROM mg_customers, dv_address WHERE active=? AND district=?");
			st.setBoolean(1, active);
			st.setString(2, districtName);
			ResultSet rs = st.executeQuery();
			int i=0;
			while(rs.next()){
				//parse int 

				result = Integer.parseInt(rs.getString(1));
				//rs.add(i, rs.getString(1));
				i++;
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			System.err.println("Query failed in someMethod()");
			System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
		}
		return result;
	}
	


	/**
	 * Add a film to the inventory, given its title, description,
	 * length, and rating.
	 *
	 * Your query will need to cast the rating parameter to the
	 * enumerared type mpaa_rating. Whereas an uncast parameter is
	 * simply a question mark, casting would look like ?::mpaa_rating 
	 */
	public void insertFilmIntoInventory(Connection connection, String
			title, String description, int length, String rating)
	{
		try{
			PreparedStatement st = connection.prepareStatement("INSERT INTO dv_film VALUES ( 1600, ?, ?, ?, ?::mpaa_rating)");
			st.setString(1, title);
			st.setString(2, description);
			st.setInt(3, length);
			st.setString(4, rating);
			ResultSet rs = st.executeQuery();
			rs.close();
			st.close();
		}catch(SQLException e) {
			//System.err.println("Query failed in someMethod()");
			//System.err.println("Message from Postgres: " + e.getMessage());
			System.exit(-1);
		}
	}

	


	/**
	 * Constructor
	 */
	public StoreApplication()
	{}

};
