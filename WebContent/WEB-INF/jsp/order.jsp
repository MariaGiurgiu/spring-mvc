<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="springmvc.entities.Order" %>
<%@ page import="springmvc.entities.User" %>
<%@ page import="springmvc.entities.OrderItem" %>
<%@ page import="springmvc.entities.Item" %>


<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="tables.css">
	
	<style type="text/css"><%@ include file="../css/tables.css" %></style>
	
	<title>Order</title>
</head>
<body>
	<nav class="navbar navbar-light header" id="navbar">
      <a class="navbar-brand btn btn-outline-secondary" href="http://localhost:8080/SpringMVCExample/home">
        Home
      </a>
    </nav>
    <div class="container-fluid main-container">
      <div class="row">
        <h1 class="ml-5">Order</h1>
      </div>
     	<form:form method="POST" action="/SpringMVCExample/addItem" modelAttribute="item"> 
      
      <% Order order = (Order)request.getAttribute("order");%>
      	<% if(order.getAt() != null) { %>
      		<input path="at" name="at" type="hidden" value="<%=order.getAt()%>"/>
      	<% } %>	
      	<input path="place" name="place" type="hidden" value="<%=order.getPlace()%>"/>
      	
      	<% if (order.getTotal() != null) { %>
      		<input path="total" name="total" type="hidden" value="<%=order.getTotal()%>"/>
      	<% } %>
      <div class="row mt-3"> 
        <div class="col-md-2">
          <p>Table:</p>
          <p>Date:</p>
          <p>Time:</p>
          <p>Total:</p>
        </div>
        <div class="col-md-2">
        	<% if(order.getPlace() != 0) { %>
          		<p><%=order.getPlace()%></p>
          	<% }  else { %>
          		<p></p>
          	<% } %>
          	
          	<% if(order.getAt() != null) { 
          		
          		DateTimeFormatter dtfDate = DateTimeFormatter.ofPattern("yyyy/MM/dd");
          		String resultDate = dtfDate.format(order.getAt());
          	%>
          		<p><%=resultDate%></p>
          	<% }  else { %>
          		<p></p>
          	<% } %>
          	
          	<% if(order.getAt() != null) { 
          		DateTimeFormatter dtfTime = DateTimeFormatter.ofPattern("HH:mm:ss");
          	%>
          		<p><%=dtfTime.format(order.getAt())%></p>
          	<% }  else { %>
          		<p></p>
          	<% } %>
          	
          	<% if (order.getTotal() != null) { %>
          		<p><%=order.getTotal()%></p>
          	<% }  else { %>
          		<p></p>
          	<% } %>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6">
        		<% List<OrderItem> orderItems = (List<OrderItem>)request.getAttribute("orderItems");
                if(orderItems == null) { %>	
                	<div class="col-md-6 text-center"> <h5> No items yet</h5></div>
              <% } else { %>
	              <table class="table"  id="table">
	                <thead>
	                  <tr>
	                    <th scope="col">Item</th>
	                    <th scope="col">#</th>
	                    <th scope="col">Total ($)</th>
	                  </tr>
	                </thead>
	                <tbody>
						<% for(int i=0; i < orderItems.size(); i++) {
							OrderItem orderItem = orderItems.get(i); %>
		                  <tr>
		                    <td><%= orderItem.getItem().getName() %></td>
		                    <td><%= orderItem.getQuantity() %></td>
		                    <td><%= orderItem.getItem().getPrice() %></td>
		                  </tr>
		                 <% } %>
		            <% } %>     
	                </tbody>
	              </table>
              </div>
        <div class="col-md-6">
          <div class="row">
            <div class="col-md-6">
                <div class="input-group mb-3">
               
                <select class="custom-select" id="inputGroupSelect01">
                    <option selected>--Select Previous Order--</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>
                  
                </div>
            </div>
            <div class="col-md-3">
              <button class="btn btn-secondary btn-block">
                Load
              </button>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">
              <h3>Add Item:</h3>
              <div class="input-group mb-3">
               <% List<Item> items = (List<Item>)request.getAttribute("allItems");%>
              <form:select path="name" class="custom-select" id="inputGroupSelect01">
                  <%  for(int i = 0; i < items.size(); i++) { %>
                  	<form:option value="<%= items.get(i).getId() %>" label="<%= items.get(i).getName() %>" />
                  	
                  <% } %>
                </form:select>
                </div>
                </div>
                <div class="col-md-5 ml-auto">
              		<h3>Quantity:</h3>
	                <div class="row">
	                  <div class="col">
	                    <input name="quantity" type="text" class="form-control"/>
	                  </div>
	                  <div class="col">
	                    <button type="submit" class="form-control">Submit</button>
	                  </div>
	                </div>
	              </div>
                
              </div>
            </div>
          </div>
        
      </form:form>
      
      <div class="col-md-3">
        		<form method="POST" action="/SpringMVCExample//billing">
              		<input type="submit" value="New Order" class="btn btn-secondary btn-block"/>
              	</form>	
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