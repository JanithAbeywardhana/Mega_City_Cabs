<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.example.model.Driver" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Driver Dashboard</title>
    <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
        /* ------------------------------------------------------
           Keep your existing sidebar styling
           ------------------------------------------------------ */
        body {
          background-color: #f4f7fc;
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          transition: background-color 0.3s, color 0.3s;
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

        /* ------------------------------------------------------
           NEW STYLING FOR MAIN DASHBOARD CONTENT
           ------------------------------------------------------ */

        /* Profile Pic */
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #0d6efd;
            margin-right: 15px;
        }

        /* Header Section */
        .dashboard-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin-bottom: 30px;
        }
        .dashboard-header .welcome-text h1 {
          font-size: 1.8rem;
          font-weight: 600;
        }
        .dashboard-header .welcome-text p {
          color: #666;
        }

        /* Stats Cards */
        .stats-row {
          display: flex;
          flex-wrap: wrap;
          gap: 20px;
          margin-bottom: 30px;
        }
        .stats-card {
          flex: 1 1 200px;
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          padding: 20px;
          min-width: 200px;
        }
        .stats-card h4 {
          font-size: 1rem;
          font-weight: 600;
          margin-bottom: 10px;
        }
        .stats-card p {
          font-size: 0.9rem;
          color: #555;
        }

        /* Performance Chart Placeholder */
        .chart-card {
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          padding: 20px;
          margin-bottom: 20px;
        }
        .chart-placeholder {
          height: 200px;
          background: repeating-linear-gradient(
            45deg,
            #f1f1f1,
            #f1f1f1 10px,
            #e5e5e5 10px,
            #e5e5e5 20px
          );
          border-radius: 8px;
          display: flex;
          align-items: center;
          justify-content: center;
          color: #999;
          font-size: 1.2rem;
        }

        /* Tasks / Activity Section */
        .tasks-section, .activity-section {
          background-color: #fff;
          border-radius: 10px;
          box-shadow: 0 2px 8px rgba(0,0,0,0.1);
          padding: 20px;
        }
        .tasks-section h5,
        .activity-section h5 {
          font-weight: 600;
          margin-bottom: 15px;
        }
        .tasks-section .task-item,
        .activity-section .activity-item {
          margin-bottom: 10px;
          font-size: 0.9rem;
        }
  </style>
</head>
<body>
     <!-- SIDEBAR (UNCHANGED) -->
  <nav id="sidebar">
    <div class="sidebar-header">
      <h3>Driver Dashboard</h3>
    </div>
    <ul class="components">
      <li class="active"><a href="${pageContext.request.contextPath}/driver/dashboard.jsp"><i class="fas fa-tachometer-alt me-2"></i>Dashboard</a></li>
      <li><a href="<%= pageContext.getServletContext().getContextPath() %>/DriverReg/editProfile"><i class="fas fa-user-edit me-2"></i>Edit Profile</a></li>
      <li><a href="${pageContext.request.contextPath}/driver/assignedRides"><i class="fas fa-car-side me-2"></i>Assigned Rides</a></li>
      <li><a href="${pageContext.request.contextPath}/driver/tripHistory.jsp"><i class="fas fa-history me-2"></i>Trip History</a></li>
      <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
    </ul>
  </nav>

  <!-- MAIN CONTENT -->
  <div id="content">
    <!-- Top Navbar -->
    <nav class="navbar-expand-lg ">
      <div class="container-fluid">
        <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
          <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand" href="#"></a>
      </div>
    </nav>

    <div class="container dashboard-card">
      <!-- Retrieve Driver Object -->
      <%
        Driver driver = (Driver) session.getAttribute("driver");
        if (driver != null) {
      %>

      <!-- Dashboard Header (Greeting + Profile) -->
      <div class="dashboard-header">
        <div class="welcome-text">
          <h1>Hello, <%= driver.getName() %>!</h1>
          <p>Here is your driver performance and ride statistics.</p>
        </div>
        <div class="d-flex align-items-center">
          <c:url value="/${driver.profilePic}" var="profilePicUrl" />
          <img src="${profilePicUrl}" alt="Profile Picture" class="profile-pic">
        </div>
      </div>

      <!-- Stats Row -->
      <div class="stats-row">
        <!-- Example stats cards -->
        <div class="stats-card">
          <h4>Finished Rides</h4>
          <p><strong>12</strong> this week</p>
        </div>
        <div class="stats-card">
          <h4>Ongoing Rides</h4>
          <p><strong>2</strong> in progress</p>
        </div>
        <div class="stats-card">
          <h4>Overall Efficiency</h4>
          <p><strong>93%</strong> rating</p>
        </div>
      </div>

      <!-- Performance Chart Placeholder -->
      <div class="chart-card mb-4">
        <h5>Performance</h5>
        <div class="chart-placeholder">
          <span>Chart Placeholder</span>
        </div>
      </div>

      <!-- Tasks and Activity Row -->
      <div class="row">
        <div class="col-md-6 mb-4">
          <div class="tasks-section">
            <h5>Current Tasks</h5>
            <div class="task-item">Product Review to "Rider 205"</div>
            <div class="task-item">New Ride Request from "John"</div>
            <div class="task-item">Service & Maintenance</div>
          </div>
        </div>
        <div class="col-md-6 mb-4">
          <div class="activity-section">
            <h5>Recent Activity</h5>
            <div class="activity-item">You completed a ride with “Lily”</div>
            <div class="activity-item">“Mason” gave you a 5-star rating</div>
            <div class="activity-item">You updated your vehicle details</div>
          </div>
        </div>
      </div>

      <!-- Upload Profile Picture Form (Optional) -->
      <form action="<%= request.getContextPath() %>/DriverReg/uploadProfilePic" method="post" enctype="multipart/form-data" class="mt-4">
        <div class="mb-3">
          <label for="profilePic" class="form-label">Upload Profile Picture:</label>
          <input type="file" name="profilePic" id="profilePic" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Upload</button>
      </form>

      <% } else { %>
        <div class="alert alert-warning">You are not logged in. <a href="driverLogin.jsp">Login here</a>.</div>
      <% } %>
    </div>
  </div>
   <script src="DriverDash.js"></script> 
    
     
</body>
</html>