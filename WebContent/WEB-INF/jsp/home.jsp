<%@ page import="springmvc.entities.User" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style type="text/css">
		<%@ include file="../css/tables.css" %>
	</style>
<title>Home</title>
</head>
<body>

	<div class="container-fluid main-container d-flex justify-content-center align-items-center">
    <div class="col-md-5">
    	<% User user = (User)request.getAttribute("user");%>
            <h3 class="text-center" id="contact">Hello, <%=user.getFirstName() %> <%=user.getLastName() %> </h3>
		<form:form method="POST" action="/SpringMVCExample/billing">
			
						<input class="btn btn-secondary btn-block" type="submit" value="Billing"/>
				
		</form:form>

		<form:form method="GET" action="/SpringMVCExample/admin/users">
			
						<% if(user.isAdmin()){ %>
							<input class="btn btn-secondary btn-block mt-3" type="submit" value="System Administration"/>
						<%} else { %>
							<input class="btn btn-secondary btn-block mt-3" type="submit" disabled="true" value="System Administration"/>
						<% } %>	
					
	</form:form>
	</div>
	</div>

	<footer>
      <nav class="navbar navbar-light">
        <a class="btn btn-outline-secondary"href="http://localhost:8080/SpringMVCExample/logout">
          Log Out
        </a>
      </nav>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
   
	
</body>
</html>