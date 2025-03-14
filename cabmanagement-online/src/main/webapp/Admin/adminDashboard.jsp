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
<title>Admin Dashboard - Mega City Cabs</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #3a7bd5;
      --secondary-color: #00d2ff;
      --accent-color: #20bf6b;
      --dark-color: #333333;
      --light-color: #f8f9fa;
      --warning-color: #ffc107;
      --danger-color: #dc3545;
      --success-color: #28a745;
      --info-color: #17a2b8;
      --sidebar-width: 250px;
      --sidebar-collapsed-width: 70px;
      --header-height: 70px;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7fa;
      overflow-x: hidden;
    }
    
    /* Sidebar Styles */
    .sidebar {
      position: fixed;
      top: 0;
      left: 0;
      width: var(--sidebar-width);
      height: 100vh;
      background: linear-gradient(180deg, var(--dark-color), #2c3034);
      color: #fff;
      transition: all 0.3s ease;
      z-index: 1000;
      box-shadow: 3px 0 10px rgba(0, 0, 0, 0.1);
      overflow-y: auto;
    }
    
    .sidebar::-webkit-scrollbar {
      width: 5px;
    }
    
    .sidebar::-webkit-scrollbar-track {
      background: rgba(255, 255, 255, 0.1);
    }
    
    .sidebar::-webkit-scrollbar-thumb {
      background: rgba(255, 255, 255, 0.2);
      border-radius: 5px;
    }
    
    .sidebar.collapsed {
      width: var(--sidebar-collapsed-width);
    }
    
    .sidebar-header {
      background: rgba(0, 0, 0, 0.2);
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }
    
    .sidebar-logo {
      display: flex;
      align-items: center;
    }
    
    .logo-icon {
      font-size: 24px;
      color: var(--secondary-color);
      margin-right: 10px;
    }
    
    .sidebar-header h3 {
      font-size: 18px;
      font-weight: 600;
      margin: 0;
      white-space: nowrap;
      transition: opacity 0.3s;
    }
    
    .sidebar.collapsed .sidebar-header h3 {
      opacity: 0;
      width: 0;
    }
    
    .btn-toggle {
      background: transparent;
      border: none;
      color: rgba(255, 255, 255, 0.7);
      font-size: 18px;
      cursor: pointer;
      transition: all 0.3s;
    }
    
    .btn-toggle:hover {
      color: #fff;
    }
    
    .sidebar-menu {
      list-style: none;
      padding: 15px 0;
      margin: 0;
    }
    
    .menu-item {
      margin: 5px 0;
    }
    
    .menu-link {
      display: flex;
      align-items: center;
      padding: 12px 20px;
      color: rgba(255, 255, 255, 0.7);
      text-decoration: none;
      transition: all 0.3s;
      border-left: 3px solid transparent;
      white-space: nowrap;
    }
    
    .menu-link:hover, .menu-link.active {
      background: rgba(255, 255, 255, 0.1);
      color: #fff;
      border-left-color: var(--secondary-color);
    }
    
    .menu-icon {
      font-size: 18px;
      min-width: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .menu-text {
      transition: opacity 0.3s, width 0.3s;
    }
    
    .sidebar.collapsed .menu-text {
      opacity: 0;
      width: 0;
      display: none;
    }
    
    .menu-badge {
      margin-left: auto;
      background: var(--secondary-color);
      color: #fff;
      padding: 2px 8px;
      border-radius: 20px;
      font-size: 12px;
      transition: opacity 0.3s;
    }
    
    .sidebar.collapsed .menu-badge {
      opacity: 0;
      width: 0;
      display: none;
    }
    
    .menu-category {
      padding: 10px 20px;
      font-size: 12px;
      text-transform: uppercase;
      color: rgba(255, 255, 255, 0.4);
      letter-spacing: 1px;
      white-space: nowrap;
      transition: opacity 0.3s;
    }
    
    .sidebar.collapsed .menu-category {
      opacity: 0;
      height: 0;
      padding: 0;
      margin: 0;
      overflow: hidden;
    }
    
    /* Main Content Styles */
    .main-content {
      margin-left: var(--sidebar-width);
      padding: 20px;
      transition: all 0.3s ease;
      min-height: 100vh;
    }
    
    .main-content.expanded {
      margin-left: var(--sidebar-collapsed-width);
    }
    
    /* Header Bar Styles */
    .header-bar {
      background: #fff;
      height: var(--header-height);
      border-bottom: 1px solid #eaedf1;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0 20px;
      margin-bottom: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
    }
    
    .page-title {
      font-size: 18px;
      font-weight: 600;
      color: var(--dark-color);
      margin: 0;
    }
    
    .header-actions {
      display: flex;
      align-items: center;
    }
    
    .header-search {
      position: relative;
      margin-right: 20px;
    }
    
    .search-input {
      background: #f4f7fa;
      border: 1px solid #eaedf1;
      border-radius: 50px;
      padding: 8px 15px 8px 40px;
      width: 200px;
      transition: all 0.3s;
    }
    
    .search-input:focus {
      width: 250px;
      box-shadow: 0 0 0 0.2rem rgba(58, 123, 213, 0.1);
      border-color: rgba(58, 123, 213, 0.3);
      outline: none;
    }
    
    .search-icon {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #a0a0a0;
    }
    
    .user-dropdown {
      display: flex;
      align-items: center;
      cursor: pointer;
      padding: 5px 10px;
      border-radius: 5px;
      transition: all 0.3s;
    }
    
    .user-dropdown:hover {
      background: #f4f7fa;
    }
    
    .user-avatar {
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-weight: 600;
      margin-right: 10px;
    }
    
    .user-info {
      margin-right: 10px;
    }
    
    .user-name {
      font-size: 14px;
      font-weight: 600;
      color: var(--dark-color);
      margin: 0;
    }
    
    .user-role {
      font-size: 12px;
      color: #777;
      margin: 0;
    }
    
    /* Dashboard Widgets */
    .widget-container {
      margin-bottom: 30px;
    }
    
    .widget-title {
      font-size: 18px;
      font-weight: 600;
      margin-bottom: 20px;
      color: var(--dark-color);
      display: flex;
      align-items: center;
    }
    
    .widget-title i {
      margin-right: 10px;
      color: var(--primary-color);
    }
    
    .stat-card {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      padding: 20px;
      transition: all 0.3s ease;
      height: 100%;
      position: relative;
      overflow: hidden;
    }
    
    .stat-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    }
    
    .stat-card::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 5px;
      height: 100%;
      background: linear-gradient(to bottom, var(--primary-color), var(--secondary-color));
    }
    
    .stat-icon {
      width: 50px;
      height: 50px;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      margin-bottom: 15px;
      background: linear-gradient(135deg, rgba(58, 123, 213, 0.1), rgba(0, 210, 255, 0.1));
      color: var(--primary-color);
    }
    
    .stat-card.success .stat-icon {
      background: linear-gradient(135deg, rgba(32, 191, 107, 0.1), rgba(40, 167, 69, 0.1));
      color: var(--success-color);
    }
    
    .stat-card.warning .stat-icon {
      background: linear-gradient(135deg, rgba(255, 193, 7, 0.1), rgba(255, 153, 0, 0.1));
      color: var(--warning-color);
    }
    
    .stat-card.danger .stat-icon {
      background: linear-gradient(135deg, rgba(220, 53, 69, 0.1), rgba(203, 36, 49, 0.1));
      color: var(--danger-color);
    }
    
    .stat-card.info .stat-icon {
      background: linear-gradient(135deg, rgba(23, 162, 184, 0.1), rgba(0, 123, 255, 0.1));
      color: var(--info-color);
    }
    
    .stat-card.success::after {
      background: linear-gradient(to bottom, #20bf6b, #28a745);
    }
    
    .stat-card.warning::after {
      background: linear-gradient(to bottom, #ffc107, #ff9900);
    }
    
    .stat-card.danger::after {
      background: linear-gradient(to bottom, #dc3545, #cb2431);
    }
    
    .stat-card.info::after {
      background: linear-gradient(to bottom, #17a2b8, #007bff);
    }
    
    .stat-title {
      font-size: 14px;
      color: #777;
      margin-bottom: 5px;
    }
    
    .stat-value {
      font-size: 24px;
      font-weight: 600;
      color: var(--dark-color);
      margin-bottom: 5px;
    }
    
    .stat-description {
      font-size: 12px;
      color: #777;
    }
    
    .stat-footer {
      margin-top: 10px;
      display: flex;
      align-items: center;
      font-size: 13px;
    }
    
    .stat-change {
      display: flex;
      align-items: center;
      margin-right: 10px;
    }
    
    .change-up {
      color: var(--success-color);
    }
    
    .change-down {
      color: var(--danger-color);
    }
    
    .stat-period {
      color: #777;
      margin-left: auto;
    }
    
    .admin-card {
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
      padding: 20px;
      height: 100%;
      margin-bottom: 20px;
    }
    
    .admin-card-header {
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    
    .admin-card-title {
      font-size: 16px;
      font-weight: 600;
      color: var(--dark-color);
      margin: 0;
      display: flex;
      align-items: center;
    }
    
    .admin-card-title i {
      margin-right: 10px;
      color: var(--primary-color);
    }
    
    .admin-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    
    .admin-item {
      display: flex;
      align-items: center;
      padding: 12px 15px;
      border-radius: 5px;
      transition: all 0.3s;
      margin-bottom: 5px;
      background: #f9fafc;
    }
    
    .admin-item:hover {
      background: #f4f7fa;
    }
    
    .admin-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-weight: 600;
      margin-right: 15px;
      font-size: 18px;
    }
    
    .admin-info {
      flex: 1;
    }
    
    .admin-name {
      font-size: 14px;
      font-weight: 500;
      color: var(--dark-color);
      margin: 0;
    }
    
    .admin-email {
      font-size: 12px;
      color: #777;
      margin: 0;
    }
    
    .admin-role {
      padding: 2px 10px;
      border-radius: 20px;
      font-size: 11px;
      text-transform: uppercase;
      font-weight: 500;
    }
    
    .role-admin {
      background-color: rgba(58, 123, 213, 0.1);
      color: var(--primary-color);
    }
    
    .role-ceo {
      background-color: rgba(220, 53, 69, 0.1);
      color: var(--danger-color);
    }
    
    .role-manager {
      background-color: rgba(32, 191, 107, 0.1);
      color: var(--success-color);
    }
    
    .role-operator {
      background-color: rgba(255, 193, 7, 0.1);
      color: var(--warning-color);
    }
    
    .update-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    
    .update-item {
      position: relative;
      padding: 15px;
      padding-left: 30px;
      border-left: 2px solid #eaedf1;
      margin-bottom: 15px;
    }
    
    .update-item::before {
      content: '';
      position: absolute;
      left: -6px;
      top: 15px;
      width: 10px;
      height: 10px;
      border-radius: 50%;
      background: var(--primary-color);
    }
    
    .update-time {
      font-size: 12px;
      color: #777;
      margin-bottom: 5px;
    }
    
    .update-title {
      font-size: 14px;
      font-weight: 500;
      color: var(--dark-color);
      margin-bottom: 5px;
    }
    
    .update-description {
      font-size: 13px;
      color: #666;
    }
    
    /* Responsive Styles */
    @media (max-width: 992px) {
      .sidebar {
        width: var(--sidebar-collapsed-width);
      }
      
      .sidebar-header h3, .menu-text, .menu-badge, .menu-category {
        opacity: 0;
        width: 0;
        display: none;
      }
      
      .main-content {
        margin-left: var(--sidebar-collapsed-width);
      }
      
      .sidebar.expanded {
        width: var(--sidebar-width);
      }
      
      .sidebar.expanded .sidebar-header h3, 
      .sidebar.expanded .menu-text,
      .sidebar.expanded .menu-badge,
      .sidebar.expanded .menu-category {
        opacity: 1;
        width: auto;
        display: block;
      }
    }
    
    @media (max-width: 768px) {
      .header-search {
        display: none;
      }
      
      .user-info {
        display: none;
      }
    }
    
    @media (max-width: 576px) {
      .header-bar {
        padding: 0 15px;
      }
      
      .page-title {
        font-size: 16px;
      }
      
      .main-content {
        padding: 15px;
      }
    }
    
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    .fade-in {
      animation: fadeIn 0.5s ease forwards;
    }
    
    @keyframes slideUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .slide-up {
      animation: slideUp 0.5s ease forwards;
    }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <aside id="sidebar" class="sidebar">
    <div class="sidebar-header">
      <div class="sidebar-logo">
        <i class="fas fa-taxi logo-icon"></i>
        <h3>Mega City Cabs</h3>
      </div>
      <button id="sidebarToggle" class="btn-toggle">
        <i class="fas fa-bars"></i>
      </button>
    </div>
    
    <ul class="sidebar-menu">
      <li class="menu-category">Main</li>
      <li class="menu-item">
        <a href="#" class="menu-link active">
          <span class="menu-icon"><i class="fas fa-tachometer-alt"></i></span>
          <span class="menu-text">Dashboard</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="<%= request.getContextPath() %>/admin/viewBookings" class="menu-link">
          <span class="menu-icon"><i class="fas fa-calendar-check"></i></span>
          <span class="menu-text">Bookings</span>
          <span class="menu-badge">New</span>
        </a>
      </li>
      
      <li class="menu-category">Management</li>
      <li class="menu-item">
        <a href="<%= request.getContextPath() %>/admin/viewCustomers" class="menu-link">
          <span class="menu-icon"><i class="fas fa-users"></i></span>
          <span class="menu-text">Customers</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="<%= request.getContextPath() %>/admin/viewDrivers" class="menu-link">
          <span class="menu-icon"><i class="fas fa-id-card"></i></span>
          <span class="menu-text">Drivers</span>
        </a>
      </li>
      
      <li class="menu-category">Communication</li>
      <li class="menu-item">
        <a href="#" class="menu-link">
          <span class="menu-icon"><i class="fas fa-envelope"></i></span>
          <span class="menu-text">Email</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="#" class="menu-link">
          <span class="menu-icon"><i class="fas fa-comments"></i></span>
          <span class="menu-text">Messages</span>
        </a>
      </li>
      
      <li class="menu-category">Account</li>
      <li class="menu-item">
        <a href="#" class="menu-link">
          <span class="menu-icon"><i class="fas fa-cog"></i></span>
          <span class="menu-text">Settings</span>
        </a>
      </li>
      <li class="menu-item">
        <a href="AdminLogout" class="menu-link">
          <span class="menu-icon"><i class="fas fa-sign-out-alt"></i></span>
          <span class="menu-text">Logout</span>
        </a>
      </li>
    </ul>
  </aside>
  
  <!-- Main Content -->
  <main id="main-content" class="main-content">
    <!-- Header Bar -->
    <div class="header-bar">
      <h1 class="page-title">Dashboard</h1>
      
      <div class="header-actions">
        <div class="header-search">
          <i class="fas fa-search search-icon"></i>
          <input type="text" class="search-input" placeholder="Search...">
        </div>
        
        <div class="user-dropdown">
          <div class="user-avatar">
            <span>MC</span>
          </div>
          <div class="user-info">
            <h4 class="user-name"><%= admin.getUsername() %></h4>
            <p class="user-role">Administrator</p>
          </div>
          <i class="fas fa-chevron-down"></i>
        </div>
      </div>
    </div>
    
    <!-- Welcome Section -->
    <div class="welcome-section mb-4 slide-up">
      <h2>Welcome back, <%= admin.getUsername() %>!</h2>
      <p class="text-muted">Here's what's happening with your business today.</p>
    </div>
    
    <!-- Stats Overview -->
    <div class="widget-container slide-up" style="animation-delay: 0.1s;">
      <h3 class="widget-title">
        <i class="fas fa-chart-line"></i> Business Overview
      </h3>
      
      <div class="row g-4">
        <div class="col-md-3 col-sm-6">
          <div class="stat-card">
            <div class="stat-icon">
              <i class="fas fa-dollar-sign"></i>
            </div>
            <h5 class="stat-title">Total Profit</h5>
            <h3 class="stat-value">$18M</h3>
            <p class="stat-description">All Customers Value</p>
            <div class="progress" style="height: 5px;">
              <div class="progress-bar bg-primary" role="progressbar" style="width: 70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="stat-footer">
              <div class="stat-change change-up">
                <i class="fas fa-arrow-up me-1"></i> 12.5%
              </div>
              <div class="stat-period">vs last month</div>
            </div>
          </div>
        </div>
        
        <div class="col-md-3 col-sm-6">
          <div class="stat-card success">
            <div class="stat-icon">
              <i class="fas fa-comments"></i>
            </div>
            <h5 class="stat-title">Feedbacks</h5>
            <h3 class="stat-value">1,369</h3>
            <p class="stat-description">All Customers Feedback</p>
            <div class="progress" style="height: 5px;">
              <div class="progress-bar bg-success" role="progressbar" style="width: 50%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="stat-footer">
              <div class="stat-change change-up">
                <i class="fas fa-arrow-up me-1"></i> 8.3%
              </div>
              <div class="stat-period">vs last month</div>
            </div>
          </div>
        </div>
        
        <div class="col-md-3 col-sm-6">
          <div class="stat-card info">
            <div class="stat-icon">
              <i class="fas fa-calendar-alt"></i>
            </div>
            <h5 class="stat-title">New Bookings</h5>
            <h3 class="stat-value">567</h3>
            <p class="stat-description">All Active Bookings</p>
            <div class="progress" style="height: 5px;">
              <div class="progress-bar bg-info" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="stat-footer">
              <div class="stat-change change-up">
                <i class="fas fa-arrow-up me-1"></i> 14.6%
              </div>
              <div class="stat-period">vs last month</div>
            </div>
          </div>
        </div>
        
        <div class="col-md-3 col-sm-6">
          <div class="stat-card warning">
            <div class="stat-icon">
              <i class="fas fa-users"></i>
            </div>
            <h5 class="stat-title">Total Drivers</h5>
            <h3 class="stat-value">124</h3>
            <p class="stat-description">Active Drivers</p>
            <div class="progress" style="height: 5px;">
              <div class="progress-bar bg-warning" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
            <div class="stat-footer">
              <div class="stat-change change-up">
                <i class="fas fa-arrow-up me-1"></i> 5.7%
              </div>
              <div class="stat-period">vs last month</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Admin & Updates -->
    <div class="row mt-4">
      <div class="col-lg-6 mb-4 slide-up" style="animation-delay: 0.2s;">
        <div class="admin-card">
          <div class="admin-card-header">
            <h4 class="admin-card-title">
              <i class="fas fa-user-shield"></i> Admin Panel
            </h4>
          </div>
          
          <ul class="admin-list">
            <li class="admin-item">
              <div class="admin-avatar">JR</div>
              <div class="admin-info">
                <h5 class="admin-name">Janith Rangana</h5>
                <p class="admin-email">janith@megacitycabs.com</p>
              </div>
              <span class="admin-role role-manager">Manager</span>
            </li>
            
            <li class="admin-item">
              <div class="admin-avatar">JR</div>
              <div class="admin-info">
                <h5 class="admin-name">Janith Rangana</h5>
                <p class="admin-email">janith@megacitycabs.com</p>
              </div>
              <span class="admin-role role-operator">Operator</span>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="col-lg-6 mb-4 slide-up" style="animation-delay: 0.3s;">
        <div class="admin-card">
          <div class="admin-card-header">
            <h4 class="admin-card-title">
              <i class="fas fa-bell"></i> Latest Updates
            </h4>
          </div>
          
          <ul class="update-list">
            <li class="update-item">
              <div class="update-time">Today, 09:32 AM</div>
              <h5 class="update-title">New Driver Registration</h5>
              <p class="update-description">3 new drivers have completed registration and are pending approval.</p>
            </li>
            
            <li class="update-item">
              <div class="update-time">Yesterday, 15:45 PM</div>
              <h5 class="update-title">System Maintenance</h5>
              <p class="update-description">The system was updated to version 2.4.0 with new features and bug fixes.</p>
            </li>
            
            <li class="update-item">
              <div class="update-time">Mar 12, 2025, 10:15 AM</div>
              <h5 class="update-title">Customer Feedback Summary</h5>
              <p class="update-description">Monthly customer feedback report has been generated.</p>
            </li>
            
            <li class="update-item">
              <div class="update-time">Mar 10, 2025, 08:30 AM</div>
              <h5 class="update-title">Pricing Update</h5>
              <p class="update-description">New pricing structure has been implemented for peak hours.</p>
            </li>
          </ul>
        </div>
      </div>
    </div>
    
    <!-- Recent Activity Section -->
    <div class="widget-container slide-up" style="animation-delay: 0.4s;">
      <h3 class="widget-title">
        <i class="fas fa-clock"></i> Recent Activity
      </h3>
      
      <div class="admin-card">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>Activity</th>
                <th>User</th>
                <th>Time</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>#ACT-001</td>
                <td>New booking created</td>
                <td>John Doe</td>
                <td>2 hours ago</td>
                <td><span class="badge bg-success">Completed</span></td>
              </tr>
              <tr>
                <td>#ACT-002</td>
                <td>Driver assigned</td>
                <td>Admin</td>
                <td>3 hours ago</td>
                <td><span class="badge bg-info">Processed</span></td>
              </tr>
              <tr>
                <td>#ACT-003</td>
                <td>Customer payment</td>
                <td>Jane Smith</td>
                <td>5 hours ago</td>
                <td><span class="badge bg-success">Completed</span></td>
              </tr>
              <tr>
                <td>#ACT-004</td>
                <td>New driver registration</td>
                <td>Mark Johnson</td>
                <td>1 day ago</td>
                <td><span class="badge bg-warning">Pending</span></td>
              </tr>
              <tr>
                <td>#ACT-005</td>
                <td>Booking cancelled</td>
                <td>Sarah Williams</td>
                <td>1 day ago</td>
                <td><span class="badge bg-danger">Cancelled</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </main>
  
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const sidebar = document.getElementById('sidebar');
      const mainContent = document.getElementById('main-content');
      const sidebarToggle = document.getElementById('sidebarToggle');
      
      // Function to check window width and set initial sidebar state
      function checkWidth() {
        if (window.innerWidth < 992) {
          sidebar.classList.add('collapsed');
          mainContent.classList.add('expanded');
        } else {
          sidebar.classList.remove('collapsed');
          mainContent.classList.remove('expanded');
        }
      }
      
      // Check width on initial load
      checkWidth();
      
      // Toggle sidebar
      sidebarToggle.addEventListener('click', function() {
        sidebar.classList.toggle('collapsed');
        mainContent.classList.toggle('expanded');
      });
      
      // Update on window resize
      window.addEventListener('resize', function() {
        checkWidth();
      });
      
      // Mobile menu toggle (for smaller screens)
      const mobileSidebarToggle = document.getElementById('mobileSidebarToggle');
      if (mobileSidebarToggle) {
        mobileSidebarToggle.addEventListener('click', function() {
          sidebar.classList.toggle('expanded');
        });
      }
    });
  </script>
        
<script src="Admindashboard.js"></script>
</body>
</html>