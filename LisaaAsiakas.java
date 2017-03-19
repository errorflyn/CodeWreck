package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import model.Asiakas;

@WebServlet("/LisaaAsiakas")
public class LisaaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public LisaaAsiakas() {
        super();
        System.out.println("LisaaAsiakas.LisaaAsiakas()");
    }

	
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doGet()");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LisaaAsiakas.doPost()");
		String etunimi = request.getParameter("etunimi");
		String sukunimi = request.getParameter("sukunimi");
		String puhelin = request.getParameter("puhelin");
		String sposti = request.getParameter("sposti");
          	//Tämä tutkiminen kannattaisi tehtdä clientin puolella Javascriptillä/jQueryllä
		if(etunimi.length()<2||sukunimi.length()<2){
			response.sendRedirect("lisaaAsiakas.jsp?ilmo=0");
			return;
		}		
	Asiakas asiakas = new Asiakas(etunimi, sukunimi, puhelin, sposti);
	Dao dao = new Dao();
	if(dao.lisaaAsiakas(asiakas)){
		response.sendRedirect("lisaaAsiakas.jsp?ilmo=1");
	}else{
		response.sendRedirect("lisaaAsiakas.jsp?ilmo=0");
	}
	}

}
