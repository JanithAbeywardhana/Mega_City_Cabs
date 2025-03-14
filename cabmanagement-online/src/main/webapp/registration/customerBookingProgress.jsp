<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Enhanced Ride Progress Page Styling */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

:root {
  --primary-color: #4361ee;
  --warning-color: #ffc107;
  --info-color: #3a86ff;
  --success-color: #38b000;
  --secondary-color: #6c757d;
  --dark-color: #212529;
  --light-color: #f8f9fa;
  --border-radius: 12px;
  
}

body {
  font-family: 'Inter', sans-serif;
  background-color: #f9fafb;
  color: #333;
  line-height: 1.6;
}

.progress-container {
  max-width: 800px;
  margin: 50px auto;
  padding: 30px;
 
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
  text-align: center;
}

.progress-container h2 {
  font-weight: 700;
  color: var(--dark-color);
  margin-bottom: 30px;
  font-size: 1.8rem;
  position: relative;
  padding-bottom: 12px;
}

.progress-container h2:after {
  content: '';
  position: absolute;
  width: 60px;
  height: 4px;
  background: var(--primary-color);
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  border-radius: 2px;
}

/* Fix for overlapping step labels */
.progress-steps {
  display: flex;
  justify-content: space-between;
  margin-bottom: 60px; /* Increased from 30px to accommodate labels */
  position: relative;
  padding: 0 20px; /* Add padding on sides to prevent labels from going off-screen */
}

.progress-steps:before {
  content: "";
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  height: 4px;
  width: calc(100% - 100px); /* Subtract to account for the first and last step */
  background: #e9ecef;
  z-index: 0;
  left: 50px; /* Start after the first step */
}

.step {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background: white;
  border: 4px solid #e9ecef;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 600;
  color: #6c757d;
  z-index: 1;
  position: relative;
  transition: all 0.3s ease;
}

.step-label {
  position: absolute;
  top: 60px;
  font-size: 0.75rem; /* Reduced font size */
  font-weight: 500;
  transform: translateX(-50%); /* Center the label under the step */
  left: 50%; /* Center under the step */
  text-align: center;
  width: 80px; /* Fixed width for all labels */
  color: #6c757d;
}

/* Media query to handle smaller screens */
@media (max-width: 768px) {
  .progress-steps {
    margin-bottom: 80px; /* Even more space for mobile */
  }
  
  .step {
    width: 35px; /* Smaller steps */
    height: 35px;
    font-size: 0.8rem;
  }
  
  .step-label {
    font-size: 0.65rem; /* Smaller font */
    width: 70px; /* Narrower labels */
  }
}

/* For very small screens, further optimize */
@media (max-width: 480px) {
  .progress-steps {
    margin-bottom: 100px; /* More space for vertical labels */
  }
  
  .step-label {
    transform: translateX(-50%) rotate(-45deg); /* Rotate labels */
    font-size: 0.6rem;
    top: 45px;
  }
}

.step.completed {
  border-color: var(--success-color);
  background: var(--success-color);
  color: white;
}

.step.active {
  border-color: var(--primary-color);
  background: var(--primary-color);
  color: white;
  box-shadow: 0 0 0 5px rgba(67, 97, 238, 0.2);
}

.step-label {
  position: absolute;
  top: 60px;
  font-size: 0.85rem;
  font-weight: 500;
  white-space: nowrap;
  color: #6c757d;
}

.step.completed + .step-label,
.step.active + .step-label {
  color: var(--dark-color);
  font-weight: 600;
}

/* Modern Progress Bar */
.progress {
  height: 16px;
  border-radius: 8px;
  background-color: #e9ecef;
  margin: 60px 0 40px;
  overflow: visible;
  position: relative;
  box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
}

.progress-bar {
  height: 100%;
  border-radius: 8px;
  position: relative;
  transition: width 1s ease;
  background-image: linear-gradient(to right, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.1) 50%, transparent 50%, transparent 100%);
  background-size: 20px 20px;
  animation: progress-animation 2s linear infinite;
}

@keyframes progress-animation {
  from {
    background-position: 0 0;
  }
  to {
    background-position: 40px 0;
  }
}

.progress-bar.bg-warning {
  background-color: var(--warning-color);
}

.progress-bar.bg-info {
  background-color: var(--info-color);
}

.progress-bar.bg-primary {
  background-color: var(--primary-color);
}

.progress-bar.bg-success {
  background-color: var(--success-color);
}

.progress-status {
  position: absolute;
  top: -30px;
  right: 0;
  font-size: 0.9rem;
  font-weight: 600;
  color: var(--dark-color);
}

/* Booking Details Card */
.booking-details {
  margin-top: 40px;
  text-align: left;
  background-color: #f8f9fa;
  padding: 25px;
  border-radius: var(--border-radius);
  border-left: 5px solid var(--primary-color);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
}

.booking-details h5 {
  font-size: 1.2rem;
  font-weight: 600;
  margin-bottom: 20px;
  color: var(--dark-color);
  border-bottom: 1px solid #dee2e6;
  padding-bottom: 10px;
}

.booking-details p {
  font-size: 0.95rem;
  margin: 12px 0;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px dashed #e9ecef;
  padding-bottom: 8px;
}

.booking-details p:last-child {
  border-bottom: none;
  margin-bottom: 0;
}

.booking-details strong {
  font-weight: 600;
  color: var(--dark-color);
}

.booking-details span {
  font-weight: 500;
}

.booking-details .highlight {
  background: rgba(67, 97, 238, 0.1);
  color: var(--primary-color);
  padding: 2px 8px;
  border-radius: 4px;
  font-weight: 500;
}

/* Action Buttons */
.action-buttons {
  margin-top: 30px;
  display: flex;
  gap: 15px;
  flex-wrap: wrap;
  justify-content: center;
}

.btn {
  padding: 12px 24px;
  font-weight: 500;
  border-radius: 8px;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

.btn i {
  margin-right: 8px;
  font-size: 1rem;
}

.btn-primary {
  background-color: var(--primary-color);
  border-color: var(--primary-color);
  color: white;
  box-shadow: 0 4px 10px rgba(67, 97, 238, 0.3);
}

.btn-primary:hover {
  background-color: #3951d4;
  border-color: #3951d4;
  transform: translateY(-2px);
  box-shadow: 0 6px 15px rgba(67, 97, 238, 0.4);
}

.btn-secondary {
  background-color: var(--secondary-color);
  border-color: var(--secondary-color);
  color: white;
  box-shadow: 0 4px 10px rgba(108, 117, 125, 0.3);
}

.btn-secondary:hover {
  background-color: #5a6268;
  border-color: #5a6268;
  transform: translateY(-2px);
  box-shadow: 0 6px 15px rgba(108, 117, 125, 0.4);
}

@media (max-width: 768px) {
  .progress-container {
    padding: 20px;
    margin: 30px 15px;
  }
  
  .action-buttons {
    flex-direction: column;
  }
  
  .btn {
    width: 100%;
  }
  
  .step {
    width: 40px;
    height: 40px;
    font-size: 0.9rem;
  }
  
  .step-label {
    font-size: 0.75rem;
  }
}
  </style>
</head>
<body>
<div class="progress-container">
  <h2>Ride Progress</h2>
  
  <!-- Enhanced Step Progress Indicator -->
  <div class="progress-steps">
    <c:choose>
      <c:when test="${booking.bookingStatus == 'Driver Assigned' || booking.bookingStatus == 'Accepted' || booking.bookingStatus == 'In Progress' || booking.bookingStatus == 'Completed' || booking.bookingStatus == 'Paid'}">
        <div class="step completed">1</div>
      </c:when>
      <c:otherwise>
        <div class="step">1</div>
      </c:otherwise>
    </c:choose>
    
    
    <c:choose>
      <c:when test="${booking.bookingStatus == 'Accepted' || booking.bookingStatus == 'In Progress' || booking.bookingStatus == 'Completed' || booking.bookingStatus == 'Paid'}">
        <div class="step completed">2</div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Driver Assigned'}">
        <div class="step active">2</div>
      </c:when>
      <c:otherwise>
        <div class="step">2</div>
      </c:otherwise>
    </c:choose>
    
    
    <c:choose>
      <c:when test="${booking.bookingStatus == 'In Progress' || booking.bookingStatus == 'Completed' || booking.bookingStatus == 'Paid'}">
        <div class="step completed">3</div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Accepted'}">
        <div class="step active">3</div>
      </c:when>
      <c:otherwise>
        <div class="step">3</div>
      </c:otherwise>
    </c:choose>
    
    
    <c:choose>
      <c:when test="${booking.bookingStatus == 'Completed' || booking.bookingStatus == 'Paid'}">
        <div class="step completed">4</div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'In Progress'}">
        <div class="step active">4</div>
      </c:when>
      <c:otherwise>
        <div class="step">4</div>
      </c:otherwise>
    </c:choose>
    
    
    <c:choose>
      <c:when test="${booking.bookingStatus == 'Paid'}">
        <div class="step completed">5</div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Completed'}">
        <div class="step active">5</div>
      </c:when>
      <c:otherwise>
        <div class="step">5</div>
      </c:otherwise>
    </c:choose>
    
  </div>
  
  <!-- Classic Progress Bar (Enhanced) -->
  <c:choose>
    <c:when test="${booking.bookingStatus == 'Driver Assigned'}">
      <div class="progress">
        <div class="progress-bar bg-warning" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">Driver Assigned (25%)</div>
      </div>
    </c:when>
    <c:when test="${booking.bookingStatus == 'Accepted'}">
      <div class="progress">
        <div class="progress-bar bg-info" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">Booking Accepted (50%)</div>
      </div>
    </c:when>
    <c:when test="${booking.bookingStatus == 'In Progress'}">
      <div class="progress">
        <div class="progress-bar bg-primary" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">Ride Started (75%)</div>
      </div>
    </c:when>
    <c:when test="${booking.bookingStatus == 'Completed'}">
      <div class="progress">
        <div class="progress-bar bg-success" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">Ride Ended (90%)</div>
      </div>
    </c:when>
    <c:when test="${booking.bookingStatus == 'Paid'}">
      <div class="progress">
        <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">Payment Confirmed (100%)</div>
      </div>
    </c:when>
    <c:otherwise>
      <div class="progress">
        <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
        <div class="progress-status">No Status (0%)</div>
      </div>
    </c:otherwise>
  </c:choose>

  <div class="booking-details">
    <h5>Booking Details</h5>
    <p><strong>Booking ID:</strong> <span>${booking.bookingId}</span></p>
    <p><strong>Pickup:</strong> <span>${booking.pickupLocation}</span></p>
    <p><strong>Drop:</strong> <span>${booking.dropLocation}</span></p>
    <p><strong>Vehicle Type:</strong> <span>${booking.vehicleType}</span></p>
    <p><strong>Fare:</strong> <span class="highlight">Rs. ${booking.fare}</span></p>
    <p><strong>Booking Date:</strong> <span>${booking.bookingDate}</span></p>
    <p><strong>Booking Time:</strong> <span>${booking.bookingTime}</span></p>
    <p><strong>Payment Method:</strong> <span>Cash</span></p>
  </div>

  <div class="action-buttons">
    <a href="${pageContext.request.contextPath}/customer/dashboard.jsp" class="btn btn-secondary">
      <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
    <a href="${pageContext.request.contextPath}/customer/downloadBookingPDF?bookingId=${booking.bookingId}" class="btn btn-primary">
      <i class="fas fa-file-pdf"></i> Download Booking Details (PDF)
    </a>
  </div>
</div>
</body>
</html>