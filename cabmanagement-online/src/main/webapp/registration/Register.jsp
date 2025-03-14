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
    
    .registration-container {
      width: 100%;
      max-width: 900px;
      display: flex;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      border-radius: 15px;
      overflow: hidden;
      position: relative;
      background: white;
    }
    
    .registration-image {
      flex: 1;
      background-image: url('../img/car1.jpg');
      background-size: cover;
      background-position: center;
      position: relative;
      display: none;
    }
    
    .registration-image::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.3);
    }
    
    .registration-image-content {
      position: absolute;
      bottom: 40px;
      left: 40px;
      color: white;
      z-index: 2;
    }
    
    .registration-image-content h2 {
      font-size: 28px;
      font-weight: 700;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .registration-image-content p {
      font-size: 16px;
      max-width: 300px;
      opacity: 0.9;
      text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
    }
    
    .registration-form {
      flex: 1;
      padding: 40px;
      overflow: auto;
      max-height: 100vh;
    }
    
    .registration-logo {
      width: 180px;
      margin: 0 auto 20px;
      display: block;
      animation: fadeInDown 1s ease;
    }
    
    .registration-header {
      text-align: center;
      margin-bottom: 25px;
      animation: fadeIn 1s ease;
    }
    
    .registration-header h1 {
      font-size: 26px;
      font-weight: 600;
      color: var(--dark-color);
      margin-bottom: 10px;
    }
    
    .registration-header p {
      color: #777;
      font-size: 15px;
    }
    
    .form-section {
      margin-bottom: 15px;
      animation: fadeInUp 0.8s ease;
      animation-fill-mode: both;
    }
    
    .form-section:nth-child(1) {
      animation-delay: 0.1s;
    }
    
    .form-section:nth-child(2) {
      animation-delay: 0.2s;
    }
    
    .form-section:nth-child(3) {
      animation-delay: 0.3s;
    }
    
    .form-section:nth-child(4) {
      animation-delay: 0.4s;
    }
    
    .form-section:nth-child(5) {
      animation-delay: 0.5s;
    }
    
    .form-section:nth-child(6) {
      animation-delay: 0.6s;
    }
    
    .form-label {
      display: block;
      font-size: 14px;
      font-weight: 500;
      color: #555;
      margin-bottom: 6px;
    }
    
    .input-group {
      position: relative;
      margin-bottom: 20px;
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
      height: 48px;
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
    
    .register-btn {
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
      margin-top: 10px;
      margin-bottom: 20px;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      animation: fadeInUp 1s ease 0.7s both;
    }
    
    .register-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.4);
    }
    
    .register-btn:active {
      transform: translateY(0);
    }
    
    .login-link {
      text-align: center;
      font-size: 14px;
      color: #777;
      animation: fadeIn 1s ease 0.8s both;
    }
    
    .login-link a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 600;
      transition: all 0.3s;
    }
    
    .login-link a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }
    
    .form-text {
      font-size: 12px;
      color: #999;
      margin-top: -15px;
      margin-bottom: 5px;
      display: block;
    }
    
    .progress-container {
      margin-bottom: 20px;
      animation: fadeIn 1s ease;
    }
    
    .progress {
      height: 8px;
      border-radius: 4px;
      background-color: #eef2f7;
      overflow: hidden;
    }
    
    .progress-bar {
      background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
      border-radius: 4px;
    }
    
    /* Animations */
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
    
    /* Floating animation for logo */
    @keyframes float {
      0% { transform: translateY(0px); }
      50% { transform: translateY(-8px); }
      100% { transform: translateY(0px); }
    }
    
    .registration-logo {
      animation: float 6s ease-in-out infinite;
    }
    
    /* Responsive styles */
    @media (min-width: 768px) {
      .registration-image {
        display: block;
      }
    }
    
    @media (max-width: 767px) {
      .registration-container {
        max-width: 450px;
      }
      
      .registration-form {
        padding: 30px 20px;
      }
    }
    
    /* Hide scrollbar but allow scrolling */
    .registration-form::-webkit-scrollbar {
      width: 0;
      height: 0;
    }
  </style>
</head>
<body>
  <div class="registration-container">
    <div class="registration-image">
      <div class="registration-image-content">
        <h2>Join Our Community</h2>
        <p>Sign up today and enjoy convenient rides at affordable prices anywhere in the city.</p>
      </div>
    </div>
    
    <div class="registration-form">
      <img src="../img/Reg1.png" class="registration-logo" alt="Cab Service Logo">
      
      <div class="registration-header">
        <h1>Create Your Account</h1>
        <p>Start your journey with us today</p>
      </div>
      
      <div class="progress-container">
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
      </div>
      
      <form action="registerCustomer" method="post" id="registrationForm">
        <div class="form-section" data-section="1">
          <div class="input-group">
            <i class="fas fa-user input-icon"></i>
            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
          </div>
          
          <div class="input-group">
            <i class="fas fa-envelope input-icon"></i>
            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email address" required>
            <small class="form-text">We'll never share your email with anyone else.</small>
          </div>
          
          <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required>
            <small class="form-text">Use at least 8 characters with a mix of letters, numbers & symbols.</small>
          </div>
          
          <div class="input-group">
            <i class="fas fa-home input-icon"></i>
            <input type="text" id="address" name="address" class="form-control" placeholder="Enter your address">
          </div>
          
          <div class="input-group">
            <i class="fas fa-phone input-icon"></i>
            <input type="text" id="phone_number" name="phone_number" class="form-control" placeholder="Enter your phone number">
          </div>
          
          <div class="input-group">
            <i class="fas fa-id-card input-icon"></i>
            <input type="text" id="nic" name="nic" class="form-control" placeholder="Enter your NIC number">
          </div>
        </div>
        
        <button type="submit" class="register-btn">
          <i class="fas fa-user-plus me-2"></i> Create Account
        </button>
      </form>
      
      <div class="login-link">
        Already have an account? <a href="login.jsp">Sign In</a>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    
    const form = document.getElementById('registrationForm');
    const inputs = form.querySelectorAll('input');
    const progressBar = document.querySelector('.progress-bar');
    
    function updateProgress() {
      const totalFields = inputs.length;
      let filledFields = 0;
      
      inputs.forEach(input => {
        if (input.value.trim() !== '') {
          filledFields++;
        }
      });
      
      const progressPercentage = (filledFields / totalFields) * 100;
      progressBar.style.width = progressPercentage + '%';
      progressBar.setAttribute('aria-valuenow', progressPercentage);
    }
    
    inputs.forEach(input => {
      input.addEventListener('input', updateProgress);
    });
  </script>
  
</body>
</html>