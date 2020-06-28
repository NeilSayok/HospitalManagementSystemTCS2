package neilsayok.github.io.Models;

import java.sql.Timestamp;

public class Employee {
    int id;
    String name;
    String login;
    String password;
    Timestamp timestamp;

    public Employee() {
    }

    public Employee(int id, String name, String login, String password, Timestamp timestamp) {
        this.id = id;
        this.name = name;
        this.login = login;
        this.password = password;
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}
