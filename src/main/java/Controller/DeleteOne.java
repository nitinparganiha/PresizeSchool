package Controller;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/DeleteOne")
public class DeleteOne extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String name=req.getParameter("name");
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("Nitin");
	EntityManager em=emf.createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	Query q=em.createQuery("select a from Teacher a where a.name=?1");
	q.setParameter(1, name);
	List<Teacher> t=q.getResultList();
	Teacher tc=t.get(0);
	et.begin();
	em.remove(tc);
	et.commit();
	RequestDispatcher rd=req.getRequestDispatcher("AdminHome.html");
	rd.forward(req, resp);
}
}
