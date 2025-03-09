<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin: auto;
            width: 80%;
        }

</style>
</head>
<body>
 <div class="container">
 <h2 class="text-center">Customer Details</h2>
    <table class="table table-striped table-bordered">
        <thead class="thead-dark">
            <tr class="table-dark">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Phone</th>
                <th>NIC</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.customer_id}</td>
                    <td>${customer.name}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>${customer.phone_number}</td>
                    <td>${customer.nic}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/deleteCustomer?id=${customer.customer_id}" 
                           onclick="return confirm('Are you sure you want to delete this customer?');">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>