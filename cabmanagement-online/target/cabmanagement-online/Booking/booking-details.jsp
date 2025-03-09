<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link 
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    >

    <!-- Optional: Bootstrap Icons (if you want icons) -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    >

    <!-- Custom CSS for styling -->
    <style>
     body {
        background-color: #f8f9fa; /* Light gray background */
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
      }

      .checkout-container {
        max-width: 1200px;
        margin: 40px auto;
        padding: 0 20px;
      }

      /* Heading Section */
      .checkout-header h1 {
        font-size: 2rem;
        font-weight: bold;
      }
      .checkout-header p {
        color: #6c757d; /* Muted text color */
        margin-bottom: 30px;
      }

      /* Cards styling */
      .card h5 {
        font-size: 1.1rem;
        font-weight: 600;
        margin-bottom: 15px;
      }
      .card p {
        margin: 0 0 8px;
      }
      .card p i {
        margin-right: 8px; /* Spacing before the text */
      }

      /* Footer Buttons */
      .checkout-actions {
        margin-top: 30px;
      }
    </style>

</head>
<body>

<div class="checkout-container">
  <!-- Header Section -->
  <div class="checkout-header mb-4">
    <!-- If you have a logo, place it above or inline -->
    <img src="../img/1R.png" alt="Logo" style="height: 100px; margin-bottom: 10px;">
    <h1>Checkout</h1>
    <p>Almost there! Please take a moment to ensure all the details are accurate. If you need to make any changes, you can go back and edit your booking.</p>
  </div>

  <!-- Main Row: 3 Columns (User, Booking, Payment) -->
  <div class="row g-4">
    <!-- USER DETAILS -->
    <div class="col-md-4">
      <div class="card p-3 h-100">
        <h5><i class="bi bi-person-circle me-2"></i>User Details</h5>
        <p><i class="bi bi-person"></i><strong> Name:</strong> ${booking.customerName}</p>
        <!-- Add more user info if you have it, e.g.: -->
        <!--
        <p><i class="bi bi-telephone"></i><strong>Mobile:</strong> +94 7xxxxxxx</p>
        <p><i class="bi bi-envelope"></i><strong>Email:</strong> user@gmail.com</p>
        -->
      </div>
    </div>

    <!-- BOOKING DETAILS -->
    <div class="col-md-4">
      <div class="card p-3 h-100">
        <h5><i class="bi bi-card-checklist me-2"></i>Booking Details</h5>
        <p><i class="bi bi-key"></i><strong> Booking ID:</strong> ${booking.bookingId}</p>
        <p><i class="bi bi-truck"></i><strong> Vehicle Type:</strong> ${booking.vehicleType}</p>
        <p><i class="bi bi-pin-map"></i><strong> Pickup:</strong> ${booking.pickupLocation}</p>
        <p><i class="bi bi-geo-alt"></i><strong> Drop:</strong> ${booking.dropLocation}</p>
        <p><i class="bi bi-clock"></i><strong> Booking Time:</strong> ${booking.bookingTime}</p>
        <p><i class="bi bi-people"></i><strong> Passenger Count:</strong> ${booking.passengerCount}</p>
        <p><i class="bi bi-luggage"></i><strong> Luggage Count:</strong> ${booking.luggageCount}</p>
      </div>
    </div>

    <!-- PAYMENT DETAILS -->
    <div class="col-md-4">
      <div class="card p-3 h-100">
        <h5><i class="bi bi-cash-coin me-2"></i>Payment Details</h5>
        <p><i class="bi bi-signpost"></i><strong> Distance:</strong> ${booking.distanceKm} km</p>
        <p><i class="bi bi-currency-rupee"></i><strong> Total Fare:</strong> Rs. ${booking.fare}</p>
        <p><i class="bi bi-credit-card-2-front"></i><strong> Payment Status:</strong> ${booking.paymentStatus}</p>
      </div>
    </div>
  </div> <!-- end row -->

  <!-- Actions (Buttons) -->
  <div class="checkout-actions d-flex justify-content-between">
    <!-- "Back" button (could link to a previous page) -->
    <a href="${pageContext.request.contextPath}/customer/bookingForm" class="btn btn-secondary">
      <i class="bi bi-arrow-left"></i> Back
    </a>

    <!-- "Confirm Ride" button (submit or link to next step) -->
    <form action="<%= request.getContextPath() %>/customer/confirmRide" method="post">
  <input type="hidden" name="bookingId" value="${booking.bookingId}" />
  <button type="submit" class="btn btn-primary">
    Confirm Ride <i class="bi bi-check-circle ms-1"></i>
  </button>
</form>
  </div>
</div> <!-- end checkout-container -->

<!-- Bootstrap JS -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
  crossorigin="anonymous">
</script>
</body>
</html>