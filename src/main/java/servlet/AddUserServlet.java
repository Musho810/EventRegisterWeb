package servlet;

import manager.EventManager;
import manager.UserManager;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/users/add")
public class AddUserServlet extends HttpServlet {
    private UserManager userManager = new UserManager();
    EventManager eventManager = new EventManager();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("events", eventManager.getAll());
        req.getRequestDispatcher("/WEB-INF/addUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        int eventId = Integer.parseInt(req.getParameter("eventId"));



        User user = User.builder()
                .name(name)
                .surname(surname)
                .email(email)
                .event(eventManager.getById(eventId))
                .build();
        userManager.add(user);
        resp.sendRedirect("/users");
    }
}
