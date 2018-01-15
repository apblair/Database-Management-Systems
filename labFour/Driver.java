import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A sample class that connects to PostgreSQL and runs a simple query.
 *
 * Note: Your database name is your login name, so for login jsmith,
 * you would have
 *    getConnection("jdbc:postgresql://cmps180-db.lt.ucsc.edu/jsmith", 
 *    "jsmith" , "password");
 */
public class Driver
{
    public static void main(String[] args) throws
        ClassNotFoundException, FileNotFoundException, IOException,
        SQLException {
       Connection connection;

   	Class.forName("org.postgresql.Driver");  //Registering the driver
    connection = DriverManager.getConnection(
            "jdbc:postgresql://cmps182-db.lt.ucsc.edu/apblair",
            "apblair", "consolidation63browse");  //Making the Connection = UPDATE with CREDENTIALS

    StoreApplication app = new StoreApplication();

    //Update with a person who exists.
    
    List<String> phoneNumbers =
        app.getCustomerPhoneFromFirstLastName(connection, "John",
                "Farnsworth");
    
    List<String> filmTitles =
        app.getFilmTitlesBasedOnLengthRange(connection, 60, 120);

        //How to print out a list of strings
    //System.out.print(filmTitles);
    
    int count = app.countCustomersInDistrict(connection, "Buenos Aires",
           false);

    System.out.print(count);
    
    app.insertFilmIntoInventory(connection, "Sequel to the Prequel",
            "Memorable", 98, "PG-13");

    connection.close(); //Closing Connection
    }
}
