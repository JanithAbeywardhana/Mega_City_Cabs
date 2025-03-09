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
    body {
      background-color: #f4f4f4;
    }
    h2 {
      margin-bottom: 30px;
    }
    
    .card-booking {
      margin-bottom: 20px;
      transition: transform 0.3s ease;
    }
    .card-booking:hover {
      transform: scale(1.01);
    }
    .card-header {
      background-color: black;
      color: #fff;
      font-weight: 600;
      font-size: 1.1rem;
    }
    .card-body {
      background-color: #fff;
    }
    .card-footer {
      background-color: #e9ecef;
      text-align: right;
      font-size: 0.9rem;
    }
    .action-btn {
      margin-right: 5px;
    }
    
    
    
        
.footer {
    background-color: black;  
    color: #333;              
    padding: 15px 0;
    font-family: Arial, sans-serif;
    text-align: center;
    font-size: 14px;
    border-top: 2px solid #ddd;
    width: 100%; 
}

.footer-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: auto;
    padding: 0 15px;
    flex-wrap: wrap;
}


.footer a {
    text-decoration: none;
    color: white; 
   
}

.footer a:hover {
    color: gray;
}
    </style>
</head>
<body>


  <div class="container my-4">
    <h2 class="text-center">Admin Booking List</h2>
    
    <c:if test="${empty bookings}">
      <div class="alert alert-warning text-center">No bookings found.</div>
    </c:if>
    
    <div class="row">
      <c:forEach var="booking" items="${bookings}">
        <div class="col-md-6 col-lg-4">
          <div class="card card-booking shadow-sm">
            <div class="card-header">
              Booking ID: ${booking.bookingId}
            </div>
            <div class="card-body">
              <p><strong>Customer:</strong> ${booking.customerName}</p>
              <p><strong>Pickup:</strong> ${booking.pickupLocation}</p>
              <p><strong>Drop:</strong> ${booking.dropLocation}</p>
              <p><strong>Distance:</strong> ${booking.distanceKm} km</p>
              <p><strong>Fare:</strong> Rs. ${booking.fare}</p>
              <p><strong>Date:</strong> ${booking.bookingDate}</p>
              <p><strong>Time:</strong> ${booking.bookingTime}</p>
              <p><strong>Passengers:</strong> ${booking.passengerCount}</p>
              <p><strong>Luggage:</strong> ${booking.luggageCount}</p>
              <p><strong>Status:</strong> <span class="badge bg-info">${booking.bookingStatus}</span></p>
            </div>
            <div class="card-footer">
              <c:if test="${booking.bookingStatus != 'Confirmed'}">
                <form action="${pageContext.request.contextPath}/ConfirmBookingController" method="post" class="d-inline">
                  <input type="hidden" name="bookingId" value="${booking.bookingId}">
                  <button type="submit" class="btn btn-sm btn-warning action-btn">Confirm</button>
                </form>
              </c:if>
              <a href="${pageContext.request.contextPath}/admin/assignDriver?bookingId=${booking.bookingId}" class="btn btn-sm btn-primary action-btn">Assign Driver</a>
              <a href="${pageContext.request.contextPath}/admin/cancelBooking?bookingId=${booking.bookingId}" class="btn btn-sm btn-danger action-btn" onclick="return confirm('Cancel this booking?');">Cancel</a>
              <button class="btn btn-sm btn-secondary action-btn" onclick="toggleDetails(this)">Details</button>
            </div>
           
            <div class="card-body d-none">
              <p><strong>Payment Status:</strong> ${booking.paymentStatus}</p>
              
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
    
    <div class="text-center mt-4">
      <a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
    </div>
  </div>
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="BookingL.js"></script>
  
  
         <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>

</body>
</html>