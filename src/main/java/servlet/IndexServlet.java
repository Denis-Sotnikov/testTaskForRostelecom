package servlet;

import org.json.JSONArray;
import store.PsqlStore;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("posts", PsqlStore.instOf().findAll());
        JSONArray jsonArray = new JSONArray();
        jsonArray.put(PsqlStore.instOf().findAll());
        System.out.println(PsqlStore.instOf().getInfo("02"));
        req.setAttribute("s", jsonArray.toString());
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
