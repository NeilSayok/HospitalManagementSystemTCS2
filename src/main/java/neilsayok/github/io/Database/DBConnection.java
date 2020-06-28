package neilsayok.github.io.Database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public Connection get_connection(){
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tcs_hospital","root","Mypassword1#");
            connection = DriverManager.getConnection("jdbc:mysql://zp9eo4ybnjb00xse:lnq0kd1de6lbu4eo@nnmeqdrilkem9ked.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/d07o2iq31u2b2wmr","zp9eo4ybnjb00xse","lnq0kd1de6lbu4eo");

        }catch (Exception e){
            e.printStackTrace();
        }

        return connection;
    }
}
