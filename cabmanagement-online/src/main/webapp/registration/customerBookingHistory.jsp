<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>

body {
      background-color: #f8f9fa;
    }
    h2 {
      margin-bottom: 30px;
    }
    .booking-card {
      margin-bottom: 20px;
    }
    .booking-card .card-header {
      background-color: black;
      color: #fff;
      font-weight: bold;
    }
    .booking-card .card-body {
      background-color: #fff;
    }
    .booking-card .card-footer {
      background-color: #f1f1f1;
      text-align: right;
      font-size: 0.9rem;
    }
    .card-title {
      margin-bottom: 0.5rem;
      font-size: 1.25rem;
    }
    .card-text {
      margin-bottom: 0.5rem;
    }
</style>
<body>



<div class="container my-4">
    <h2 class="text-center">Your Booking History</h2>
    
    <c:if test="${empty bookings}">
      <div class="alert alert-info text-center">No booking history found.</div>
    </c:if>
    
    <div class="row">
      <c:forEach var="booking" items="${bookings}">
        <div class="col-md-6 col-lg-4">
          <div class="card booking-card shadow-sm">
            <div class="card-header">
              Booking ID: ${booking.bookingId}
            </div>
            <div class="card-body">
              <h5 class="card-title">${booking.vehicleType}</h5>
              <p class="card-text"><strong>Pickup:</strong> ${booking.pickupLocation}</p>
              <p class="card-text"><strong>Drop:</strong> ${booking.dropLocation}</p>
              <p class="card-text"><strong>Distance:</strong> ${booking.distanceKm} km</p>
              <p class="card-text"><strong>Fare:</strong> Rs. ${booking.fare}</p>
              <p class="card-text"><strong>Date:</strong> ${booking.bookingDate}</p>
              <p class="card-text"><strong>Time:</strong> ${booking.bookingTime}</p>
              <p class="card-text"><strong>Passengers:</strong> ${booking.passengerCount}</p>
              <p class="card-text"><strong>Luggage:</strong> ${booking.luggageCount}</p>
              <p class="card-text"><strong>Payment:</strong> ${booking.paymentStatus}</p>
            </div>
            <div class="card-footer">
              <a href="${pageContext.request.contextPath}/customer/bookingProgress?bookingId=${booking.bookingId}" class="btn btn-sm ">View Details</a>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    
    <div class="text-center mt-4">
      <a href="${pageContext.request.contextPath}/customerDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
  </div>
  
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>