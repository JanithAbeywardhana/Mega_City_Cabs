<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
        <style>
        /* Centering the form */
        .login-container {
            max-width: 400px;
            margin: 80px auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            
            text-align: center;
        }

        /* Styling the heading */
        .login-container h2 {
            font-weight: 700;
            color: #333;
            margin-bottom: 15px;
        }

        /* Image styling */
        .login-image {
            width: 120px;
            height: auto;
            margin-bottom: 15px;
        }

        /* Form input styles */
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
        }

        .login-container input[type="text"]:focus,
        .login-container input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        /* Submit button */
        .login-container input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #007bff;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .login-container input[type="submit"]:hover {
            background: #0056b3;
        }
    </style>
</head>
<body class="bg-light">

<div class="login-container">
    <h2>Admin Login</h2>
    <!-- Image below the heading -->
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin Icon" class="login-image">

    <form action="login" method="post">
        <input type="text" name="username" placeholder="Enter your username" required>
        <input type="password" name="password" placeholder="Enter your password" required>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>