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
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      width: 100%;
      max-width: 950px;
      display: flex;
      position: relative;
    }
    
    .registration-image {
      flex: 1;
      background-image: url('../img/Ridee.jpg');
      background-size: cover;
      background-position: center;
      display: none;
    }
    
    .registration-form {
      flex: 1;
      padding: 40px;
      position: relative;
    }
    
    .form-header {
      margin-bottom: 30px;
      text-align: center;
    }
    
    .form-header h2 {
      color: var(--dark-color);
      font-weight: 600;
      margin-bottom: 10px;
      font-size: 28px;
    }
    
    .form-header p {
      color: #777;
      font-size: 14px;
    }
    
    .form-floating {
      margin-bottom: 20px;
    }
    
    .form-control {
      border: none;
      border-bottom: 2px solid #eee;
      border-radius: 0;
      padding: 12px 10px;
      font-size: 15px;
      height: auto;
      box-shadow: none !important;
    }
    
    .form-control:focus {
      border-color: var(--primary-color);
    }
    
    .form-label {
      font-size: 14px;
      color: #555;
      font-weight: 500;
      margin-bottom: 5px;
    }
    
    .submit-btn {
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
      margin-top: 15px;
    }
    
    .submit-btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 7px 20px rgba(58, 123, 213, 0.4);
    }
    
    .submit-btn:active {
      transform: translateY(0);
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
    
    /* Custom radio buttons */
    .custom-radio {
      display: flex;
      flex-wrap: wrap;
      gap: 10px;
      margin-bottom: 20px;
    }
    
    .radio-item {
      flex: 1;
      min-width: 90px;
    }
    
    .radio-item input[type="radio"] {
      display: none;
    }
    
    .radio-item label {
      display: block;
      padding: 10px;
      text-align: center;
      border: 2px solid #eee;
      border-radius: 8px;
      cursor: pointer;
      transition: all 0.3s;
      font-size: 14px;
      color: #555;
    }
    
    .radio-item input[type="radio"]:checked + label {
      background-color: rgba(58, 123, 213, 0.1);
      border-color: var(--primary-color);
      color: var(--primary-color);
    }
    
    .radio-item label:hover {
      border-color: #ccc;
    }
    
    .form-section {
      margin-bottom: 10px;
    }
    
    .form-divider {
      height: 1px;
      background-color: #eee;
      margin: 25px 0;
    }
    
    .input-group {
      position: relative;
      margin-bottom: 20px;
    }
    
    .input-icon {
      position: absolute;
      top: 50%;
      left: 10px;
      transform: translateY(-50%);
      color: #999;
      z-index: 10;
    }
    
    .input-with-icon {
      padding-left: 35px;
    }
    
    /* Animation */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .registration-form {
      animation: fadeIn 0.8s ease forwards;
    }
    
    .form-section-title {
      font-size: 16px;
      font-weight: 600;
      color: #555;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
    }
    
    .form-section-title i {
      margin-right: 8px;
      color: var(--primary-color);
    }
    
    /* Responsive styles */
    @media (min-width: 992px) {
      .registration-image {
        display: block;
      }
    }
    
    @media (max-width: 768px) {
      .registration-form {
        padding: 25px;
      }
      
      .custom-radio {
        flex-direction: column;
      }
      
      .radio-item {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="registration-container">
    <div class="registration-image"></div>
    <div class="registration-form">
      <div class="form-header">
        <h2>Create Your Account</h2>
        <p>Join our driver community and start your journey today</p>
      </div>
      
      <form action="registerDriver" method="post">
        <div class="form-section">
          <div class="form-section-title">
            <i class="fas fa-user-circle"></i> Personal Information
          </div>
          
          <div class="input-group">
            <i class="fas fa-user input-icon"></i>
            <input type="text" id="name" name="name" class="form-control input-with-icon" placeholder="Full Name" required>
          </div>
          
          <div class="input-group">
            <i class="fas fa-envelope input-icon"></i>
            <input type="email" id="email" name="email" class="form-control input-with-icon" placeholder="Email Address" required>
          </div>
          
          <div class="input-group">
            <i class="fas fa-home input-icon"></i>
            <input type="text" id="address" name="address" class="form-control input-with-icon" placeholder="Residential Address" required>
          </div>
          
          <label class="form-label mt-3">Gender:</label>
          <div class="custom-radio">
            <div class="radio-item">
              <input type="radio" id="male" name="gender" value="Male" required>
              <label for="male"><i class="fas fa-mars me-1"></i> Male</label>
            </div>
            <div class="radio-item">
              <input type="radio" id="female" name="gender" value="Female" required>
              <label for="female"><i class="fas fa-venus me-1"></i> Female</label>
            </div>
            <div class="radio-item">
              <input type="radio" id="other" name="gender" value="Other" required>
              <label for="other"><i class="fas fa-transgender me-1"></i> Other</label>
            </div>
          </div>
        </div>
        
        <div class="form-divider"></div>
        
        <div class="form-section">
          <div class="form-section-title">
            <i class="fas fa-id-card"></i> Driver Details
          </div>
          
          <div class="input-group">
            <i class="fas fa-id-badge input-icon"></i>
            <input type="text" id="license_number" name="license_number" class="form-control input-with-icon" placeholder="License Number" required>
          </div>
          
          <label class="form-label">Preferred Ride Time:</label>
          <div class="custom-radio">
            <div class="radio-item">
              <input type="radio" id="day" name="ride_time" value="day" required>
              <label for="day"><i class="fas fa-sun me-1"></i> Day</label>
            </div>
            <div class="radio-item">
              <input type="radio" id="night" name="ride_time" value="night" required>
              <label for="night"><i class="fas fa-moon me-1"></i> Night</label>
            </div>
          </div>
        </div>
        
        <div class="form-divider"></div>
        
        <div class="form-section">
          <div class="form-section-title">
            <i class="fas fa-lock"></i> Security
          </div>
          
          <div class="input-group">
            <i class="fas fa-key input-icon"></i>
            <input type="password" id="password" name="password" class="form-control input-with-icon" placeholder="Create Password" required>
          </div>
          
          <div class="input-group">
            <i class="fas fa-key input-icon"></i>
            <input type="password" id="confirm_password" name="confirm_password" class="form-control input-with-icon" placeholder="Confirm Password" required>
          </div>
          <small class="text-muted">Password must be at least 8 characters with letters and numbers</small>
        </div>
        
        <div class="d-grid">
          <button type="submit" class="btn submit-btn">Create Account</button>
        </div>
      </form>
      
      <div class="signup">
        Already have an account? <a href="driverLogin.jsp">Sign In</a>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script>
    // Form validation
    const form = document.querySelector('form');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirm_password');
    
    form.addEventListener('submit', function(event) {
      if (password.value !== confirmPassword.value) {
        event.preventDefault();
        alert('Passwords do not match');
      }
    });
  </script>

</body>
</html>