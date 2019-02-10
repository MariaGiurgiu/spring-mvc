<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ page import="springmvc.entities.Item" %>
<%@ page import="java.util.List" %>
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
	<script src="../js/app.js" type="text/javascript"></script>
    <title>Menu</title>
  </head>
  <body>
  	<div class="backdrop"></div>
    <div class="card modal">
      <div class="card-body">
        <form>
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>
    </div>
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
            <a class="nav-link btn btn-secondary text-white mr-3" href="http://localhost:8080/SpringMVCExample/admin/users">Manage Accounts</a>
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
     <h1 class="mt-5 text-center">Menu</h1>
      <div class="row">
        <div class="col-md-5 mx-auto">
          <table class="table table-striped table-scroll mt-5">
            <thead>
              <tr>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                <th scope="col">Actions</th>
                
              </tr>
            </thead>
            <tbody>
              <% List<Item> items = (List<Item>)request.getAttribute("items");%>
				<% for(int i=0; i < items.size(); i++) {
					Item item = items.get(i); %>
	    			<tr class="clickable-row">
						<td> <%=item.getName()%></td>
						<td> <%=item.getPrice() %></td>
						<td>
						<div style="width:110px">
							<div style="float:left">
							
							<form:form method="POST" action="/SpringMVCExample/admin/item">
								<input name="id" type="hidden" value="<%=item.getId()%>"/>
							 	<input id="deleteSubmit" class="btn btn-secondary btn-sm" type="submit"  value="Delete"/>
							</form:form>
							</div>
							<div style="float:right">
							<form:form method="GET" action="/SpringMVCExample/admin/editItemForm">
						 		<input id="button" class="btn btn-secondary btn-sm" type="submit"  value="Edit"/>
						 		<input name="id" type="hidden" value="<%=item.getId()%>"/>
						 		</form:form>
						 </div>
						 </div>	
						</td>					
	    			</tr>
				<% } %>
              
            </tbody>
          </table>
        </div>
        <div class="col-md-4 mx-auto">
          <h3 class="text-center mt-5">Create New Menu Item</h3>
          <form:form class="mt-5" method="POST" action="/SpringMVCExample/admin/addItem" modelAttribute="item">
            <form:input path="name" type="text" id="inputName" class="form-control mb-2" placeholder="Name"/>
            <form:input path="price" type="text" id="inputPrice" class="form-control mb-2" placeholder="Price"/>
            <button class="submit btn btn-secondary mt-5">Add item</button>
          </form:form>
        </div>
      </div>
    </div>
    <footer>
      <nav class="navbar navbar-light">
        <a class="btn btn-outline-secondary"href="http://localhost:8080/SpringMVCExample/logout">
          Log Out
        </a>
      </nav>
    </footer>
	<script src="../js/app.js" type="text/javascript"></script>     
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>