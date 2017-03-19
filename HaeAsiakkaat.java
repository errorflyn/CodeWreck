package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import dao.Dao;

@WebServlet("/HaeAsiakkaat")
public class HaeAsiakkaat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HaeAsiakkaat() {
        super();
       System.out.println("HaeAsiakkaat.HaeAsiakkaat()");
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doGet()");
		Dao dao = new Dao();
		ArrayList<Asiakas> asiakas = dao.listaaKaikki();
		request.setAttribute("asiakas", asiakas);		
		String jsp = "/haeasiakkaat.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HaeAsiakkaat.doPost()");
		String hakusana = request.getParameter("hakusana");
		Dao dao = new Dao();
		ArrayList<Asiakas> asiakas = dao.listaaKaikki(hakusana);
		request.setAttribute("asiakas", asiakas);		
		String jsp = "/haeasiakkaat.jsp"; 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
		}

}
