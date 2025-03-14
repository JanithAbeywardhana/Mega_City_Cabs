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
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 900px;
      display: flex;
      position: relative;
    }
    
    .login-image {
      flex: 1;
      background-image: url('../img/TravelGirl.jpg');
      background-size: cover;
      background-position: center;
      display: none;
    }
    
    .login-form {
      flex: 1;
      padding: 40px;
      position: relative;
    }
    
    .login-header {
      margin-bottom: 40px;
      text-align: center;
    }
    
    .login-header h1 {
      color: var(--dark-color);
      font-weight: 600;
      margin-bottom: 10px;
      font-size: 28px;
    }
    
    .login-header p {
      color: #777;
      font-size: 14px;
    }
    
    .form-floating {
      margin-bottom: 20px;
    }
    
    .form-floating input {
      border: none;
      border-bottom: 2px solid #eee;
      border-radius: 0;
      padding: 12px 0;
      font-size: 15px;
      height: auto;
      box-shadow: none !important;
    }
    
    .form-floating input:focus {
      border-color: var(--primary-color);
    }
    
    .form-floating label {
      padding-left: 0;
      font-size: 14px;
      color: #999;
    }
    
    .login-btn {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border: none;
      border-radius: 30px;
      padding: 12px;
      font-size: 16px;
      font-weight: 500;
      letter-spacing: 0.5px;
      color: white;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      transition: all 0.3s;
    }
    
    .login-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 7px 20px rgba(58, 123, 213, 0.4);
    }
    
    .login-btn:active {
      transform: translateY(0);
    }
    
    .input-group-text {
      background: transparent;
      border: none;
      border-bottom: 2px solid #eee;
      border-radius: 0;
      color: #999;
      padding-right: 0;
    }
    
    .password-toggle:hover {
      color: var(--primary-color);
      cursor: pointer;
    }
    
    .signup {
      margin-top: 25px;
      text-align: center;
      font-size: 14px;
      color: #777;
    }
    
    .signup a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
    }
    
    .signup a:hover {
      color: var(--secondary-color);
    }
    
    .divider {
      display: flex;
      align-items: center;
      margin: 30px 0;
    }
    
    .divider-line {
      flex-grow: 1;
      height: 1px;
      background-color: #eee;
    }
    
    .divider-text {
      padding: 0 15px;
      color: #999;
      font-size: 12px;
    }
    
    .social-login {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-bottom: 20px;
    }
    
    .social-btn {
      width: 45px;
      height: 45px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      border: 1px solid #eee;
      color: #555;
      transition: all 0.3s;
    }
    
    .social-btn:hover {
      background-color: #f5f5f5;
      transform: translateY(-2px);
    }
    
    /* Animation */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .login-form {
      animation: fadeIn 0.8s ease forwards;
    }
    
    /* Responsive styles */
    @media (min-width: 768px) {
      .login-image {
        display: block;
      }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <div class="login-image"></div>
    <div class="login-form">
      <div class="login-header">
        <h1>Driver Login</h1>
        <p>Welcome back! Please enter your credentials to continue</p>
      </div>
      
      <form action="driverLog" method="post">
        <div class="form-floating mb-3">
          <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
          <label for="email"><i class="fas fa-envelope me-2"></i>Email Address</label>
        </div>
        
        <div class="input-group mb-4">
          <div class="form-floating flex-grow-1">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
          </div>
          <span class="input-group-text password-toggle">
            <i class="far fa-eye" id="togglePassword"></i>
          </span>
        </div>
        
        <div class="d-flex justify-content-between mb-4">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="rememberMe">
            <label class="form-check-label" for="rememberMe" style="font-size: 14px; color: #777;">
              Remember me
            </label>
          </div>
          <a href="#" style="font-size: 14px; color: var(--primary-color); text-decoration: none;">Forgot password?</a>
        </div>
        
        <button type="submit" class="btn login-btn w-100">Login</button>
      </form>
      
      <div class="divider">
        <div class="divider-line"></div>
        <div class="divider-text">OR CONTINUE WITH</div>
        <div class="divider-line"></div>
      </div>
      
      <div class="social-login">
        <a href="#" class="social-btn"><i class="fab fa-google"></i></a>
        <a href="#" class="social-btn"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-btn"><i class="fab fa-apple"></i></a>
      </div>
      
      <div class="signup">
        Don't have an account? <a href="DRegister.jsp">Sign Up</a>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
      const passwordInput = document.getElementById('password');
      const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
      passwordInput.setAttribute('type', type);
      
      // Toggle eye icon
      this.classList.toggle('fa-eye');
      this.classList.toggle('fa-eye-slash');
    });
  </script>

</body>
</html>