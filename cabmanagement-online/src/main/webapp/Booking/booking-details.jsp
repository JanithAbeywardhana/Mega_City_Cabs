<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    }
    
    .checkout-container {
      max-width: 1200px;
      margin: 0 auto;
      background: white;
      border-radius: 15px;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      animation: fadeIn 0.8s ease;
    }
    
    .checkout-header {
      background: var(--dark-color);
      color: white;
      padding: 30px;
      text-align: center;
      position: relative;
    }
    
    .checkout-logo {
      height: 100px;
      margin-bottom: 20px;
      filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.3));
      animation: fadeInDown 0.8s ease;
    }
    
    .checkout-header h1 {
      font-size: 32px;
      font-weight: 600;
      margin-bottom: 15px;
      animation: fadeInDown 0.8s ease 0.2s both;
    }
    
    .checkout-header p {
      font-size: 16px;
      opacity: 0.9;
      max-width: 800px;
      margin: 0 auto 20px;
      animation: fadeInDown 0.8s ease 0.4s both;
    }
    
    .checkout-progress {
      display: flex;
      justify-content: center;
      margin-top: 20px;
      position: relative;
      z-index: 5;
      animation: fadeInUp 0.8s ease 0.6s both;
    }
    
    .progress-step {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 120px;
      position: relative;
    }
    
    .step-number {
      width: 35px;
      height: 35px;
      border-radius: 50%;
      background: rgba(255, 255, 255, 0.2);
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 600;
      margin-bottom: 8px;
      position: relative;
      z-index: 2;
    }
    
    .step-active .step-number {
      background: white;
      color: var(--primary-color);
    }
    
    .step-completed .step-number {
      background: var(--accent-color);
      color: white;
    }
    
    .step-title {
      font-size: 14px;
      font-weight: 500;
      text-align: center;
    }
    
    .progress-line {
      position: absolute;
      top: 17px;
      left: 60px;
      right: 60px;
      height: 3px;
      background: rgba(255, 255, 255, 0.2);
      z-index: 1;
    }
    
    .progress-line-filled {
      position: absolute;
      top: 17px;
      left: 60px;
      width: calc(50% - 60px);
      height: 3px;
      background: var(--accent-color);
      z-index: 1;
    }
    
    .checkout-content {
      padding: 40px;
    }
    
    .detail-card {
      background-color: #f9fbff;
      border-radius: 12px;
      padding: 25px;
      height: 100%;
      border: 1px solid #eef2f7;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      animation: fadeInUp 0.8s ease;
      animation-fill-mode: both;
    }
    
    .detail-card:nth-child(1) {
      animation-delay: 0.3s;
    }
    
    .detail-card:nth-child(2) {
      animation-delay: 0.5s;
    }
    
    .detail-card:nth-child(3) {
      animation-delay: 0.7s;
    }
    
    .detail-card:hover {
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
      transform: translateY(-5px);
    }
    
    .detail-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
    }
    
    .detail-card h5 {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 20px;
      padding-bottom: 15px;
      border-bottom: 1px dashed #ddd;
      color: var(--dark-color);
      display: flex;
      align-items: center;
    }
    
    .detail-card h5 i {
      font-size: 22px;
      margin-right: 10px;
      color: var(--primary-color);
    }
    
    .detail-row {
      display: flex;
      margin-bottom: 12px;
      align-items: center;
    }
    
    .detail-row:last-child {
      margin-bottom: 0;
    }
    
    .detail-icon {
      width: 28px;
      color: var(--primary-color);
      font-size: 14px;
    }
    
    .detail-label {
      width: 110px;
      font-weight: 600;
      color: #555;
      font-size: 14px;
    }
    
    .detail-value {
      flex: 1;
      color: var(--dark-color);
      font-weight: 500;
      font-size: 14px;
    }
    
    .checkout-actions {
      margin-top: 40px;
      display: flex;
      justify-content: space-between;
      animation: fadeIn 1s ease 0.8s both;
    }
    
    .btn-back {
      background: #f0f2f5;
      border: none;
      border-radius: 50px;
      padding: 12px 25px;
      font-size: 16px;
      font-weight: 500;
      color: #555;
      transition: all 0.3s;
      display: flex;
      align-items: center;
    }
    
    .btn-back:hover {
      background: #e4e7ea;
      color: var(--dark-color);
      transform: translateY(-2px);
    }
    
    .btn-confirm {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border: none;
      border-radius: 50px;
      padding: 12px 25px;
      font-size: 16px;
      font-weight: 500;
      color: white;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.3);
      transition: all 0.3s;
      display: flex;
      align-items: center;
    }
    
    .btn-confirm:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.4);
    }
    
    .btn i {
      margin-right: 8px;
      font-size: 16px;
    }
    
    .btn-confirm i {
      margin-left: 8px;
      margin-right: 0;
    }
    
    .fare-highlight {
      color: var(--primary-color);
      font-size: 16px;
      font-weight: 700;
    }
    
    .payment-status {
      display: inline-block;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
      background: rgba(32, 191, 107, 0.1);
      color: var(--accent-color);
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
    
    /* Responsive styles */
    @media (max-width: 768px) {
      .checkout-content {
        padding: 20px;
      }
      
      .row > div {
        margin-bottom: 20px;
      }
      
      .progress-step {
        width: 80px;
      }
      
      .checkout-actions {
        flex-direction: column;
        gap: 15px;
      }
      
      .btn-back, .btn-confirm {
        width: 100%;
        justify-content: center;
      }
      
      .btn-back {
        order: 2;
      }
      
      .btn-confirm {
        order: 1;
      }
    }
  </style>
</head>
<body>
  <div class="checkout-container">
    <div class="checkout-header">
      <img src="../img/1R.png" alt="Logo" class="checkout-logo">
      <h1>Checkout</h1>
      <p>Almost there! Please take a moment to ensure all the details are accurate. If you need to make any changes, you can go back and edit your booking.</p>
      
      <div class="checkout-progress">
        <div class="progress-line"></div>
        <div class="progress-line-filled"></div>
        
        <div class="progress-step step-completed">
          <div class="step-number">
            <i class="fas fa-check"></i>
          </div>
          <div class="step-title">Booking</div>
        </div>
        
        <div class="progress-step step-active">
          <div class="step-number">2</div>
          <div class="step-title">Review</div>
        </div>
        
        <div class="progress-step">
          <div class="step-number">3</div>
          <div class="step-title">Confirmation</div>
        </div>
      </div>
    </div>
    
    <div class="checkout-content">
      <div class="row g-4">
        <div class="col-md-4">
          <div class="detail-card">
            <h5><i class="fas fa-user-circle"></i> User Details</h5>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-user"></i>
              </div>
              <div class="detail-label">Name:</div>
              <div class="detail-value">${booking.customerName}</div>
            </div>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="detail-card">
            <h5><i class="fas fa-clipboard-list"></i> Booking Details</h5>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-hashtag"></i>
              </div>
              <div class="detail-label">Booking ID:</div>
              <div class="detail-value">${booking.bookingId}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-car"></i>
              </div>
              <div class="detail-label">Vehicle Type:</div>
              <div class="detail-value">${booking.vehicleType}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-map-marker-alt"></i>
              </div>
              <div class="detail-label">Pickup:</div>
              <div class="detail-value">${booking.pickupLocation}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-map-pin"></i>
              </div>
              <div class="detail-label">Drop:</div>
              <div class="detail-value">${booking.dropLocation}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-clock"></i>
              </div>
              <div class="detail-label">Booking Time:</div>
              <div class="detail-value">${booking.bookingTime}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-users"></i>
              </div>
              <div class="detail-label">Passengers:</div>
              <div class="detail-value">${booking.passengerCount}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-suitcase"></i>
              </div>
              <div class="detail-label">Luggage:</div>
              <div class="detail-value">${booking.luggageCount}</div>
            </div>
          </div>
        </div>
        
        <div class="col-md-4">
          <div class="detail-card">
            <h5><i class="fas fa-credit-card"></i> Payment Details</h5>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-route"></i>
              </div>
              <div class="detail-label">Distance:</div>
              <div class="detail-value">${booking.distanceKm} km</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-money-bill-wave"></i>
              </div>
              <div class="detail-label">Total Fare:</div>
              <div class="detail-value fare-highlight">Rs. ${booking.fare}</div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-clipboard-check"></i>
              </div>
              <div class="detail-label">Payment Status:</div>
              <div class="detail-value">
                <span class="payment-status">
                  ${booking.paymentStatus}
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="checkout-actions">
        <a href="${pageContext.request.contextPath}/customer/bookingForm" class="btn btn-back">
          <i class="fas fa-arrow-left"></i> Back to Booking
        </a>
        
        <form action="${pageContext.request.contextPath}/customer/confirmRide" method="post">
          <input type="hidden" name="bookingId" value="${booking.bookingId}" />
          <button type="submit" class="btn btn-confirm">
            Confirm Ride <i class="fas fa-check-circle"></i>
          </button>
        </form>
      </div>
    </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>