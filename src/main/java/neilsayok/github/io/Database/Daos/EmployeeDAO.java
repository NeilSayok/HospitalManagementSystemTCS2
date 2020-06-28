package neilsayok.github.io.Database.Daos;

import neilsayok.github.io.Database.DBConnection;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class EmployeeDAO {

    Connection connection;
    Statement smt;

    public EmployeeDAO() {
        DBConnection dbConnection = new DBConnection();
        connection = dbConnection.get_connection();
        try {
            smt = connection.createStatement();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    public JSONObject checkEmployee(String uname, String upass){
        JSONObject retObject = new JSONObject();
        retObject.put("stat", false);
        String query = "SELECT COUNT(*) AS C,`id`,`name`,`login`,`password`,`timestamp` FROM `tcs_hospital`.`userstore`" +
                " WHERE `login` = '"+uname+"' AND `password` = '"+upass+"'";
        try {
            ResultSet rs = smt.executeQuery(query);
            while (rs.next()){
                if (rs.getInt("C") == 1) {
                    if(updateEmployeeTime(rs.getInt("id"))){
                        retObject.put("stat", true);
                        retObject.put("id", rs.getInt("id"));
                        retObject.put("name", rs.getString("name"));
                        retObject.put("login", rs.getString("login"));
                        retObject.put("password", rs.getString("password"));
                        retObject.put("timestamp", rs.getString("timestamp"));
                    }
                    System.out.println(retObject);
                    return retObject;
                }

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        System.out.println(retObject);

        return retObject;
    }

    public boolean updateEmployeeTime(int id){
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        String sql = "UPDATE `tcs_hospital`.`userstore` SET `timestamp` = '"+df.format(date)+"' WHERE `id` = "+id;
        System.out.println(sql);
        try {
            return (connection.createStatement().executeUpdate(sql) != 0);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }



}
