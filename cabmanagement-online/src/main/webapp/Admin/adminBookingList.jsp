<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Booking List - Mega City Cabs</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #3a7bd5;
      --secondary-color: #00d2ff;
      --accent-color: #20bf6b;
      --dark-color: #333333;
      --light-color: #f8f9fa;
      --warning-color: #ffc107;
      --danger-color: #dc3545;
      --success-color: #28a745;
      --info-color: #17a2b8;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      min-height: 100vh;
      margin: 0;
      padding: 40px 20px;
    }
    
    .admin-container {
      max-width: 1400px;
      margin: 0 auto;
    }
    
    .admin-header {
      text-align: center;
      margin-bottom: 40px;
      color: white;
      animation: fadeIn 0.8s ease;
    }
    
    .admin-header h1 {
      font-size: 36px;
      font-weight: 600;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .admin-header p {
      font-size: 18px;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .booking-card {
      background: white;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      margin-bottom: 30px;
      transition: all 0.3s ease;
      animation: fadeInUp 0.8s ease;
      animation-fill-mode: both;
      height: 100%;
      display: flex;
      flex-direction: column;
    }
    
    .booking-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
    }
    
    .card-header {
      background: var(--dark-color);
      color: white;
      padding: 15px 20px;
      font-weight: 600;
      font-size: 16px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    .booking-id {
      display: flex;
      align-items: center;
    }
    
    .booking-id i {
      margin-right: 8px;
      font-size: 18px;
    }
    
    .status-badge {
      display: inline-block;
      padding: 5px 12px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
    }
    
    .status-badge.confirmed {
      background: rgba(40, 167, 69, 0.1);
      color: var(--success-color);
    }
    
    .status-badge.pending {
      background: rgba(255, 193, 7, 0.1);
      color: var(--warning-color);
    }
    
    .status-badge.assigned {
      background: rgba(23, 162, 184, 0.1);
      color: var(--info-color);
    }
    
    .status-badge.cancelled {
      background: rgba(220, 53, 69, 0.1);
      color: var(--danger-color);
    }
    
    .card-body {
      padding: 20px;
      flex-grow: 1;
    }
    
    .booking-info {
      display: flex;
      flex-wrap: wrap;
      margin-bottom: 15px;
    }
    
    .info-item {
      width: 50%;
      margin-bottom: 10px;
      display: flex;
      align-items: flex-start;
    }
    
    .info-icon {
      width: 20px;
      color: var(--primary-color);
      margin-right: 8px;
      font-size: 14px;
    }
    
    .info-content {
      flex: 1;
    }
    
    .info-label {
      font-size: 13px;
      color: #777;
      margin-bottom: 2px;
    }
    
    .info-value {
      font-size: 14px;
      font-weight: 500;
      color: var(--dark-color);
    }
    
    .card-footer {
      background: #f9fbff;
      padding: 15px 20px;
      text-align: right;
      border-top: 1px solid #eef2f7;
    }
    
    .action-btn {
      margin-left: 8px;
      border-radius: 50px;
      font-size: 13px;
      font-weight: 500;
      padding: 6px 14px;
      transition: all 0.3s ease;
    }
    
    .btn-confirm {
      background: var(--warning-color);
      border: none;
      color: #fff;
    }
    
    .btn-confirm:hover {
      background: #e0a800;
      transform: translateY(-2px);
    }
    
    .btn-assign {
      background: var(--primary-color);
      border: none;
      color: #fff;
    }
    
    .btn-assign:hover {
      background: #3067b2;
      transform: translateY(-2px);
    }
    
    .btn-cancel {
      background: var(--danger-color);
      border: none;
      color: #fff;
    }
    
    .btn-cancel:hover {
      background: #c82333;
      transform: translateY(-2px);
    }
    
    .btn-details {
      background: #f0f2f5;
      border: none;
      color: #555;
    }
    
    .btn-details:hover {
      background: #e4e7ea;
      color: var(--dark-color);
      transform: translateY(-2px);
    }
    
    .additional-details {
      margin-top: 15px;
      padding-top: 15px;
      border-top: 1px dashed #eee;
      display: none;
    }
    
    .payment-status {
      display: inline-block;
      padding: 4px 10px;
      border-radius: 20px;
      font-size: 12px;
      font-weight: 500;
      background: rgba(23, 162, 184, 0.1);
      color: var(--info-color);
    }
    
    .back-btn {
      background: var(--dark-color);
      color: white;
      border: none;
      border-radius: 50px;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 500;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      display: inline-flex;
      align-items: center;
    }
    
    .back-btn:hover {
      background: #222;
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      color: white;
    }
    
    .back-btn i {
      margin-right: 8px;
    }
    
    .empty-message {
      background: white;
      border-radius: 15px;
      padding: 30px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      animation: fadeIn 1s ease;
    }
    
    .empty-message i {
      font-size: 60px;
      color: #ddd;
      margin-bottom: 20px;
    }
    
    .empty-message h3 {
      font-size: 20px;
      font-weight: 600;
      margin-bottom: 10px;
      color: var(--dark-color);
    }
    
    .empty-message p {
      font-size: 16px;
      color: #777;
      margin-bottom: 20px;
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
    
    /* Animation delay for cards */
    .row > div:nth-child(1) .booking-card {
      animation-delay: 0.1s;
    }
    
    .row > div:nth-child(2) .booking-card {
      animation-delay: 0.2s;
    }
    
    .row > div:nth-child(3) .booking-card {
      animation-delay: 0.3s;
    }
    
    .row > div:nth-child(4) .booking-card {
      animation-delay: 0.4s;
    }
    
    .row > div:nth-child(5) .booking-card {
      animation-delay: 0.5s;
    }
    
    .row > div:nth-child(6) .booking-card {
      animation-delay: 0.6s;
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
      .admin-header h1 {
        font-size: 28px;
      }
      
      .info-item {
        width: 100%;
      }
      
      .card-footer {
        text-align: center;
      }
      
      .action-btn {
        margin: 5px;
      }
    }
  </style>
</head>
<body>
  <div class="admin-container">
    <div class="admin-header">
      <h1>Admin Booking Management</h1>
      <p>View and manage all customer bookings from this dashboard</p>
    </div>
    
    <c:if test="${empty bookings}">
      <div class="empty-message">
        <i class="fas fa-calendar-times"></i>
        <h3>No Bookings Found</h3>
        <p>There are currently no bookings in the system.</p>
        <a href="adminDashboard.jsp" class="back-btn">
          <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
      </div>
    </c:if>
    
    <c:if test="${not empty bookings}">
      <div class="row">
        <c:forEach var="booking" items="${bookings}">
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="booking-card">
              <div class="card-header">
                <div class="booking-id">
                  <i class="fas fa-receipt"></i> Booking #${booking.bookingId}
                </div>
                <span class="status-badge ${booking.bookingStatus == 'Confirmed' ? 'confirmed' : booking.bookingStatus == 'Driver Assigned' ? 'assigned' : booking.bookingStatus == 'Cancelled' ? 'cancelled' : 'pending'}">
                  ${booking.bookingStatus}
                </span>
              </div>
              
              <div class="card-body">
                <div class="booking-info">
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-user"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Customer</div>
                      <div class="info-value">${booking.customerName}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Date</div>
                      <div class="info-value">${booking.bookingDate}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-clock"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Time</div>
                      <div class="info-value">${booking.bookingTime}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-money-bill-wave"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Fare</div>
                      <div class="info-value">Rs. ${booking.fare}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Pickup</div>
                      <div class="info-value">${booking.pickupLocation}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-map-pin"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Drop</div>
                      <div class="info-value">${booking.dropLocation}</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-route"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Distance</div>
                      <div class="info-value">${booking.distanceKm} km</div>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="fas fa-users"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Passengers</div>
                      <div class="info-value">${booking.passengerCount}</div>
                    </div>
                  </div>
                </div>
                
                <div class="additional-details">
                  <div class="info-item w-100">
                    <div class="info-icon">
                      <i class="fas fa-credit-card"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Payment Status</div>
                      <div class="info-value">
                        <span class="payment-status">${booking.paymentStatus}</span>
                      </div>
                    </div>
                  </div>
                  
                  <div class="info-item w-100">
                    <div class="info-icon">
                      <i class="fas fa-suitcase"></i>
                    </div>
                    <div class="info-content">
                      <div class="info-label">Luggage</div>
                      <div class="info-value">${booking.luggageCount} items</div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="card-footer">
                <c:if test="${booking.bookingStatus != 'Confirmed'}">
                  <form action="${pageContext.request.contextPath}/ConfirmBookingController" method="post" class="d-inline">
                    <input type="hidden" name="bookingId" value="${booking.bookingId}">
                    <button type="submit" class="btn action-btn btn-confirm">
                      <i class="fas fa-check me-1"></i> Confirm
                    </button>
                  </form>
                </c:if>
                
                <a href="${pageContext.request.contextPath}/admin/assignDriver?bookingId=${booking.bookingId}" class="btn action-btn btn-assign">
                  <i class="fas fa-user-plus me-1"></i> Assign
                </a>
                
                <a href="${pageContext.request.contextPath}/admin/cancelBooking?bookingId=${booking.bookingId}" class="btn action-btn btn-cancel" onclick="return confirm('Are you sure you want to cancel this booking?');">
                  <i class="fas fa-times me-1"></i> Cancel
                </a>
                
                <button class="btn action-btn btn-details" onclick="toggleDetails(this)">
                  <i class="fas fa-info-circle me-1"></i> Details
                </button>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      
      <div class="text-center mt-4">
        <a href="adminDashboard.jsp" class="back-btn">
          <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
      </div>
    </c:if>
  </div>
  
  <footer class="footer">
    <div class="footer-container">
      <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
      <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
  </footer>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  
  <script>
    function toggleDetails(button) {
      const card = button.closest('.booking-card');
      const details = card.querySelector('.additional-details');
      
      if (details.style.display === 'block') {
        details.style.display = 'none';
        button.innerHTML = '<i class="fas fa-info-circle me-1"></i> Details';
      } else {
        details.style.display = 'block';
        button.innerHTML = '<i class="fas fa-times-circle me-1"></i> Hide';
      }
    }
  </script>

</body>
</html>