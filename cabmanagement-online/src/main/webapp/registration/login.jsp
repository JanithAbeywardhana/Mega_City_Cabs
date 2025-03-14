<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
    :root {
      --primary-color: #3a7bd5;
      --secondary-color: #00d2ff;
      --dark-color: #333333;
      --light-color: #f8f9fa;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      margin: 0;
      padding: 20px;
    }
    
    .login-container {
      width: 100%;
      max-width: 900px;
      display: flex;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      overflow: hidden;
      position: relative;
      background: white;
    }
    
    .login-image {
      flex: 1;
      background-image: url('../img/DriveC.jpg');
      background-size: cover;
      background-position: center;
      position: relative;
      display: none;
    }
    
    .login-image::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.3);
    }
    
    .login-image-content {
      position: absolute;
      bottom: 40px;
      left: 40px;
      color: white;
      z-index: 2;
    }
    
    .login-image-content h2 {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .login-image-content p {
      font-size: 16px;
      max-width: 300px;
      opacity: 0.9;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }
    
    .login-form {
      flex: 1;
      padding: 40px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
    
    .login-logo {
      width: 200px;
      margin: 0 auto 30px;
      animation: fadeInDown 1s ease;
    }
    
    .login-header {
      text-align: center;
      margin-bottom: 30px;
      animation: fadeIn 1s ease;
    }
    
    .login-header h1 {
      font-size: 28px;
      font-weight: 600;
      color: var(--dark-color);
      margin-bottom: 10px;
    }
    
    .login-header p {
      color: #777;
      font-size: 15px;
    }
    
    .form-group {
      margin-bottom: 25px;
      position: relative;
      animation: fadeInUp 0.8s ease;
      animation-fill-mode: both;
    }
    
    .form-group:nth-child(1) {
      animation-delay: 0.2s;
    }
    
    .form-group:nth-child(2) {
      animation-delay: 0.4s;
    }
    
    .form-group label {
      display: block;
      font-size: 14px;
      font-weight: 500;
      color: #555;
      margin-bottom: 8px;
    }
    
    .input-group {
      position: relative;
    }
    
    .input-icon {
      position: absolute;
      top: 50%;
      left: 15px;
      transform: translateY(-50%);
      color: #999;
      z-index: 10;
    }
    
    .form-control {
      height: 50px;
      border: 1px solid #e0e0e0;
      border-radius: 50px;
      padding: 10px 20px 10px 45px;
      font-size: 15px;
      transition: all 0.3s;
      width: 100%;
      box-shadow: none;
    }
    
    .form-control:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 10px rgba(58, 123, 213, 0.1);
    }
    
    .forgot-password {
      text-align: right;
      margin-top: -15px;
      margin-bottom: 20px;
      font-size: 14px;
      animation: fadeIn 1s ease 0.6s both;
    }
    
    .forgot-password a {
      color: var(--primary-color);
      text-decoration: none;
      transition: all 0.3s;
    }
    
    .forgot-password a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }
    
    .login-btn {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      border: none;
      border-radius: 50px;
      height: 50px;
      font-size: 16px;
      font-weight: 500;
      width: 100%;
      cursor: pointer;
      transition: all 0.3s;
      margin-bottom: 20px;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      animation: fadeInUp 1s ease 0.6s both;
    }
    
    .login-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.4);
    }
    
    .login-btn:active {
      transform: translateY(0);
    }
    
    .divider {
      display: flex;
      align-items: center;
      margin: 30px 0;
      animation: fadeIn 1s ease 0.8s both;
    }
    
    .divider-line {
      flex-grow: 1;
      height: 1px;
      background-color: #e0e0e0;
    }
    
    .divider-text {
      padding: 0 15px;
      color: #999;
      font-size: 13px;
    }
    
    .social-login {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-bottom: 30px;
      animation: fadeInUp 1s ease 1s both;
    }
    
    .social-btn {
      display: flex;
      align-items: center;
      justify-content: center;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: #f8f9fa;
      color: #555;
      border: 1px solid #e0e0e0;
      transition: all 0.3s;
      font-size: 20px;
    }
    
    .social-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.07);
    }
    
    .social-btn.facebook {
      color: #3b5998;
    }
    
    .social-btn.google {
      color: #db4437;
    }
    
    .social-btn.apple {
      color: #000;
    }
    
    .signup {
      text-align: center;
      font-size: 14px;
      color: #777;
      animation: fadeIn 1s ease 1.2s both;
    }
    
    .signup a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
    }
    
    .signup a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }
    
    
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    @keyframes fadeInDown {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    
    @keyframes float {
      0% { transform: translateY(0px); }
      50% { transform: translateY(-10px); }
      100% { transform: translateY(0px); }
    }
    
    .login-logo {
      animation: float 6s ease-in-out infinite;
    }
    
    
    @media (min-width: 768px) {
      .login-image {
        display: block;
      }
    }
    
    @media (max-width: 767px) {
      .login-container {
        max-width: 400px;
      }
      
      .login-form {
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-image">
      <div class="login-image-content">
        <h2>Welcome Back!</h2>
        <p>Book your ride in seconds and enjoy a seamless travel experience with us.</p>
      </div>
    </div>
    
    <div class="login-form">
      <img src="../img/RLog1.png" class="login-logo" alt="Cab Service Logo">
      
      <div class="login-header">
        <h1>Sign In</h1>
        <p>Welcome back! Please enter your credentials</p>
      </div>
      
      <form action="login" method="post">
        <div class="form-group">
          <label for="email">Email Address</label>
          <div class="input-group">
            <i class="fas fa-envelope input-icon"></i>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
          </div>
        </div>
        
        <div class="form-group">
          <label for="password">Password</label>
          <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
          </div>
        </div>
        
        <div class="forgot-password">
          <a href="#">Forgot Password?</a>
        </div>
        
        <button type="submit" class="login-btn">Sign In</button>
      </form>
      
      <div class="divider">
        <div class="divider-line"></div>
        <div class="divider-text">OR CONTINUE WITH</div>
        <div class="divider-line"></div>
      </div>
      
      <div class="social-login">
        <a href="#" class="social-btn google">
          <i class="fab fa-google"></i>
        </a>
        <a href="#" class="social-btn facebook">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#" class="social-btn apple">
          <i class="fab fa-apple"></i>
        </a>
      </div>
      
      <div class="signup">
        Don't have an account? <a href="Register.jsp">Sign Up</a>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>



</body>
</html>