package Controller;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entity.Teacher;
@WebServlet("/AddResult")
public class Addresult extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String name=req.getParameter("name");
	String Address=req.getParameter("addrss");
	String city=req.getParameter("city");
	String country =req.getParameter("country");
	String pincode=req.getParameter("pincode");
	String score=req.getParameter("score");
	int pin=Integer.parseInt(pincode);
	double satscore=Double.parseDouble(score);
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Nitin");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Teacher t=new Teacher();
	t.setName(name);
	t.setAddress(Address);
	t.setCity(city);
	t.setCountry(country);
	t.setPincode(pin);
	t.setPercente(satscore);
	
	et.begin();
	em.persist(t);
	et.commit();
	
	RequestDispatcher rd=req.getRequestDispatcher("AdminHome.html");
	rd.forward(req, resp);
	
}
}
