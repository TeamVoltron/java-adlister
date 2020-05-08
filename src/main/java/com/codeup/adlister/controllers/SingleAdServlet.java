package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/ads/view")
public class SingleAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("id"));
        if(request.getParameter("id") == null){
            request.getSession().setAttribute("errorMessage", "- There's no ad with that id in our system. -<br>");
            response.sendRedirect("/ads");
            return;
        }
        String idStr = request.getParameter("id");
        long id = Long.parseLong(idStr);
        Ad ad = DaoFactory.getAdsDao().getById(id);
        System.out.println(ad);
        User user = DaoFactory.getUsersDao().findByUserId(ad.getUserId());
        System.out.println(user);
        String categories = "";
        StringBuilder stringy = new StringBuilder();
        for (String item : DaoFactory.getCategoriesDao().findByAdId(ad.getId())) {
            if(item.length() <=0){
                stringy.append(item);
                continue;
            }
            stringy.append(item);
            stringy.append(", ");
        }
        if (stringy.length() > 0) {
            categories = stringy.toString().substring(0, stringy.length()-2);
        }
        System.out.println(categories);
        request.getSession().removeAttribute("errorMessage");
        request.setAttribute("ad", ad);
        request.setAttribute("user", user);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/WEB-INF/ads/single_ad.jsp").forward(request, response);
    }
}