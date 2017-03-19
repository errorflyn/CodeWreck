package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;


@WebServlet("/PoistaAsiakas")
public class PoistaAsiakas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PoistaAsiakas() {
        super();
        System.out.println("PoistaAsiakas.PoistaAsiakas()");
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaAsiakas.doGet()");
		String etunimi = request.getParameter("poista_etunimi");
		Dao dao = new Dao();
		if(dao.poistaAsiakas(etunimi)){
			response.sendRedirect("HaeAsiakkaat");
		}else{
			response.sendRedirect("haeasiakkaat.jsp?ilmo=2");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PoistaAsiakas.doPost()");
	}

}
