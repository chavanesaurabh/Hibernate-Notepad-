<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_js_css.jsp"%>
<title>Add Notes</title>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
	
	<!-- this is add form -->
	<h1>Please fill your note details...</h1><br>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note Title</label> 
				<input required
					name = "title"
					type="text" 
					class="form-control" 
					id="title" 
					placeholder="Enter title">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label> 
				<textarea required 
				name = "content"
				id="content" 
				placeholder ="Enter your content here"
				class="form-control"
				style = "height:300px;"
				></textarea>
			</div>
			<dir class = "container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</dir>
		</form>
	</div>


</body>
</html>