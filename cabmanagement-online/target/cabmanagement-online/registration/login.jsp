<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    max-width: 350px; /* Reduced width */
    background: #ffffff;
    padding: 25px;
    border-radius: 10px;
    
    text-align: center; /* Center text */
}

.logo {
    width: 250px;
    display: block;
    margin: 0 auto 15px;
}

h1 {
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center; /* Center form elements */
    width: 100%;
}

label {
    font-weight: 500;
    width: 80%; /* Align labels with input width */
    text-align: left;
    font-size: 0.9rem;
    margin-bottom: 5px;
}

input[type="email"], 
input[type="password"] {
    width: 80%; 
    padding: 8px;
    font-size: 0.9rem;
    margin-bottom: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    transition: border-color 0.3s;
    
}

input[type="email"]:focus, 
input[type="password"]:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.3);
}

.forgot-password {
    display: block;
    text-align: center; /* Center forgot password link */
    font-size: 0.85rem;
    width: 80%;
    margin-bottom: 10px;
    color: #007bff;
    text-decoration: none;
}

.forgot-password:hover {
    text-decoration: underline;
}

input[type="submit"] {
    width: 80%; /* Reduce button width */
    background-color: #007bff;
    color: white;
    font-size: 0.9rem;
    font-weight: 500;
    padding: 8px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.signup {
    margin-top: 10px;
    font-size: 0.85rem;
    text-align: center; /* Center signup text */
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
<img src="../img/RLog1.png" class="logo" alt="Cab Service Logo">

<h1>Sign In</h1>
   <form action="login" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <a href="#" class="forgot-password">Forgot Password?</a>

        <input type="submit" value="Login">
    </form> 
    
    <div class="signup">
            Didn’t have an account? <a href="Register.jsp">SignUp</a>
        </div>
    </div>



</body>
</html>