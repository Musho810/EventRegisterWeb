package servlet;

import lombok.SneakyThrows;
import manager.EventManager;
import model.Event;
import model.EventType;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet (urlPatterns = "/events/edit")
public class EventEditServlet extends HttpServlet {
    private EventManager eventManager =new EventManager();
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int eventId = Integer.parseInt(req.getParameter("eventId"));
        Event event = eventManager.getById(eventId);
        req.setAttribute("event",event);
        req.getRequestDispatcher("/WEB-INF/editEvent.jsp").forward(req,resp);


    }

    @SneakyThrows
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int eventId = Integer.parseInt(req.getParameter("eventId"));
        String name = req.getParameter("name");
        String place = req.getParameter("place");
        double price = Double.parseDouble(req.getParameter("price"));
        boolean isOnline = Boolean.valueOf(req.getParameter("isOnline"));
        EventType eventType = EventType.valueOf(req.getParameter("eventType"));
        String eventDateStr = req.getParameter("eventDate");

        Event event = Event.builder()
                .id(eventId)
                .name(name)
                .place(place)
                .price(price)
                .isOnline(isOnline)
                .eventType(eventType)
                .eventDate(sdf.parse(eventDateStr))
                .build();

        eventManager.edit(event);
        resp.sendRedirect("/events");
    }


    }

