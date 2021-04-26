<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.cs.Notepad"%>
<%@page import="com.factory.* , org.hibernate.*,com.cs.*"%>
<%@page import="com.factory.FactoryProvider"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">

		<%@include file="navbar.jsp"%>
		<br>
		<h1>Edit any note...</h1>
		<%
			int noteid = Integer.parseInt(request.getParameter("id").trim());
			Session s = FactoryProvider.getFactory().openSession();
			Notepad note = (Notepad) s.get(Notepad.class, noteid);
		%>


		<form action="UpdateServlet" method="post">

			<input value="<%=note.getId()%>" name="noteId" type="hidden" />

			<div class="form-group">
				<label for="title">Note Title</label> <input required name="title"
					type="text" class="form-control" id="title"
					aria-describedby="emailHelp" placeholder="Enter title"
					value="<%=note.getTitle()%>">
			</div>

			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea required name="content" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 300px;"><%=note.getContent()%>
				</textarea>
			</div>
			<dir class="container text-center">
				<button type="submit" class="btn btn-success">Save your
					notes</button>
			</dir>

		</form>

	</div>

</body>
</html>