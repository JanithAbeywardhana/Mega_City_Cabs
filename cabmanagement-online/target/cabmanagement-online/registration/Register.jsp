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
    
}

.container {
    max-width: 400px;
    background: #ffffff;
    padding: 25px;
    border-radius: 10px;
   
    text-align: center;
}

.logo {
    width: 250px;
    display: block;
    margin: 0 auto 10px;
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
    align-items: center;
    width: 100%;
}

label {
    font-weight: 500;
    width: 80%;
    text-align: left;
    font-size: 0.9rem;
    margin-bottom: 3px; /* Reduced label spacing */
}

input[type="text"],
input[type="email"], 
input[type="password"] {
    width: 80%;
    padding: 8px;
    font-size: 0.9rem;
    margin-bottom: -15px; /* Reduced input field gap */
    border: 1px solid #ced4da;
    border-radius: 5px;
    transition: border-color 0.3s;
    
}

input:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.3);
}

input[type="submit"] {
    width: 80%;
    background-color: #007bff;
    color: white;
    font-size: 1rem;
    font-weight: 500;
    padding: 8px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    margin-top: 8px;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.login-link {
    margin-top: 10px;
    font-size: 0.85rem;
}

.login-link a {
    color: #007bff;
    text-decoration: none;
    font-weight: 500;
}

.login-link a:hover {
    text-decoration: underline;
}

</style>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
        <img src="../img/Reg1.png" class="logo" alt="Cab Service Logo">

<h1>Register New Customer</h1>
    <form action="registerCustomer" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address"><br><br>

        <label for="phone_number">Phone Number:</label>
        <input type="text" id="phone_number" name="phone_number"><br><br>
        
        <label for="nic">NIC:</label>
        <input type="text" id="nic" name="nic"><br><br>

        <input type="submit" value="Register">
    </form>
    
    <div class="login-link">
            Already have an account? <a href="login.jsp">Login</a>
        </div>
    </div>



    
    

</body>
</html>