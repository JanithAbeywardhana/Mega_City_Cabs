<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assign Driver - Mega City Cabs</title>
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
    
    .assignment-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .assignment-header {
      text-align: center;
      margin-bottom: 30px;
      color: white;
      animation: fadeIn 0.8s ease;
    }
    
    .assignment-header h1 {
      font-size: 32px;
      font-weight: 600;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .assignment-header p {
      font-size: 16px;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .assignment-card {
      background: white;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      margin-bottom: 30px;
      animation: fadeInUp 0.8s ease;
    }
    
    .card-header {
      background: var(--dark-color);
      color: white;
      padding: 20px;
      position: relative;
    }
    
    .card-header h2 {
      font-size: 22px;
      font-weight: 600;
      margin: 0;
    }
    
    .booking-details {
      padding: 30px;
    }
    
    .detail-row {
      display: flex;
      margin-bottom: 15px;
      align-items: flex-start;
    }
    
    .detail-row:last-child {
      margin-bottom: 0;
    }
    
    .detail-icon {
      width: 36px;
      height: 36px;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      margin-right: 15px;
      flex-shrink: 0;
    }
    
    .detail-content {
      flex: 1;
    }
    
    .detail-label {
      font-size: 14px;
      color: #777;
      margin-bottom: 3px;
    }
    
    .detail-value {
      font-size: 16px;
      font-weight: 500;
      color: var(--dark-color);
    }
    
    .important-value {
      color: var(--primary-color);
      font-weight: 600;
    }
    
    .driver-card {
      background: white;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
      height: 100%;
      animation: fadeInUp 1s ease;
    }
    
    .driver-header {
      background: var(--dark-color);
      color: white;
      padding: 20px;
      text-align: center;
    }
    
    .driver-header h2 {
      font-size: 22px;
      font-weight: 600;
      margin: 0;
    }
    
    .driver-img-container {
      padding: 30px;
      text-align: center;
      background: #f9fbff;
    }
    
    .driver-img {
      width: 180px;
      height: 180px;
      border-radius: 50%;
      object-fit: cover;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      border: 5px solid white;
      margin-bottom: 0;
      transition: all 0.3s ease;
    }
    
    .driver-img:hover {
      transform: scale(1.05);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }
    
    .driver-form {
      padding: 30px;
    }
    
    .form-label {
      font-size: 16px;
      font-weight: 600;
      color: var(--dark-color);
      margin-bottom: 10px;
    }
    
    .form-select {
      height: 50px;
      border: 1px solid #eef2f7;
      border-radius: 8px;
      padding: 10px 15px;
      font-size: 15px;
      transition: all 0.3s;
      margin-bottom: 20px;
    }
    
    .form-select:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 10px rgba(58, 123, 213, 0.1);
    }
    
    .btn-assign {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      border: none;
      border-radius: 50px;
      padding: 13px 25px;
      font-size: 16px;
      font-weight: 500;
      width: 100%;
      transition: all 0.3s;
      box-shadow: 0 5px 15px rgba(58, 123, 213, 0.2);
    }
    
    .btn-assign:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(58, 123, 213, 0.3);
    }
    
    .btn-back {
      background: #f0f2f5;
      color: #555;
      border: none;
      border-radius: 50px;
      padding: 13px 25px;
      font-size: 16px;
      font-weight: 500;
      transition: all 0.3s;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      margin-top: 20px;
    }
    
    .btn-back:hover {
      background: #e4e7ea;
      color: var(--dark-color);
      transform: translateY(-2px);
    }
    
    .btn-back i {
      margin-right: 8px;
    }
    
    .footer {
      background: var(--dark-color);
      color: white;
      padding: 20px 0;
      text-align: center;
      margin-top: 50px;
      border-radius: 10px;
    }
    
    .footer-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }
    
    .footer a {
      color: white;
      text-decoration: none;
      transition: color 0.3s;
    }
    
    .footer a:hover {
      color: var(--secondary-color);
    }
    
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    /* Responsive */
    @media (max-width: 768px) {
      .assignment-header h1 {
        font-size: 28px;
      }
      
      .driver-card {
        margin-top: 30px;
      }
    }
  </style>
</head>
<body>
  <div class="assignment-container">
    <div class="assignment-header">
      <h1>Driver Assignment</h1>
      <p>Choose the best driver for this booking to ensure a great customer experience</p>
    </div>
    
    <div class="row">
      <div class="col-md-6">
        <div class="assignment-card">
          <div class="card-header">
            <h2>Booking #${booking.bookingId} Details</h2>
          </div>
          
          <div class="booking-details">
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-map-marker-alt"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Pickup Location</div>
                <div class="detail-value">${booking.pickupLocation}</div>
              </div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-map-pin"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Drop Location</div>
                <div class="detail-value">${booking.dropLocation}</div>
              </div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-route"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Distance</div>
                <div class="detail-value">${booking.distanceKm} km</div>
              </div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-money-bill-wave"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Fare</div>
                <div class="detail-value important-value">Rs. ${booking.fare}</div>
              </div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-calendar-alt"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Date & Time</div>
                <div class="detail-value">${booking.bookingDate} at ${booking.bookingTime}</div>
              </div>
            </div>
            
            <div class="detail-row">
              <div class="detail-icon">
                <i class="fas fa-users"></i>
              </div>
              <div class="detail-content">
                <div class="detail-label">Passengers & Luggage</div>
                <div class="detail-value">${booking.passengerCount} passengers, ${booking.luggageCount} luggage</div>
              </div>
            </div>
          </div>
          
          <div class="p-3 text-center">
            <a href="${pageContext.request.contextPath}/admin/viewBookings" class="btn btn-back">
              <i class="fas fa-arrow-left"></i> Back to Bookings
            </a>
          </div>
        </div>
      </div>
      
      <div class="col-md-6">
        <div class="driver-card">
          <div class="driver-header">
            <h2>Select Driver</h2>
          </div>
          
          <div class="driver-img-container">
            <img src="../img/Driver.png" alt="Driver Image" class="driver-img">
          </div>
          
          <div class="driver-form">
            <form action="${pageContext.request.contextPath}/admin/assignDriver" method="post">
              <input type="hidden" name="bookingId" value="${booking.bookingId}">
              
              <label for="driverId" class="form-label">Available Drivers:</label>
              <select name="driverId" id="driverId" class="form-select" required>
                <option value="" selected disabled>-- Select a driver --</option>
                <c:forEach var="driver" items="${drivers}">
                  <option value="${driver.driver_id}">${driver.name} (License: ${driver.license_number})</option>
                </c:forEach>
              </select>
              
              <input type="hidden" name="newStatus" value="Driver Assigned">
              
              <button type="submit" class="btn btn-assign">
                <i class="fas fa-user-check me-2"></i> Assign Driver
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <footer class="footer">
    <div class="footer-container">
      <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
      <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
  </footer>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>