<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.signup {
    margin-top: 10px;
    font-size: 0.85rem;
    text-align: center; /* Center signup text */
}

.signup a {
    color: #007bff;
    text-decoration: none;
    font-weight: 500;
}

.signup a:hover {
    text-decoration: underline;
}
</style>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="d-flex align-items-center justify-content-center" >

    <div class="container p-4 " style="max-width: 850px;">
        <h2 class="text-center mb-3">Create Your Account</h2>
        <p class="text-center text-muted">Welcome back! Please enter your details</p>

        <form action="registerDriver" method="post">
            <div class="mb-2">
                <label for="name" class="form-label">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>

            <div class="mb-2">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="mb-2">
                <label for="license_number" class="form-label">License Number:</label>
                <input type="text" id="license_number" name="license_number" class="form-control" required>
            </div>

            <div class="mb-2">
                <label for="address" class="form-label">Address:</label>
                <input type="text" id="address" name="address" class="form-control" required>
            </div>

            <div class="mb-2">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <div class="mb-2">
                <label class="form-label">Ride Time:</label>
                <div class="form-check form-check-inline">
                    <input type="radio" id="day" name="ride_time" value="day" class="form-check-input" required>
                    <label for="day" class="form-check-label">Day</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="night" name="ride_time" value="night" class="form-check-input" required>
                    <label for="night" class="form-check-label">Night</label>
                </div>
            </div>

            <div class="mb-2">
                <label class="form-label">Gender:</label>
                <div class="form-check form-check-inline">
                    <input type="radio" id="male" name="gender" value="Male" class="form-check-input" required>
                    <label for="male" class="form-check-label">Male</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="female" name="gender" value="Female" class="form-check-input" required>
                    <label for="female" class="form-check-label">Female</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="radio" id="other" name="gender" value="Other" class="form-check-input" required>
                    <label for="other" class="form-check-label">Other</label>
                </div>
            </div>

            <div class="d-grid">
                <input type="submit" value="Register" class="btn btn-primary">
            </div>
        </form>

       <div class="signup">
            Didn’t have an account? <a href="driverLogin.jsp">SignIn</a>
        </div>
    </div>

</body>
</html>