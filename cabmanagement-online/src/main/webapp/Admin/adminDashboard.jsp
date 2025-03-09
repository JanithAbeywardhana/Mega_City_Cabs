<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="com.example.model.Admin" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    Admin admin = (Admin) sessionObj.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
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
  />
  
 
  <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
  />


  <link rel="stylesheet" href="dashboard.css">


  <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"
  ></script>
  
  <style>
  

:root {
  --sidebar-width: 250px;
  --sidebar-bg: #343a40;
  --sidebar-collapsed-width: 70px;
}


body {
  margin: 0;
  padding: 0;
  background-color: #f8f9fa;
}


.sidebar {
  position: fixed;
  top: 0;
  left: 0;
  width: var(--sidebar-width);
  height: 100vh;
  background-color: var(--sidebar-bg);
  color: var(--sidebar-text);
  transition: width 0.3s ease;
  z-index: 1000; 
}


.sidebar.collapsed {
  width: var(--sidebar-collapsed-width);
}


.sidebar.collapsed .nav-link span {
  display: none;
}

.sidebar.collapsed .nav-link {
  justify-content: center;
}

.sidebar.collapsed .nav-link i {
  margin-right: 0;
}

.sidebar-header {
  background-color: #23272b;
  min-height: 56px;
}

.sidebar-header .fs-4 {
  margin: 0;
}

.btn-toggle {
  background: none;
  border: none;
  cursor: pointer;
}

.nav-link {
  color: #adb5bd;
  padding: 0.75rem 1rem;
  display: block;
  transition: background 0.3s ease;
}

.nav-link i {
  font-size: 1rem;
}

.nav-link.active,
.nav-link:hover {
  background-color: #495057;
  color: #fff;
  text-decoration: none;
}


.main-content {
  margin-left: var(--sidebar-width);
  transition: margin-left 0.3s ease;
  min-height: 100vh;
}

.main-content.expanded {
  margin-left: var(--sidebar-collapsed-width);
}


.top-navbar {
  border-bottom: 1px solid #dee2e6;
  min-height: 56px;
  padding: 0.5rem 1rem;
}


.stats-row {
  margin-top: 1rem;
}

.stat-card {
  background-color: #fff;
  border-radius: 6px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  padding: 1rem;
  transition: transform 0.2s;
}

.stat-card:hover {
  transform: translateY(-3px);
}

.stat-card h5 {
  font-size: 1rem;
  font-weight: 600;
  color: #6c757d;
  margin-bottom: 0.3rem;
}

.stat-card h3 {
  font-size: 1.4rem;
  margin-bottom: 0.3rem;
}

.stat-card p {
  font-size: 0.9rem;
  color: #6c757d;
  margin-bottom: 0.5rem;
}


@media (max-width: 992px) {
  .main-content {
    margin-left: var(--sidebar-collapsed-width);
  }
  .sidebar.collapsed {
    width: var(--sidebar-collapsed-width);
  }
}

@media (max-width: 576px) {
 
  .stat-card {
    margin-bottom: 1rem;
  }
}
  </style>
</head>
<body>

<nav id="sidebar" class="sidebar">
  <div class="sidebar-header d-flex align-items-center justify-content-between px-3 py-2">
    <span class="fs-4 text-white">DashBoard</span>
    <button class="btn btn-toggle text-white" id="sidebarToggle">
      <i class="bi bi-list fs-3"></i>
    </button>
  </div>

  <ul class="nav flex-column mt-2">
    <li class="nav-item">
      <a href="#" class="nav-link active">
        <i class="bi bi-grid me-2"></i> 
        <span>Dashboard</span>
      </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="bi bi-envelope me-2"></i> 
        <span>Email</span>
      </a>
    </li>
    <li class="nav-item">
      <a href="<%= request.getContextPath() %>/admin/viewBookings" class="nav-link">
        <i class="bi bi-card-checklist me-2"></i> 
        <span>Bookings</span>
      </a>
    </li>
    <li class="nav-item">
      <a href="<%= request.getContextPath() %>/admin/viewCustomers" class="nav-link">
        <i class="bi bi-person-badge me-2"></i> 
        <span>Manage Customers</span>
      </a>
    </li>
        <li class="nav-item">
      <a href="<%= request.getContextPath() %>/admin/viewDrivers" class="nav-link">
        <i class="bi bi-person-badge me-2"></i> 
        <span>Manage Drivers</span>
      </a>
      </li>
              <li class="nav-item">
      <a href="AdminLogout" class="nav-link">
        <i class="bi bi-person-badge me-2"></i> 
        <span>Bookings</span>
      </a>
      </li>
    <li class="nav-item">
      <a href="AdminLogout" class="nav-link">
        <i class="bi bi-box-arrow-right me-2"></i> 
        <span>Logout</span>
      </a>
    </li>
  </ul>
</nav>


<div id="main-content" class="main-content">

  <nav class="navbar navbar-expand bg-white top-navbar">
    <div class="container-fluid">
      <button class="btn btn-outline-secondary d-md-none" id="mobileSidebarToggle">
        <i class="bi bi-list"></i>
      </button>
      

      <div class="navbar-text ms-2 text-warning fw-bold">
        MegaCityCabs@gmail.com
      </div>
      
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="bi bi-person-circle me-1"></i> <span>Mega City Cabs</span>
          </a>
        </li>
      </ul>
    </div>
      </nav>
      
      
      
  <div class="container-fluid mt-4">
    <h2>Welcome, <%= admin.getUsername() %>!</h2>
    <p>Manage bookings, drivers, and customers here.</p>
    
    
    <div class="row g-3 stats-row">
      <div class="col-md-3">
        <div class="stat-card">
          <h5>Total Profit</h5>
          <h3>$18M</h3>
          <p>All Customers Value</p>
          <div class="progress" style="height: 5px;">
            <div
              class="progress-bar bg-primary"
              role="progressbar"
              style="width: 70%;"
              aria-valuenow="70"
              aria-valuemin="0"
              aria-valuemax="100"
            ></div>
          </div>
        </div>
      </div>
      
      <div class="col-md-3">
        <div class="stat-card">
          <h5>New Feedbacks</h5>
          <h3>1369</h3>
          <p>All Customers Value</p>
          <div class="progress" style="height: 5px;">
            <div
              class="progress-bar bg-success"
              role="progressbar"
              style="width: 50%;"
              aria-valuenow="50"
              aria-valuemin="0"
              aria-valuemax="100"
            ></div>
          </div>
        </div>
      </div>
      
      <div class="col-md-3">
        <div class="stat-card">
          <h5>New Bookings</h5>
          <h3>567</h3>
          <p>All Customers Value</p>
          <div class="progress" style="height: 5px;">
            <div
              class="progress-bar bg-info"
              role="progressbar"
              style="width: 60%;"
              aria-valuenow="60"
              aria-valuemin="0"
              aria-valuemax="100"
            ></div>
          </div>
        </div>
      </div>

      
    </div>
    
    
    <div class="row mt-4">
      <div class="col-md-6">
        <h5>Admin Pannel</h5>
        <ul class="list-group">
          <li class="list-group-item d-flex justify-content-between align-items-center">
            Janith Rangana <span class="badge bg-primary rounded-pill">Admin</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            Janith Rangana <span class="badge bg-secondary rounded-pill">CEO</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
            Janith Rangana <span class="badge bg-secondary rounded-pill">Manager</span>
          </li>
          <li class="list-group-item d-flex justify-content-between align-items-center">
           Janith Rangana <span class="badge bg-secondary rounded-pill">Operator</span>
          </li>
        </ul>
      </div>
      
      <div class="col-md-6">
        <h5>Latest Updates</h5>
        <ul class="list-group">
          <li class="list-group-item">Update 1</li>
          <li class="list-group-item">Update 2</li>
          <li class="list-group-item">Update 3</li>
          <li class="list-group-item">Update 4</li>
        </ul>
      </div>
    </div>
    
  </div>
      </div>
      
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        
        
<script src="Admindashboard.js"></script>
</body>
</html>