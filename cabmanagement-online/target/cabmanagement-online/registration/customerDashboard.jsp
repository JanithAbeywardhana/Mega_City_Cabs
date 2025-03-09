<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.example.model.Customer" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<!-- Google Maps API with callback -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRMESjK1QTbvTqYmrFmgu8mszqPpLtjVA&libraries=places&callback=initMap" async defer></script>
<script src="bookings.js"></script> 


<style>
        body {
      background-color: #f5f5f5;
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
    }
    /* Sidebar Styles (Same as Driver Dashboard) */
    #sidebar {
      position: fixed;
      top: 0;
      left: 0;
      height: 100vh;
      width: 250px;
      background-color: #343a40;
      color: #fff;
      transition: width 0.3s;
      overflow-x: hidden;
      z-index: 1000;
    }
    #sidebar .sidebar-header {
      padding: 20px;
      background: #23272b;
      text-align: center;
    }
    #sidebar ul.components {
      padding: 20px 0;
      list-style: none;
      margin: 0;
    }
    #sidebar ul li {
      padding: 10px 20px;
      font-size: 1.1rem;
    }
    #sidebar ul li a {
      color: #d1d1d1;
      text-decoration: none;
      display: block;
      transition: color 0.3s;
    }
    #sidebar ul li a:hover {
      color: #fff;
      background-color: #575757;
      border-radius: 4px;
    }
    /* Main Content Styles */
    #content {
      margin-left: 250px;
      transition: margin-left 0.3s;
      padding: 20px;
    }
    .navbar {
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    .navbar .navbar-brand {
      margin-left: 250px;
      transition: margin-left 0.3s;
    }
    @media (max-width: 768px) {
      #sidebar {
        width: 200px;
      }
      #content {
        margin-left: 200px;
      }
      .navbar .navbar-brand {
        margin-left: 200px;
      }
    }
    /* If you want to shift content when collapsed, 
       add a .expanded class or something if needed. 
       Or let the content fill automatically. */

    /* === Booking Layout (Your Existing Styles) === */
    .booking-container {
      display: flex;
      flex-wrap: wrap;
      max-width: 1200px;
      margin: 20px auto;
      gap: 20px;
      padding: 0 20px;
    }
    .booking-form {
      flex: 1 1 450px;
      
      padding: 20px;
      
    }
    .booking-form h1,
    .booking-form h2 {
      margin-top: 0;
      color: #333;
      text-align: left;
    }
    .booking-form label {
      display: block;
      font-weight: 600;
      margin-top: 15px;
      margin-bottom: 5px;
      color: #444;
    }
    .booking-form input[type="text"],
    .booking-form input[type="date"],
    .booking-form input[type="time"],
    .booking-form input[type="number"],
    .booking-form select {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-bottom: 10px;
      font-size: 14px;
      transition: border-color 0.3s ease;
    }
    .booking-form input:focus,
    .booking-form select:focus {
      border-color: #007bff;
      outline: none;
      box-shadow: 0 0 3px rgba(0,123,255,0.5);
    }
    .booking-form button[type="submit"] {
      display: inline-block;
      background-color: #f0ad4e;
      color: #fff;
      font-weight: 600;
      font-size: 14px;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }
    .booking-form button[type="submit"]:hover {
      background-color: #ec971f;
    }
    #fareEstimate {
      background-color: #f8f8f8;
      border-radius: 4px;
      padding: 10px;
      margin-top: 15px;
      color: #555;
      font-weight: 600;
    }
    .booking-form p a {
      color: #007bff;
      text-decoration: none;
      font-weight: 600;
    }
    .booking-form p a:hover {
      text-decoration: underline;
    }
    .map-section {
      flex: 1 1 600px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    #map {
      width: 100%;
      height: 500px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    @media (max-width: 768px) {
      .booking-container {
        flex-direction: column;
      }
      .booking-form,
      .map-section {
        flex: 1 1 100%;
      }
    } 
    
   .car-showcase-container {
      
      border-radius: 8px;
      
      padding: 10px;
      margin: 40px auto;
      max-width: 1200px;
      margin-left: 260px;
    }
    .car-title {
      font-size: 1.8rem;
      font-weight: bold;
    }
    .car-subtitle {
      font-size: 1.2rem;
      color: #666;
    }
    .car-description {
      margin-top: 15px;
      font-size: 0.95rem;
      color: #555;
    }
    .car-features {
      list-style: none;
      padding-left: 0;
      margin-top: 15px;
    }
    .car-features li {
      margin-bottom: 5px;
    }
    .car-main-image {
      width: 100%;
      height: auto;
      border-radius: 6px;
      object-fit: cover;
    }
    .car-sub-images .col-6 {
      padding: 5px;
    }
    .car-sub-images img {
      width: 100%;
      height: auto;
      border-radius: 6px;
      object-fit: cover;
    }
    /* Button group for categories */
    .car-categories .btn {
      display: flex;
      align-items: center;
      gap: 5px;
      font-weight: 500;
    }
    /* Active category button styling (if you want) */
    .car-categories .btn.active {
      background-color: #0d6efd;
      color: #fff;
      border-color: #0d6efd;
    }
  </style>
</head>
<body onload="initMap()">
<div class="dashboard-wrapper">
  
<nav id="sidebar">
    <div class="sidebar-header">
      <h3>Customer Dashboard</h3>
    </div>
    <ul class="components">
      <li class="active">
        <a href="${pageContext.request.contextPath}/customer/dashboard.jsp">
          <i class="fas fa-tachometer-alt me-2"></i>Dashboard
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/customer/bookingHistory">
          <i class="fas fa-clock me-2"></i>Booking History
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/customer/promotions">
          <i class="fas fa-gift me-2"></i>Promotions
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/customer/submitFeedback">
          <i class="fas fa-info-circle me-2"></i>About Us
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/customer/editProfile">
          <i class="fas fa-user-edit me-2"></i>Edit Profile
        </a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/logout">
          <i class="fas fa-sign-out-alt me-2"></i>Logout
        </a>
      </li>
    </ul>
  </nav>

  <!-- Main Content -->
  <div id="content">
    <nav class="navbar-expand-lg navbar-light">
      <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
          <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand ms-3" href="#">Customer Dashboard</a>
      </div>
    </nav>
    
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Sidebar Toggle Functionality
    document.getElementById("sidebarCollapse").addEventListener("click", function () {
      var sidebar = document.getElementById("sidebar");
      var content = document.getElementById("content");
      var navbarBrand = document.querySelector(".navbar .navbar-brand");
      if (sidebar.style.width === "250px" || sidebar.style.width === "") {
        sidebar.style.width = "0";
        content.style.marginLeft = "0";
        navbarBrand.style.marginLeft = "0";
      } else {
        sidebar.style.width = "250px";
        content.style.marginLeft = "250px";
        navbarBrand.style.marginLeft = "250px";
      }
    });
  </script>
    
    <!-- MAIN CONTENT AREA -->
    <div class="content-area">
      <div class="booking-container">
      
       <!-- Retrieve Driver Object -->
      <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
      %>
        <!-- Left Column: Booking Form -->
        <div class="booking-form">
          <h1>Hellow, <%= customer.getName() %></h1><br>
          <h2>Normal Ride</h2>
          
          <form action="booking" method="post">
            <label for="pickup">Pickup Location:</label>
            <input type="text" id="pickup" name="pickup" placeholder="Enter pickup location" required><br>
            
            <label for="drop">Drop Location:</label>
            <input type="text" id="drop" name="drop" placeholder="Enter drop location" required><br>
            
            Booking Date: <input type="date" name="bookingDate" required><br>
            Booking Time: <input type="time" name="bookingTimeInput" required><br>
            
            Vehicle Type:
            <select name="vehicleType" required>
              <option value="4-passenger">4 Passenger (Rs. 100/km)</option>
              <option value="8-passenger">8 Passenger (Rs. 200/km)</option>
              <option value="14-passenger">14 Passenger (Rs. 400/km)</option>
            </select><br>
            
            Number of Passengers: 
            <input type="number" id="passengerCount" name="passengerCount" min="1" value="1" required><br>
            
            Pieces of Luggage: 
            <input type="number" id="luggageCount" name="luggageCount" min="0" value="0" required><br>
            
            <button type="submit">Book Now</button>
          </form>
          
          <div id="fareEstimate"></div>
        </div>
        
        <!-- Right Column: Map -->
        <div class="map-section">
          <div id="map"></div>
        </div>
        
         <% } else { %>
        <div class="alert alert-warning">You are not logged in. <a href="login.jsp">Login here</a>.</div>
      <% } %>
      </div> <!-- end booking-container -->
    </div> <!-- end content-area -->

  </div> <!-- end main-container -->

</div>

<c:forEach var="booking" items="${bookings}">
    <div class="booking-card">
        <h3>Booking ID: ${booking.bookingId}</h3>
        <p>Pickup: ${booking.pickupLocation}</p>
        <p>Drop: ${booking.dropLocation}</p>
        <p>Status: <strong>${booking.status}</strong></p>
    </div>
</c:forEach> <!-- end dashboard-wrapper -->

<!-- Optional: Bootstrap Icons -->
<link 
  rel="stylesheet" 
  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
/>


<div class="container my-5 car-showcase-container">
  
  <!-- Row for Text + Main Image + Sub Images -->
  <div class="row mb-4">
    
    <!-- Left Column: Text/Details -->
    <div class="col-md-4">
      <h2 class="car-title" id="car-title">Expo</h2>
      <h5 class="car-subtitle" id="car-subtitle">Tata Nano</h5>
      <p class="car-description" id="car-desc">
        A small hatchback, air conditioned with capacity of 3 passengers, ideal for short distance trips.
      </p>
      <ul class="car-features" id="car-features">
        <li>3 Passengers</li>
        <li>Air Conditioned</li>
        <li>Small Backpacks</li>
      </ul>
    </div>
    
    <!-- Middle Column: Main Image -->
    <div class="col-md-4 text-center">
      <img 
        src="https://via.placeholder.com/400x300.png?text=Main+Expo" 
        alt="Main Car" 
        class="img-fluid car-main-image" 
        id="car-main-image"
      >
    </div>
    
    <!-- Right Column: Sub Images -->
    <div class="col-md-4 car-sub-images" id="car-sub-images">
      <div class="row">
        <!-- By default, 4 sub-images in 2x2 layout -->
        <div class="col-6">
          <img 
            src="https://via.placeholder.com/200x150.png?text=Expo+1" 
            alt="Sub image 1" 
            class="img-fluid"
          >
        </div>
        <div class="col-6">
          <img 
            src="https://via.placeholder.com/200x150.png?text=Expo+2" 
            alt="Sub image 2" 
            class="img-fluid"
          >
        </div>
        <div class="col-6">
          <img 
            src="https://via.placeholder.com/200x150.png?text=Expo+3" 
            alt="Sub image 3" 
            class="img-fluid"
          >
        </div>
        <div class="col-6">
          <img 
            src="https://via.placeholder.com/200x150.png?text=Expo+4" 
            alt="Sub image 4" 
            class="img-fluid"
          >
        </div>
      </div>
    </div>
    
  </div> <!-- End row -->
  
  <!-- Row for Category Buttons -->
  <div class="d-flex flex-wrap gap-2 car-categories" id="car-categories">
    <button type="button" class="btn btn-outline-primary active" data-car="expo">
      <i class="bi bi-car-front"></i> <span>Expo</span>
    </button>
    <button type="button" class="btn btn-outline-primary" data-car="budget">
      <i class="bi bi-car-front"></i> <span>Budget</span>
    </button>
    <button type="button" class="btn btn-outline-primary" data-car="city">
      <i class="bi bi-car-front"></i> <span>City</span>
    </button>
    <button type="button" class="btn btn-outline-primary" data-car="semi">
      <i class="bi bi-car-front"></i> <span>Semi</span>
    </button>
    <button type="button" class="btn btn-outline-primary" data-car="9seater">
      <i class="bi bi-car-front"></i> <span>9 Seater</span>
    </button>
    <button type="button" class="btn btn-outline-primary" data-car="14seater">
      <i class="bi bi-car-front"></i> <span>14 Seater</span>
    </button>
  </div>
  
</div> <!-- End container -->

<!-- Bootstrap JS -->
<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
  crossorigin="anonymous">
</script>

<script src="dashboard.js"></script>
   
    
</body>
</html>