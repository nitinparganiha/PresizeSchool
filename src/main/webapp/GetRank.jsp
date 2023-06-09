<%@page import="java.util.List"%>
<%@page import="Entity.Teacher"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="AdminHome.html">Home</a>
<%
String name = request.getParameter("name");

EntityManagerFactory emf = Persistence.createEntityManagerFactory("Nitin");
EntityManager em = emf.createEntityManager();
EntityTransaction et = em.getTransaction();

Query q = em.createQuery("select a from Teacher a");
List<Teacher> t = q.getResultList();
//ArrayList<Teacher> t3=new ArrayList<Teacher>();

for (int i = 0; i < t.size() - 1; i++) {
	for (int j = i + 1; j < t.size(); j++) {
		if (t.get(i).getPercente() < t.get(j).getPercente()) {
			Teacher t5 = t.get(i);
			Teacher t6 = t.get(j);
			t.remove(j);
			t.add(j, t5);
			t.remove(i);
			t.add(i, t6);
		}
	}

}

for (int i = 0; i < t.size(); i++) {
	 
	if (name.equals(t.get(i).getName())) {
%>
<table>
<tr>
<th>Name:<%=name%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>


<th>Rank:<%=i+1%></th>
</tr>
</table>


<%
	}
}



%>
</body>
</html>