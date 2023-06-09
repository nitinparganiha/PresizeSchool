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
<style type="text/css">
#a{
margin-left: 600px;
margin-top:50px;
text-decoration:none;
font-size: 30px;
}
</style>
</head>
<body>
<a href="AdminHome.html" id="a">Home</a>
<%
EntityManagerFactory emf=Persistence.createEntityManagerFactory("Nitin");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();
Query q=em.createQuery("select a from Teacher a");
List<Teacher> tch=q.getResultList();


for(int i=0;i<tch.size();i++){
	Teacher t1=tch.get(i);
	%>
     <table>
     <tr>
     <th><%=t1.getName()%></th>
     
	<form action="updateScore" method="post">
	<input type="hidden" name="name" value="<%=t1.getName()%>">
	<th><input type="text" name="per" value="<%=t1.getPercente() %>"></th>
	<th><input type="submit"></th>
	</form>
	</tr>
     </table>
<%
}
%>

</body>
</html>