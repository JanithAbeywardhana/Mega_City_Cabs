<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    display: flex;
    justify-content: center;
    align-items: center;

    margin: 0;
}

/* Centered Form Container */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Form Box */
.form-container {
    background: white;
    padding: 30px;
    border-radius: 10px;
   
    width: 100%;
    max-width: 850px;
}

/* Form Labels */
.form-label {
    font-weight: bold;
}

/* Select Dropdown */
.form-select {
    border-radius: 5px;
    border: 1px solid #ced4da;
    font-size: 14px;
    transition: all 0.3s;
}

.form-select:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
}

/* Submit Button */
.btn-primary {
    background-color: #007bff;
    border: none;
    padding: 10px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s;
}

.btn-primary:hover {
    background-color: #0056b3;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h1 class="text-center">Complete Your Account</h1>
        <p class="text-muted text-center">Please answer the following questions</p>

        <form action="submit-driver-questions" method="post">
            <!-- Question 1 -->
            <div class="mb-3">
                <label class="form-label">How many years of experience do you have?</label>
                <select class="form-select" name="first_question" id="first_question" required>
                    <option value="">Select Experience</option>
                    <option value="1">0-1 years</option>
                    <option value="2">1-3 years</option>
                    <option value="3">3-5 years</option>
                    <option value="4">5+ years</option>
                </select>
            </div>

            <!-- Question 2 -->
            <div class="mb-3">
                <label class="form-label">Are you comfortable driving at night?</label>
                <select class="form-select" name="second_question" id="second_question" required>
                    <option value="">Select Comfort Level</option>
                    <option value="1">Not comfortable</option>
                    <option value="2">Somewhat comfortable</option>
                    <option value="3">Comfortable</option>
                    <option value="4">Very comfortable</option>
                </select>
            </div>

            <!-- Question 3 -->
            <div class="mb-3">
                <label class="form-label">How familiar are you with city routes?</label>
                <select class="form-select" name="third_question" id="third_question" required>
                    <option value="">Select Familiarity</option>
                    <option value="1">Not familiar</option>
                    <option value="2">Somewhat familiar</option>
                    <option value="3">Familiar</option>
                    <option value="4">Very familiar</option>
                </select>
            </div>

            <!-- Question 4 -->
            <div class="mb-3">
                <label class="form-label">How do you rate your defensive driving skills?</label>
                <select class="form-select" name="forth_question" id="forth_question" required>
                    <option value="">Select Skill Level</option>
                    <option value="1">Basic</option>
                    <option value="2">Intermediate</option>
                    <option value="3">Advanced</option>
                    <option value="4">Expert</option>
                </select>
            </div>

            <!-- Question 5 -->
            <div class="mb-4">
                <label class="form-label">Availability for emergency rides?</label>
                <select class="form-select" name="fifth_question" id="fifth_question" required>
                    <option value="">Select Availability</option>
                    <option value="1">Not available</option>
                    <option value="2">Rarely available</option>
                    <option value="3">Usually available</option>
                    <option value="4">Always available</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary w-100">Next</button>
        </form>
    </div>
</div>

</body>
</html>