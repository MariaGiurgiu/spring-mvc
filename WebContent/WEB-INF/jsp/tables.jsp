<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   	<style type="text/css">
		<%@ include file="../css/tables.css" %>
	</style>
    
	<title>Tables</title>
</head>
<body>
	<nav class="navbar navbar-light header" id="navbar">
      <a class="navbar-brand btn btn-outline-secondary" href="http://localhost:8080/SpringMVCExample/home">
        Home
      </a>
    </nav>
    <div class="container-fluid main-container d-flex align-items-center justify-content-center">
    	<form:form method="GET" action="/SpringMVCExample/tables">
				
			<div class="row d-flex justify-content-around">
	          <input class="btn mx-5" type="submit" value="1" name="table" id="table-one">
	          <input class="btn mx-5" type="submit" value="2" name="table" id="table-two">
	          <input class="btn mx-5" type="submit" value="3" name="table" id="table-three">
        	</div>
			
			<div class="row d-flex justify-content-around mt-3">
	          <input class="btn mx-5" type="submit" value="4" name="table" id="table-four">
	          <input class="btn mx-5" type="submit" value="5" name="table" id="table-five">
	          <input class="btn mx-5" type="submit" value="6" name="table" id="table-six">
        	</div>
        	
        	<div class="row d-flex justify-content-around mt-3">
	          <input class="btn mx-5" type="submit" value="7" name="table" id="table-seven">
	          <input class="btn mx-5" type="submit" value="8" name="table" id="table-eight">
	          <input class="btn mx-5" type="submit" value="9" name="table" id="table-nine">
        	</div>
        	
        	<div class="row d-flex justify-content-around mt-3">
	          <input class="btn mx-5" type="submit" value="10" name="table" id="table-ten">
	          <input class="btn mx-5" type="submit" value="11" name="table" id="table-eleven">
	          <input class="btn mx-5" type="submit" value="12" name="table" id="table-twelve">
        	</div>
        	
        	<!-- 
				<input type="submit" value="1" name="t"/>
	
				<input type="submit" value="2" name="t"/>
	
				<input type="submit" value="3" name="t"/>
		
				<input type="submit" value="4" name="t"/>
		
				<input type="submit" value="5" name="t"/>
			
				<input type="submit" value="6" name="t"/>
			
				<input type="submit" value="7" name="t"/>
		
				<input type="submit" value="8" name="t"/>
		
				<input type="submit" value="9" name="t"/>
	
				<input type="submit" value="10" name="t"/> -->
		
		</form:form>
    </div>
    
     <footer>
      <nav class="navbar navbar-light">
        <a class="btn btn-outline-secondary" href="http://localhost:8080/SpringMVCExample/logout">
          Log Out
        </a>
        
      </nav>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>