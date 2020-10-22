<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/slate/bootstrap.min.css" integrity="sha384-8iuq0iaMHpnH2vSyvZMSIqQuUnQA7QM+f6srIdlgBrTSEyd//AWNMyEaSF2yPzNQ" crossorigin="anonymous">
</head>
	<body>
	    <h1 class="d-flex justify-content-center">Spring Security 5</h1>
	    <c:if test="${not empty errorMsg}"><div class="d-flex justify-content-center alert-danger" style="color:white;font-weight: bold; margin: 10px 0px;">${errorMsg}</div></c:if>
	    <c:if test="${not empty msg}"><div class="d-flex justify-content-center alert-success" style="color:white; font-weight: bold; margin: 10px 0px;">${msg}</div></c:if>
		 <div class="row">
		 	<div class="container">
		    <form name='login' action="/login" method='POST'>
		        <div>
			        <div class="d-flex justify-content-center"><input type='text' name='username' placeholder='Username'></div>
			        <div class="d-flex justify-content-center"><input type='password' name='password' placeholder="Password" /></div>
			        <div class="d-flex justify-content-center"><input name="submit" type="submit" value="submit" /></div>
		        </div>
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		    </form>
		    </div>
		</div>
	</body>
</html>