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
  font-family: 'Poppins', sans-serif;
  color: #333;
}

.container {
  padding: 2rem 1rem;
}


h2 {
  margin-bottom: 2rem;
  color: Black;
  font-weight: 600;
  position: relative;
  padding-bottom: 15px;
}

h2:after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background: black;
  border-radius: 2px;
}


.booking-card {
  margin-bottom: 30px;
  border: none;
  border-radius: 10px;
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
}

.booking-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
}

.booking-card .card-header {
  background: linear-gradient(135deg, #3498db, #2c3e50);
  color: #fff;
  font-weight: 600;
  padding: 1rem;
  border: none;
}

.booking-card .card-body {
  background-color: #fff;
  padding: 1.5rem;
}

.booking-card .card-footer {
  background-color: #f8f9fa;
  border-top: 1px solid #eee;
  text-align: right;
  padding: 1rem;
}


.card-title {
  margin-bottom: 1rem;
  font-size: 1.5rem;
  color: #2c3e50;
  font-weight: 600;
}

.card-text {
  margin-bottom: 0.8rem;
  display: flex;
  justify-content: space-between;
  border-bottom: 1px dashed #eee;
  padding-bottom: 0.5rem;
}

.card-text strong {
  color: #3498db;
}


.btn {
  padding: 0.5rem 1.5rem;
  border-radius: 50px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 1px;
  transition: all 0.3s;
}

.card-footer .btn {
  background-color: #3498db;
  color: white;
  border: none;
}

.card-footer .btn:hover {
  background-color: #2c3e50;
  transform: translateY(-2px);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

.btn-secondary {
  background-color: #2c3e50;
  color: white;
  border: none;
  padding: 0.75rem 2rem;
}

.btn-secondary:hover {
  background-color: #1a252f;
  transform: translateY(-2px);
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}


.alert-info {
  background-color: #e3f2fd;
  color: #0c5460;
  border: none;
  border-radius: 10px;
  padding: 1.5rem;
  font-weight: 500;
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .container {
    padding: 1rem;
  }
  
  .booking-card {
    margin-bottom: 20px;
  }
  
  h2 {
    font-size: 1.8rem;
  }
}


.payment-completed {
  color: #27ae60;
  font-weight: 600;
}

.payment-pending {
  color: #f39c12;
  font-weight: 600;
}


@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.col-md-6 {
  animation: fadeIn 0.5s ease-out forwards;
}

.col-md-6:nth-child(2) {
  animation-delay: 0.2s;
}

.col-md-6:nth-child(3) {
  animation-delay: 0.4s;
}


@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
</style>
<body>

<div class="container my-5">
        <h2 class="text-center">Your Booking History</h2>

        <c:if test="${empty bookings}">
            <div class="alert alert-info text-center">
                <i class="fas fa-info-circle me-2"></i>No booking history found.
            </div>
        </c:if>

        <div class="row">
            <c:forEach var="booking" items="${bookings}">
                <div class="col-md-6 col-lg-4">
                    <div class="card booking-card shadow">
                        <div class="card-header">
                            <i class="fas fa-ticket-alt me-2"></i>Booking ID: ${booking.bookingId}
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">
                                <i class="fas fa-car me-2"></i>${booking.vehicleType}
                            </h5>
                            <p class="card-text">
                                <span><strong><i class="fas fa-map-marker-alt me-2"></i>Pickup:</strong></span>
                                <span>${booking.pickupLocation}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-map-pin me-2"></i>Drop:</strong></span>
                                <span>${booking.dropLocation}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-route me-2"></i>Distance:</strong></span>
                                <span>${booking.distanceKm} km</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-rupee-sign me-2"></i>Fare:</strong></span>
                                <span>Rs. ${booking.fare}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-calendar me-2"></i>Date:</strong></span>
                                <span>${booking.bookingDate}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-clock me-2"></i>Time:</strong></span>
                                <span>${booking.bookingTime}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-users me-2"></i>Passengers:</strong></span>
                                <span>${booking.passengerCount}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-suitcase me-2"></i>Luggage:</strong></span>
                                <span>${booking.luggageCount}</span>
                            </p>
                            <p class="card-text">
                                <span><strong><i class="fas fa-credit-card me-2"></i>Payment:</strong></span>
                                <span class="${booking.paymentStatus == 'Completed' ? 'payment-completed' : 'payment-pending'}">
                                    ${booking.paymentStatus}
                                </span>
                            </p>
                        </div>
                        <div class="card-footer">
                            <a href="${pageContext.request.contextPath}/customer/bookingProgress?bookingId=${booking.bookingId}" 
                               class="btn btn-sm">
                                <i class="fas fa-eye me-1"></i>View Details
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="text-center mt-5">
            <a href="${pageContext.request.contextPath}/customerDashboard.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>