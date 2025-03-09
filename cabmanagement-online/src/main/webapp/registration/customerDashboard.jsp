<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" isELIgnored="false"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page import="com.example.model.Customer" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBRMESjK1QTbvTqYmrFmgu8mszqPpLtjVA&libraries=places&callback=initMap" async defer></script>
<script src="bookings.js"></script> 


<style>
        body {
      background-color: #f5f5f5;
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
    }
   
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
      background-color: black;
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
      background-color: gray;
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
    
    

.trip-section {
    padding: 60px 0;
   
}


.trip-card {
    text-align: center;
    padding: 20px;
}


.trip-card img {
    border-radius: 10px;
    width: 100%;
    max-width: 280px; 
    height: auto;
    margin-bottom: 15px;
}


.btn-dark {
    font-weight: bold;
    padding: 12px 24px;
    border-radius: 8px;
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
          <i class="fas fa-clock me-2"></i>Your Bookings
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
    

    <div class="content-area">
      <div class="booking-container">
      
       
      <%
        Customer customer = (Customer) session.getAttribute("customer");
        if (customer != null) {
      %>
       
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
        
       
        <div class="map-section">
          <div id="map"></div>
        </div>
        
         <% } else { %>
        <div class="alert alert-warning">You are not logged in. <a href="login.jsp">Login here</a>.</div>
      <% } %>
      </div>
      
      
         <section class="trip-section text-center">
        <div class="container">
            <h2 class="fw-bold">Book your trip on your phone or computer</h2>
            <div class="row justify-content-center mt-4">
                
                
                <div class="col-md-4">
                    <div class="trip-card">
                        <img src="../img/RR.jpg" alt="Trip details" class="img-fluid">
                        <h5 class="mt-3 fw-bold">1. Add your trip details</h5>
                        <p>Enter your pickup spot and destination, and check prices for your trip.</p>
                    </div>
                </div>

               
                <div class="col-md-4">
                    <div class="trip-card">
                        <img src="../img/payments.jpg" alt="Payment" class="img-fluid">
                        <h5 class="mt-3 fw-bold">2. Pay easily</h5>
                        <p>Add your preferred payment method, then choose among the ride options available in your location.</p>
                    </div>
                </div>

               
                <div class="col-md-4">
                    <div class="trip-card">
                        <img src="../img/SelfD.jpg" alt="Meet driver" class="img-fluid">
                        <h5 class="mt-3 fw-bold">3. Meet your driver</h5>
                        <p>Uber will match you with a driver nearby, and you’ll get updates on your phone or computer about when to meet them.</p>
                    </div>
                </div>

            </div>

            <a href="#"><button class="btn btn-dark mt-4">Book your first ride</button></a>
        </div>
    </section> 
    </div> 

  </div> 

</div>

<c:forEach var="booking" items="${bookings}">
    <div class="booking-card">
        <h3>Booking ID: ${booking.bookingId}</h3>
        <p>Pickup: ${booking.pickupLocation}</p>
        <p>Drop: ${booking.dropLocation}</p>
        <p>Status: <strong>${booking.status}</strong></p>
    </div>
</c:forEach> 


<link 
  rel="stylesheet" 
  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
/>




 





<script 
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
  crossorigin="anonymous">
</script>

<script src="dashboard.js"></script>

     <footer class="footer">
    <div class="footer-container">
        <p>© Copyright 2025 <a href="#">MegaCityCabs.lk</a>. All Rights Reserved</p>
        <p>Developed by <a href="#">Janith Abeywardhana</a></p>
    </div>
</footer>
   
    
</body>
</html>