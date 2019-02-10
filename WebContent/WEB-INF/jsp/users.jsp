<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page import="springmvc.entities.User" %>
<%@ page import="java.util.List" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style type="text/css">
		<%@ include file="../css/tables.css" %>
	</style>
    <title>Accounts</title>
  </head>
  <body>
    <nav class="navbar navbar-expand navbar-light header" id="navbar">
      <a class="navbar-brand btn btn-outline-secondary" href="http://localhost:8080/SpringMVCExample/home">
        Home
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link btn btn-secondary text-white mr-3" href="http://localhost:8080/SpringMVCExample/users">Manage Accounts</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-secondary text-white mr-3" href="http://localhost:8080/SpringMVCExample/admin/items">Edit Menu</a>
          </li>
          <li class="nav-item">
            <a class="nav-link btn btn-secondary text-white" href="#">Order Management</a>
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid main-container">
      <div class="row mt-3">
          <div class="col-md-11 mx-auto">
            <h1 class="text-center mt-5">Accounts</h1>
            <table class="table table-scroll mt-5" id="table">
              <thead>
                <tr>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Email</th>
                  <th scope="col">Password</th>
                  <th scope="col">Admin</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Actions</th>
                  
                </tr>
              </thead>
              <tbody>
                <% List<User> users = (List<User>)request.getAttribute("users");%>
				<% for(int i=0; i < users.size(); i++) {
					User user = users.get(i); %>
	    			<tr class="clickable-row">
						<td> <%=user.getFirstName()%></td>
						<td> <%=user.getLastName() %></td>
						<td> <%=user.getEmail() %></td>
						<td> <%=user.getPassword() %></td>
						<td> <%=user.isAdmin() %></td>
						<td> <%=user.getPhone() %></td>
						<td>
						<div style="width:110px">
							<div style="float:left">
							
							<form:form method="POST" action="/SpringMVCExample/admin/user">
								<input name="id" type="hidden" value="<%=user.getId()%>"/>
							 	<input id="deleteSubmit" class="btn btn-secondary btn-sm" type="submit"  value="Delete"/>
							</form:form>
							</div>
							<div style="float:right">
							<form:form method="GET" action="/SpringMVCExample/admin/editUserForm">
						 		<input id="editSubmit" class="btn btn-secondary btn-sm" type="submit"  value="Edit"/>
						 		<input name="id" type="hidden" value="<%=user.getId()%>"/>
						 	</form:form>
						 </div>
						 </div>	
						</td>					
	    			</tr>
				<% } %>
              </tbody>
            </table>
        </div>
    </div>
    </div>
    <footer>
      <nav class="navbar navbar-light">
        <a class="btn btn-outline-secondary" href="http://localhost:8080/SpringMVCExample/logout">
          Log Out
        </a>
      </nav>
    </footer>
    <script>
      function highlight(e) {
            if (selected[0]) selected[0].className = '';
            e.target.parentNode.className = 'selected';
        }

        var table = document.getElementById('table'),
            selected = table.getElementsByClassName('selected');
        table.onclick = highlight;

        function fnselect(){
            
            alert($("tr.selected td:first" ).html());
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>
