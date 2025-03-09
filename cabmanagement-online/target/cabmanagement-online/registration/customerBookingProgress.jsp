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
    .progress-container {
      max-width: 600px;
      margin: 40px auto;
      text-align: center;
    }
    .progress {
      height: 30px;
    }
    .progress-bar {
      font-size: 1rem;
      line-height: 30px;
    }
    .booking-details {
      margin-top: 20px;
      text-align: left;
    }
    .booking-details p {
      font-size: 0.95rem;
      margin: 5px 0;
    }
    .action-buttons {
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="progress-container">
    <h2>Ride Progress</h2>
    <c:choose>
      <c:when test="${booking.bookingStatus == 'Driver Assigned'}">
         <div class="progress">
           <div class="progress-bar bg-warning" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
             Driver Assigned
           </div>
         </div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Accepted'}">
         <div class="progress">
           <div class="progress-bar bg-info" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
             Booking Accepted
           </div>
         </div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'In Progress'}">
         <div class="progress">
           <div class="progress-bar bg-primary" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
             Ride Started
           </div>
         </div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Completed'}">
         <div class="progress">
           <div class="progress-bar bg-success" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100">
             Ride Ended
           </div>
         </div>
      </c:when>
      <c:when test="${booking.bookingStatus == 'Paid'}">
         <div class="progress">
           <div class="progress-bar bg-success" role="progressbar" style="width: 100%;" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
             Payment Confirmed
           </div>
         </div>
      </c:when>
      <c:otherwise>
         <div class="progress">
           <div class="progress-bar bg-secondary" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">
             No Status
           </div>
         </div>
      </c:otherwise>
    </c:choose>

    <div class="booking-details mt-4">
      <h5>Booking Details</h5>
      <p><strong>Booking ID:</strong> ${booking.bookingId}</p>
      <p><strong>Pickup:</strong> ${booking.pickupLocation}</p>
      <p><strong>Drop:</strong> ${booking.dropLocation}</p>
      <p><strong>Vehicle Type:</strong> ${booking.vehicleType}</p>
      <p><strong>Fare:</strong> Rs. ${booking.fare}</p>
      <p><strong>Booking Date:</strong> ${booking.bookingDate}</p>
      <p><strong>Booking Time:</strong> ${booking.bookingTime}</p>
      <p><strong>Payment Method:</strong> Cash</p>
    </div>

    <div class="action-buttons mt-4">
      <a href="${pageContext.request.contextPath}/customer/dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
      <a href="${pageContext.request.contextPath}/customer/downloadBookingPDF?bookingId=${booking.bookingId}" class="btn btn-primary">
         Download Booking Details (PDF)
      </a>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>