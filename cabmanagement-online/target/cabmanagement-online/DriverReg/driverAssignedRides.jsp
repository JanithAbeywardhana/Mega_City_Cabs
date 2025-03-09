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
    /* Global Styles */
    body {
      background-color: #f4f7fc;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }
    h2 {
      margin-bottom: 30px;
      font-weight: 600;
      color: #333;
    }
    .container {
      max-width: 1200px;
    }
    /* Card Styles */
    .card-ride {
      margin-bottom: 20px;
      border: none;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s, box-shadow 0.3s;
    }
    .card-ride:hover {
      transform: scale(1.03);
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
    }
    .card-header {
      background: linear-gradient(135deg, #0d6efd, #0046b8);
      color: #fff;
      padding: 15px 20px;
      font-size: 1.1rem;
    }
    .card-body {
      padding: 20px;
      background-color: #fff;
    }
    .card-body p {
      margin-bottom: 0.75rem;
      font-size: 0.95rem;
      color: #555;
    }
    .card-footer {
      background-color: #e9ecef;
      padding: 15px 20px;
      text-align: right;
    }
    .action-buttons .btn {
      margin-right: 5px;
      min-width: 90px;
    }
    /* Badge Styling */
    .badge {
      font-size: 0.9rem;
      padding: 5px 10px;
    }
    /* Responsive enhancements */
    @media (max-width: 768px) {
      .card-ride {
        margin-bottom: 25px;
      }
    }
  </style>
</head>
<body>
<div class="container my-4">
  <h2 class="text-center">My Assigned Rides</h2>
  
  <c:if test="${empty bookings}">
    <div class="alert alert-info text-center">No rides assigned yet.</div>
  </c:if>
  
  <div class="row">
    <c:forEach var="booking" items="${bookings}">
      <div class="col-md-6 col-lg-4">
        <div class="card card-ride">
          <div class="card-header">
            Booking ID: ${booking.bookingId}
          </div>
          <div class="card-body">
            <p><strong>Pickup:</strong> ${booking.pickupLocation}</p>
            <p><strong>Drop:</strong> ${booking.dropLocation}</p>
            <p><strong>Date:</strong> ${booking.bookingDate}</p>
            <p><strong>Time:</strong> ${booking.bookingTime}</p>
            <p><strong>Total:</strong> ${booking.fare}</p>
            <p><strong>Status:</strong> <span class="badge bg-info">${booking.bookingStatus}</span></p>
          </div>
          <div class="card-footer action-buttons">
            <c:choose>
              <c:when test="${booking.bookingStatus == 'Driver Assigned'}">
                <form action="${pageContext.request.contextPath}/driverreg/updateRideStatus" method="post" class="d-inline">
                  <input type="hidden" name="bookingId" value="${booking.bookingId}">
                  <input type="hidden" name="newStatus" value="Accepted">
                  <button type="submit" class="btn btn-sm btn-warning">Accept</button>
                </form>
              </c:when>
              <c:when test="${booking.bookingStatus == 'Accepted'}">
                <form action="${pageContext.request.contextPath}/driverreg/updateRideStatus" method="post" class="d-inline">
                  <input type="hidden" name="bookingId" value="${booking.bookingId}">
                  <input type="hidden" name="newStatus" value="In Progress">
                  <button type="submit" class="btn btn-sm btn-primary">Start Ride</button>
                </form>
              </c:when>
              <c:when test="${booking.bookingStatus == 'In Progress'}">
                <form action="${pageContext.request.contextPath}/driverreg/updateRideStatus" method="post" class="d-inline">
                  <input type="hidden" name="bookingId" value="${booking.bookingId}">
                  <input type="hidden" name="newStatus" value="Completed">
                  <button type="submit" class="btn btn-sm btn-success">End Ride</button>
                </form>
              </c:when>
              <c:when test="${booking.bookingStatus == 'Completed'}">
                <form action="${pageContext.request.contextPath}/driverreg/updateRideStatus" method="post" class="d-inline">
                  <input type="hidden" name="bookingId" value="${booking.bookingId}">
                  <input type="hidden" name="newStatus" value="Paid">
                  <button type="submit" class="btn btn-sm btn-info">Confirm Payment</button>
                </form>
              </c:when>
              <c:otherwise>
                <span class="text-muted">No actions</span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
  
  <div class="text-center mt-4">
    <a href="driverDashBoard.jsp" class="btn btn-secondary">Back to Dashboard</a>
  </div>
</div>

<!-- Bootstrap JS Bundle (with Popper) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>