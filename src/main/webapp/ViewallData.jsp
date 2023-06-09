<%@page import="Entity.Teacher"%>
<%@page import="java.util.List"%>
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
<title>ViewallData</title>
<style type="text/css">
#mid{
margin-left:400px;
margin-top:100px;
text-align:center;
width: 400px;
}
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
<div id="mid">
<table>
<tr>
<th>Name</th>
<th>Address</th>
<th>City</th>
<th>Country</th>
<th>Pin-code</th>
<th>percente</th>
</tr>
<%
EntityManagerFactory emf=Persistence.createEntityManagerFactory("Nitin");
EntityManager em=emf.createEntityManager();
EntityTransaction et=em.getTransaction();

Query q=em.createQuery("select a from Teacher a");
List<Teacher> t=q.getResultList();
for(int i=0;i<t.size();i++){
	String pf;
	Teacher t1=t.get(i);
	if(t1.getPercente()>30){
		pf="Pass";
	}else{
		pf="Fail";
	}
	%>
	<tr>
	<td><%=t1.getName()%></td>
	<td><%=t1.getAddress() %></td>
	<td><%=t1.getCity() %></td>
	<td><%=t1.getCountry() %></td>
	<td><%=t1.getPincode() %></td>
	<td><%=t1.getPercente() %>%</td>
	<td><%=pf %></td>
	</tr>
	</table>
	<br>
<%
}

%>
</div>
</body>
</html>