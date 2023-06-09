package Controller;

import java.io.IOException;
import java.util.List;

import javax.persistence.Entity;
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

import javax.persistence.Query;
@WebServlet("/updateScore")
public class UpdateScore extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String per=req.getParameter("per");
		double perc=Double.parseDouble(per);
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("Nitin");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		
		Query q=em.createQuery("select a from Teacher a where a.name=?1");
		q.setParameter(1, name);
		List<Teacher> tc= q.getResultList();
		Teacher tch=tc.get(0);
		Teacher t=new Teacher();
		t.setName(name);
		t.setAddress(tch.getAddress());
		t.setCity(tch.getCity());
		t.setCountry(tch.getCountry());
		t.setPincode(tch.getPincode());
		t.setPercente(perc);
		
		et.begin();
		em.merge(t);
		et.commit();
		
		RequestDispatcher rd=req.getRequestDispatcher("AdminHome.html");
		rd.forward(req, resp);
	}

}
