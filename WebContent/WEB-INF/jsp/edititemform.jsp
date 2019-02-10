<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="springmvc.entities.Item" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style type="text/css">
	<%@ include file="../css/tables.css" %>
</style>
</head>
<body>
	<div class="container-fluid main-container">
        <div class="row justify-content-center align-items-center" id="central">
          <div class="card" style="width: 25rem;">
            <div class="card-header">
              <h2 class="text-center my-auto">Edit Item</h2>
            </div>
              <div class="card-body">
                <% Item item = (Item) request.getAttribute("item");%>
                  <form:form method="POST" action="/SpringMVCExample/admin/editItem" modelAttribute="item">
					
						<form:input name="id" type="hidden" path="id"/>
						
						
                    	
                    	<div class="form-label-group">
                      		<form:input path="name" type="text" class="form-control mb-2"/>
                    	</div>
                    	
                    	<div class="form-label-group">
                      		<form:input path="price" type="text" class="form-control mb-2"/>
                    	</div>
                    	
                    	<button class="btn btn-lg btn-secondary btn-block mt-3" type="submit">Edit Item</button>
					
				</form:form>

              </div>
          </div>
        </div>
    </div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>