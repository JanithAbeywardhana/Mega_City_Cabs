<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Customer Details - Mega City Cabs</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #3a7bd5;
      --secondary-color: #00d2ff;
      --accent-color: #20bf6b;
      --dark-color: #333333;
      --light-color: #f8f9fa;
      --danger-color: #dc3545;
    }
    
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      min-height: 100vh;
      margin: 0;
      padding: 40px 20px;
    }
    
    .customers-container {
      max-width: 1200px;
      margin: 0 auto;
    }
    
    .customers-header {
      text-align: center;
      margin-bottom: 40px;
      color: white;
      animation: fadeIn 0.8s ease;
    }
    
    .customers-header h1 {
      font-size: 36px;
      font-weight: 600;
      margin-bottom: 10px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
    
    .customers-header p {
      font-size: 18px;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto;
    }
    
    .customers-card {
      background: white;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      animation: fadeInUp 0.8s ease;
    }
    
    .customers-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      margin: 0;
    }
    
    .customers-table th {
      background: var(--dark-color);
      color: white;
      padding: 15px;
      text-align: left;
      font-weight: 600;
      font-size: 15px;
      position: sticky;
      top: 0;
      z-index: 10;
    }
    
    .customers-table th:first-child {
      border-top-left-radius: 15px;
    }
    
    .customers-table th:last-child {
      border-top-right-radius: 15px;
      text-align: center;
    }
    
    .customers-table td {
      padding: 15px;
      border-bottom: 1px solid #eef2f7;
      font-size: 15px;
      color: var(--dark-color);
      vertical-align: middle;
    }
    
    .customers-table tr:last-child td {
      border-bottom: none;
    }
    
    .customers-table tr:hover td {
      background-color: #f9fbff;
    }
    
    .customer-id {
      font-weight: 600;
      color: var(--primary-color);
      width: 70px;
    }
    
    .customer-name {
      font-weight: 500;
      display: flex;
      align-items: center;
    }
    
    .customer-name i {
      margin-right: 8px;
      color: var(--primary-color);
    }
    
    .customer-email {
      color: #666;
    }
    
    .customer-email a {
      color: var(--primary-color);
      text-decoration: none;
      transition: all 0.3s;
    }
    
    .customer-email a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }
    
    .action-cell {
      text-align: center;
      width: 120px;
    }
    
    .action-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 36px;
      height: 36px;
      border-radius: 50%;
      background: #f0f2f5;
      color: #555;
      border: none;
      transition: all 0.3s;
      margin: 0 3px;
    }
    
    .action-btn:hover {
      background: #e4e7ea;
      color: var(--dark-color);
      transform: translateY(-2px);
    }
    
    .action-btn.edit {
      background: rgba(58, 123, 213, 0.1);
      color: var(--primary-color);
    }
    
    .action-btn.edit:hover {
      background: rgba(58, 123, 213, 0.2);
    }
    
    .action-btn.delete {
      background: rgba(220, 53, 69, 0.1);
      color: var(--danger-color);
    }
    
    .action-btn.delete:hover {
      background: rgba(220, 53, 69, 0.2);
    }
    
    .action-btn i {
      font-size: 14px;
    }
    
    .back-btn {
      background: var(--dark-color);
      color: white;
      border: none;
      border-radius: 50px;
      padding: 12px 30px;
      font-size: 16px;
      font-weight: 500;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      display: inline-flex;
      align-items: center;
      margin-top: 30px;
    }
    
    .back-btn:hover {
      background: #222;
      transform: translateY(-3px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
      color: white;
    }
    
    .back-btn i {
      margin-right: 8px;
    }
    
    .search-container {
      background: white;
      border-radius: 50px;
      padding: 8px 20px;
      display: flex;
      align-items: center;
      max-width: 400px;
      margin: 0 auto 20px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    .search-container i {
      color: #aaa;
      margin-right: 10px;
    }
    
    .search-input {
      border: none;
      flex: 1;
      padding: 8px 0;
      font-size: 15px;
      color: var(--dark-color);
    }
    
    .search-input:focus {
      outline: none;
    }
    
    .empty-message {
      background: white;
      border-radius: 15px;
      padding: 30px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      animation: fadeIn 1s ease;
    }
    
    .empty-message i {
      font-size: 60px;
      color: #ddd;
      margin-bottom: 20px;
    }
    
    .empty-message h3 {
      font-size: 20px;
      font-weight: 600;
      margin-bottom: 10px;
      color: var(--dark-color);
    }
    
    .empty-message p {
      font-size: 16px;
      color: #777;
      margin-bottom: 20px;
    }
    
    .footer {
      background: var(--dark-color);
      color: white;
      padding: 20px 0;
      text-align: center;
      margin-top: 50px;
      border-radius: 10px;
    }
    
    .footer-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 20px;
    }
    
    .footer a {
      color: white;
      text-decoration: none;
      transition: color 0.3s;
    }
    
    .footer a:hover {
      color: var(--secondary-color);
    }
    
    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    
    @keyframes fadeInUp {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    /* Responsive */
    @media (max-width: 992px) {
      .customers-table th, .customers-table td {
        padding: 12px 10px;
      }
      
      .customer-address, .customer-phone, .customer-nic {
        max-width: 150px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
      }
    }
    
    @media (max-width: 768px) {
      .customers-card {
        border-radius: 0;
        box-shadow: none;
      }
      
      .customers-container {
        padding: 0;
      }
      
      .customers-table {
        display: block;
        overflow-x: auto;
        white-space: nowrap;
      }
      
      .customers-header h1 {
        font-size: 28px;
      }
    }
  </style>
</head>
<body>
  <div class="customers-container">
    <div class="customers-header">
      <h1>Customer Management</h1>
      <p>View and manage all registered customers</p>
    </div>
    
    <div class="search-container">
      <i class="fas fa-search"></i>
      <input type="text" id="customerSearch" class="search-input" placeholder="Search customers..." onkeyup="searchCustomers()">
    </div>
    
    <c:if test="${empty customers}">
      <div class="empty-message">
        <i class="fas fa-users-slash"></i>
        <h3>No Customers Found</h3>
        <p>There are currently no registered customers in the system.</p>
        <a href="adminDashboard.jsp" class="back-btn">
          <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
      </div>
    </c:if>
    
    <c:if test="${not empty customers}">
      <div class="customers-card">
        <table class="customers-table" id="customersTable">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Address</th>
              <th>Phone</th>
              <th>NIC</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="customer" items="${customers}">
              <tr>
                <td class="customer-id">${customer.customer_id}</td>
                <td class="customer-name">
                  <i class="fas fa-user-circle"></i>
                  ${customer.name}
                </td>
                <td class="customer-email">
                  <a href="mailto:${customer.email}">${customer.email}</a>
                </td>
                <td class="customer-address">${customer.address}</td>
                <td class="customer-phone">${customer.phone_number}</td>
                <td class="customer-nic">${customer.nic}</td>
                <td class="action-cell">
                  <button class="action-btn view" title="View Details" onclick="viewCustomer(${customer.customer_id})">
                    <i class="fas fa-eye"></i>
                  </button>
                  <button class="action-btn edit" title="Edit Customer" onclick="editCustomer(${customer.customer_id})">
                    <i class="fas fa-edit"></i>
                  </button>
                  <a href="${pageContext.request.contextPath}/admin/deleteCustomer?id=${customer.customer_id}" 
                     class="action-btn delete" 
                     title="Delete Customer"
                     onclick="return confirm('Are you sure you want to delete this customer? This action cannot be undone.');">
                    <i class="fas fa-trash-alt"></i>
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      
      <div class="text-center">
        <a href="adminDashboard.jsp" class="back-btn">
          <i class="fas fa-tachometer-alt"></i> Back to Dashboard
        </a>
      </div>
    </c:if>
  </div>
</body>
</html>