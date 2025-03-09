<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
    .assign-container {
      margin-top: 40px;
    }
    .assign-header {
      background-color: #007bff;
      color: #fff;
      padding: 20px;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
      text-align: center;
    }
    .assign-body {
      padding: 20px;
      background-color: #fff;
    }
    .assign-footer {
      padding: 20px;
      background-color: #f1f1f1;
      text-align: center;
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
    }
    .driver-img {
      width: 100%;
      max-width: 300px;
      border-radius: 10px;
      margin-bottom: 20px;
    }
    .form-label {
      font-weight: bold;
    }
  </style>
<body>
  <div class="container assign-container">
    <div class="row">
      
      <div class="col-md-6">
        <div class="assign-header">
          <h2>Assign Driver for Booking #${booking.bookingId}</h2>
        </div>
        <div class="assign-body">
          <p><strong>Pickup:</strong> ${booking.pickupLocation}</p>
          <p><strong>Drop:</strong> ${booking.dropLocation}</p>
          <p><strong>Drop:</strong> ${booking.dropLocation}</p>
          <p><strong>Distance:</strong> ${booking.distanceKm} km</p>
          <p><strong>Fare:</strong> Rs. ${booking.fare}</p>
          <p><strong>Date:</strong> ${booking.bookingDate}</p>
          <p><strong>Time:</strong> ${booking.bookingTime}</p>
          <p><strong>Passengers:</strong> ${booking.passengerCount}</p>
          <p><strong>Luggage:</strong> ${booking.luggageCount}</p>
          
        </div>
        <div class="assign-footer">
          <a href="${pageContext.request.contextPath}/admin/viewBookings" class="btn btn-secondary">Back to Bookings</a>
        </div>
      </div>
     
      <div class="col-md-6">
        <div class="card shadow">
          <img src="${pageContext.request.contextPath}/img/driver-placeholder.jpg" alt="Driver Image" class="driver-img mx-auto d-block">
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/assignDriver" method="post">
              <input type="hidden" name="bookingId" value="${booking.bookingId}">
              <div class="mb-3">
                <label for="driverId" class="form-label">Select Driver:</label>
                <select name="driverId" id="driverId" class="form-select" required>
                  <c:forEach var="driver" items="${drivers}">
                    <option value="${driver.driver_id}">${driver.name} (License: ${driver.license_number})</option>
                  </c:forEach>
                </select>
              </div>
              
              <input type="hidden" name="newStatus" value="Driver Assigned">
              <button type="submit" class="btn btn-primary w-100">Assign Driver</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>