<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #4361ee;
      --secondary-color: #3f37c9;
      --accent-color: #f72585;
      --light-color: #f8f9fa;
      --dark-color: #212529;
    }
    
    body {
      background-color: #f0f2f5;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .earnings-container {
      max-width: 700px;
      margin: 80px auto;
      text-align: center;
      padding: 40px;
      background-color: white;
      border-radius: 16px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      position: relative;
      overflow: hidden;
    }
    
    .earnings-container::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 8px;
      background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
    }
    
    .earnings-container h1 {
      font-size: 2.2rem;
      font-weight: 700;
      margin-bottom: 40px;
      color: var(--dark-color);
      position: relative;
      display: inline-block;
    }
    
    .earnings-container h1::after {
      content: "";
      position: absolute;
      bottom: -10px;
      left: 25%;
      width: 50%;
      height: 4px;
      background-color: var(--primary-color);
      border-radius: 2px;
    }
    
    .earnings-card {
      background: linear-gradient(145deg, #ffffff, #f0f0f0);
      padding: 30px;
      border-radius: 12px;
      margin-bottom: 30px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
      border-left: 4px solid var(--primary-color);
    }
    
    .earnings-amount {
      font-size: 2.5rem;
      font-weight: 800;
      color: var(--primary-color);
      margin-bottom: 5px;
      text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
    }
    
    .earnings-label {
      font-size: 1rem;
      color: #6c757d;
      margin-bottom: 0;
    }
    
    .icon-circle {
      width: 60px;
      height: 60px;
      background-color: var(--light-color);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border: 2px solid var(--primary-color);
    }
    
    .icon-circle i {
      font-size: 1.8rem;
      color: var(--primary-color);
    }
    
    .btn {
      padding: 12px 24px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 1px;
      border-radius: 8px;
      margin: 10px;
      transition: all 0.3s ease;
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
      box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
    }
    
    .btn-primary:hover {
      background-color: var(--secondary-color);
      border-color: var(--secondary-color);
      transform: translateY(-2px);
      box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
    }
    
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
      box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
    }
    
    .btn-secondary:hover {
      background-color: #5a6268;
      border-color: #5a6268;
      transform: translateY(-2px);
      box-shadow: 0 6px 15px rgba(108, 117, 125, 0.4);
    }
    
    .btn i {
      margin-right: 8px;
    }
    
    .actions-container {
      margin-top: 20px;
    }
    
    @media (max-width: 576px) {
      .earnings-container {
        margin: 40px auto;
        padding: 25px;
      }
      
      .earnings-amount {
        font-size: 2rem;
      }
      
      .btn {
        display: block;
        width: 100%;
        margin: 10px 0;
      }
    }
  </style>
</head>
<body>
  <div class="container earnings-container">
    <h1>Driver Earnings Report</h1>
    
    <div class="icon-circle">
      <i class="fas fa-money-bill-wave"></i>
    </div>
    
    <div class="earnings-card">
      <p class="earnings-amount">Rs. ${earnings}</p>
      <p class="earnings-label">Total Earnings</p>
    </div>
    
    <div class="actions-container">
      <a href="${pageContext.request.contextPath}/driver/downloadEarningsPDF" class="btn btn-primary">
        <i class="fas fa-file-pdf"></i> Download PDF Report
      </a>
      <a href="${pageContext.request.contextPath}/driver/dashboard.jsp" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
      </a>
    </div>
  </div>

  <!-- Bootstrap JS Bundle (with Popper) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>


</body>
</html>