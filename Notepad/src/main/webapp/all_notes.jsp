<%@page import="com.cs.Notepad"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.factory.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">

		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes :</h1>

		<div class="row">
			<div class="col-12">

				<%
					Session s = FactoryProvider.getFactory().openSession();
					Query q = s.createQuery("from Notepad");
					List<Notepad> list = q.list();

					for (Notepad notepad : list) {
				%>
				<div class="card border-success mt-3">
					<div class="card-body text-dark px-5">
						<h5 class="card-title"><%=notepad.getTitle()%></h5>
						<p class="card-text"><%=notepad.getContent()%></p>
						<p><b class="text-primary"><%=notepad.getAddeddate() %></b></p>
						<div class="container mt-3 text-center">
							<a href="DeleteServlet?id=<%=notepad.getId()%>"
								class="btn btn-danger">Delete</a>
							<a href="edit.jsp?id=<%=notepad.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
					}

					s.close();
				%>


			</div>


		</div>

	</div>
</body>
</html>