package neilsayok.github.io.Servlets;

import neilsayok.github.io.Database.Daos.EmployeeDAO;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/Servlets/Login"})
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        EmployeeDAO dao = new EmployeeDAO();
        JSONObject dbReply = dao.checkEmployee(uname,upass);
        if(dbReply.getBoolean("stat")){
            HttpSession session = request.getSession();
            session.setAttribute("id",dbReply.getInt("id"));
            session.setAttribute("name",dbReply.getString("name"));
            session.setAttribute("login",dbReply.getString("login"));
            session.setAttribute("password",dbReply.getString("password"));
            session.setAttribute("timestamp",dbReply.getString("timestamp"));



            session.setMaxInactiveInterval(600);
            out.print("success");
        }else{
            out.print("error");
        }
        out.close();
    }


}
