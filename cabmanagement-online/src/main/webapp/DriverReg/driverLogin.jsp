<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>


body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;

    margin: 0;
}


.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


.login-container {
    background: white;
    padding: 30px;
    border-radius: 10px;
   
    width: 100%;
    max-width: 850px;
}


.form-label {
    font-weight: bold;
}


.form-control {
    border-radius: 5px;
    border: 1px solid #ced4da;
    font-size: 14px;
    transition: all 0.3s;
}

.form-control:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
}


.btn-primary {
    background-color: #007bff;
    border: none;
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary:hover {
    background-color: #0056b3;
}


.text-danger {
    font-size: 14px;
}

.signup {
    margin-top: 10px;
    font-size: 0.85rem;
    text-align: center; 
}

.signup a {
    color: #007bff;
    text-decoration: none;
    font-weight: 500;
}

.signup a:hover {
    text-decoration: underline;
}

</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="login-container">
        <h1 class="text-center">Driver Login</h1>
        <p class="text-muted text-center">Enter your credentials to log in</p>

        <form action="driverLog" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>
        </form>

        <div class="signup">
            Didn’t have an account? <a href="DRegister.jsp">SignUp</a>
        </div>
    </div>
        
    </div>
</div>

</body>
</html>