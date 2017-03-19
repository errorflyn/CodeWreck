package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Asiakas;
import dao.Dao;

@WebServlet("/MuutaAsiakas")
public class MuutaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;       
   
    public MuutaAsiakas() {
        super();
       System.out.println("MuutaAsiakas.MuutaAsiakas()");
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaOnko VirheAsiakas.doGet()");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MuutaEtsiVirheAsiakas.doPost()");
		String etunimi = request.getParameter("etunimi");
		String etunimiUusi = request.getParameter("etunimiUusi");
		String sukunimi = request.getParameter("sukunimi");
		String puhelin = request.getParameter("puhelin");
		String sposti = request.getParameter("sposti");
		
		//int sposti = Integer.parseInt(request.getParameter("sposti"));
		Asiakas asiakas = new Asiakas(etunimiUusi, sukunimi, puhelin, sposti);
		Dao dao = new Dao();		
		dao.muutaAsiakas(asiakas, etunimi);
		response.sendRedirect("HaeAsiakkaat");		
	}
}
