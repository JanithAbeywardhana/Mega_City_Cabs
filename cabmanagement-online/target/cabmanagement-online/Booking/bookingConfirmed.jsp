<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
    rel="stylesheet"
  >
  <style>
    /* Minimal styling similar to your reference image */
    body {
      background-color: #f8f9fa;
      margin: 0; padding: 0;
      font-family: Arial, sans-serif;
    }
    .confirmed-container {
      max-width: 800px;
      margin: 40px auto;
      background: #fff;
      border-radius: 8px;
      padding: 20px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
    .confirmed-header h2 {
      font-size: 1.8rem;
      font-weight: 600;
    }
    .reference-no {
      font-size: 1.2rem;
      font-weight: 500;
      color: #007bff;
    }
    .detail-section {
      margin-top: 20px;
    }
    .detail-section h5 {
      margin-bottom: 10px;
      font-weight: 600;
    }
    .detail-section p {
      margin: 0 0 8px;
    }
  </style>
</head>
<body>



 <div class="confirmed-container">
    <div class="confirmed-header text-center mb-4">
      <h2>Booking Confirmed</h2>
      <p>Dear Mr/Ms <strong>${booking.customerName}</strong>, we are pleased to inform you that your booking has been successfully confirmed.</p>
      <span class="reference-no">Reference No: BJL0602 (example placeholder)</span>
    </div>
    
    <!-- Booking Details Section -->
    <div class="detail-section">
      <h5>Booking Details</h5>
      <p><strong>Vehicle Type:</strong> ${booking.vehicleType}</p>
      <p><strong>Pickup:</strong> ${booking.pickupLocation}</p>
      <p><strong>Drop:</strong> ${booking.dropLocation}</p>
      <p><strong>Booking Date & Time:</strong> ${booking.bookingDate} ${booking.bookingTime}</p>
    </div>
    
    <!-- Other Details Section -->
    <div class="detail-section">
      <h5>Other Details</h5>
      <p><strong>Contact Number:</strong> +94 765434683 (example placeholder)</p>
      <p><strong>Payment Method:</strong> Cash</p>
      <p><strong>Estimated Total:</strong> LKR ${booking.fare}</p>
      <p><strong>Ride Status:</strong> Pending</p>
    </div>
    
    <!-- Download Button -->
    <div class="mt-4 text-center">
      <a href="${pageContext.request.contextPath}/customer/downloadBookingPDF?bookingId=${booking.bookingId}" 
         class="btn btn-secondary">
         Download Booking Details
      </a>
      <!-- A "Go Home" or "Back to Dashboard" button -->
      <a href="${pageContext.request.contextPath}/customer/dashboard.jsp" 
         class="btn btn-primary ms-2">
         Go Home
      </a>
    </div>
  </div>

</body>
</html>