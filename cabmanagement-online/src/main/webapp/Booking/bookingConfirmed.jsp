<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
      --accent-color: #20bf6b;
      --dark-color: #333333;
      --light-color: #f8f9fa;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      min-height: 100vh;
      margin: 0;
      padding: 40px 20px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .confirmation-container {
      width: 100%;
      max-width: 850px;
      background: white;
      border-radius: 15px;
      box-shadow: 0 15px 50px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      position: relative;
      animation: fadeIn 0.8s ease;
    }
    
    .confirmation-header {
      background: var(--dark-color);
      padding: 30px;
      text-align: center;
      color: white;
      position: relative;
    }
    
    .confirmation-header h2 {
      font-size: 28px;
      font-weight: 600;
      margin-bottom: 15px;
      animation: fadeInDown 0.8s ease 0.2s both;
    }
    
    .confirmation-header p {
      margin-bottom: 20px;
      font-size: 16px;
      opacity: 0.9;
      animation: fadeInDown 0.8s ease 0.4s both;
    }
    
    .reference-no {
      display: inline-block;
      font-size: 18px;
      font-weight: 600;
      padding: 10px 20px;
      background: rgba(255, 255, 255, 0.15);
      border-radius: 30px;
      margin-top: 5px;
      animation: fadeInUp 0.8s ease 0.6s both;
    }
    
    .success-checkmark {
      width: 80px;
      height: 80px;
      margin: 0 auto 20px;
      border-radius: 50%;
      background: var(--accent-color);
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 35px;
      color: white;
      box-shadow: 0 5px 15px rgba(32, 191, 107, 0.3);
      animation: zoomIn 0.8s cubic-bezier(0.18, 0.89, 0.32, 1.28);
    }
    
    .confirmation-content {
      padding: 40px;
      animation: fadeIn 1s ease 0.6s both;
    }
    
    .detail-section {
      background: #f9fbff;
      border-radius: 12px;
      padding: 25px;
      margin-bottom: 25px;
      border: 1px solid #eef2f7;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }
    
    .detail-section:hover {
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      transform: translateY(-2px);
    }
    
    .detail-section::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
    }
    
    .detail-section h5 {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 15px;
      color: var(--dark-color);
      padding-left: 10px;
      display: flex;
      align-items: center;
    }
    
    .detail-section h5 i {
      margin-right: 10px;
      color: var(--primary-color);
    }
    
    .detail-section p {
      margin-bottom: 12px;
      display: flex;
      align-items: center;
    }
    
    .detail-section p:last-child {
      margin-bottom: 0;
    }
    
    .detail-section p strong {
      min-width: 140px;
      display: inline-block;
      color: #555;
    }
    
    .detail-value {
      color: var(--dark-color);
      font-weight: 500;
    }
    
    .actions {
      display: flex;
      justify-content: center;
      gap: 15px;
      margin-top: 30px;
      animation: fadeInUp 0.8s ease 1s both;
    }
    
    .btn-primary {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border: none;
      border-radius: 50px;
      padding: 12px 25px;
      font-size: 16px;
      font-weight: 500;
      color: white;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      transition: all 0.3s;
    }
    
    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.4);
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
    }
    
    .btn-secondary {
      background: #f0f2f5;
      border: none;
      border-radius: 50px;
      padding: 12px 25px;
      font-size: 16px;
      font-weight: 500;
      color: #555;
      transition: all 0.3s;
    }
    
    .btn-secondary:hover {
      background: #e4e7ea;
      color: var(--dark-color);
      transform: translateY(-2px);
    }
    
    .btn i {
      margin-right: 8px;
    }
    
    .status-badge {
      display: inline-block;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 14px;
      font-weight: 500;
      background: rgba(32, 191, 107, 0.1);
      color: var(--accent-color);
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
    
    @keyframes zoomIn {
      from { opacity: 0; transform: scale(0.5); }
      to { opacity: 1; transform: scale(1); }
    }
    
   
    @media (max-width: 768px) {
      .confirmation-container {
        margin: 20px;
      }
      
      .confirmation-content {
        padding: 25px;
      }
      
      .actions {
        flex-direction: column;
      }
      
      .btn {
        width: 100%;
      }
    }
  </style>
</head>
<body>
  <div class="confirmation-container">
    <div class="confirmation-header">
      <div class="success-checkmark">
        <i class="fas fa-check"></i>
      </div>
      <h2>Booking Confirmed</h2>
      <p>Dear Mr/Ms <strong>${booking.customerName}</strong>, we are pleased to inform you that your booking has been successfully confirmed.</p>
      <span class="reference-no">
        <i class="fas fa-ticket-alt me-2"></i> 
        Reference No: BJL0602
      </span>
    </div>
    
    <div class="confirmation-content">
      <div class="detail-section">
        <h5><i class="fas fa-info-circle"></i> Booking Details</h5>
        <p>
          <strong>Vehicle Type:</strong>
          <span class="detail-value">${booking.vehicleType}</span>
        </p>
        <p>
          <strong>Pickup Location:</strong>
          <span class="detail-value">${booking.pickupLocation}</span>
        </p>
        <p>
          <strong>Drop Location:</strong>
          <span class="detail-value">${booking.dropLocation}</span>
        </p>
        <p>
          <strong>Booking Date & Time:</strong>
          <span class="detail-value">${booking.bookingDate} ${booking.bookingTime}</span>
        </p>
      </div>
      
      <div class="detail-section">
        <h5><i class="fas fa-file-alt"></i> Other Details</h5>
        <p>
          <strong>Contact Number:</strong>
          <span class="detail-value">+94 765434683</span>
        </p>
        <p>
          <strong>Payment Method:</strong>
          <span class="detail-value">Cash</span>
        </p>
        <p>
          <strong>Estimated Total:</strong>
          <span class="detail-value">LKR ${booking.fare}</span>
        </p>
        <p>
          <strong>Ride Status:</strong>
          <span class="status-badge">
            <i class="fas fa-clock me-1"></i>
            Pending
          </span>
        </p>
      </div>
      
      <div class="actions">
        <a href="${pageContext.request.contextPath}/customer/downloadBookingPDF?bookingId=${booking.bookingId}" class="btn btn-secondary">
          <i class="fas fa-download"></i> Download Details
        </a>
        <a href="${pageContext.request.contextPath}/customer/dashboard.jsp" class="btn btn-primary">
          <i class="fas fa-home"></i> Go Home
        </a>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>