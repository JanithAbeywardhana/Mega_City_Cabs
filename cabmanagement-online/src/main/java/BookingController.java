

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import com.example.model.Booking;
import com.example.service.BookingService;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/registration/booking")
public class BookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingService bookingService = new BookingService();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Integer customerId = (Integer) session.getAttribute("customerId");
		
		if (customerId == null) {
            response.sendRedirect("/registration/login.jsp");
            return;
        }
		
		
		String customerName = request.getParameter("customerName");
	    String pickup = request.getParameter("pickup");
	    String drop = request.getParameter("drop");
	    String vehicleType = request.getParameter("vehicleType");
	    String bookingDateStr = request.getParameter("bookingDate");
	    String bookingTimeStr = request.getParameter("bookingTimeInput");
	    String pystatus =  request.getParameter("paymentStatus");
	    String passengerCountStr = request.getParameter("passengerCount");
	    String luggageCountStr = request.getParameter("luggageCount");
	    
	    
	    
	    try {
	        
	        LocalDate bookingDate = LocalDate.parse(bookingDateStr);

	     
	        String dateTimeStr = bookingDateStr + " " + bookingTimeStr + ":00";
	        Timestamp bookingTime = Timestamp.valueOf(dateTimeStr); 

	       
	        int passengerCount = Integer.parseInt(passengerCountStr);
	        int luggageCount = Integer.parseInt(luggageCountStr);
	        
	     
	        if (vehicleType.equals("4-passenger") && passengerCount > 4) {
	            response.getWriter().write("Maximum 4 passengers allowed for 4-passenger vehicle.");
	            return;
	        } else if (vehicleType.equals("8-passenger") && passengerCount > 8) {
	            response.getWriter().write("Maximum 8 passengers allowed for 8-passenger vehicle.");
	            return;
	        } else if (vehicleType.equals("14-passenger") && passengerCount > 14) {
	            response.getWriter().write("Maximum 14 passengers allowed for 14-passenger vehicle.");
	            return;
	        }
	        
	       
	        double distanceKm = calculateDistance(pickup, drop);
	        double fare = bookingService.calculateFare(distanceKm, vehicleType);

	       
	        Booking booking = new Booking();
	        
	        booking.setCustomerId(customerId);
	        booking.setCustomerName(customerName);
	        booking.setPickupLocation(pickup);
	        booking.setDropLocation(drop);
	        booking.setDistanceKm(distanceKm);
	        booking.setVehicleType(vehicleType);
	        booking.setFare(fare);
	        booking.setBookingDate(bookingDate);
	        booking.setBookingTime(bookingTime);
	        booking.setPaymentStatus(pystatus);
	        booking.setPassengerCount(passengerCount);
	        booking.setLuggageCount(luggageCount);
	        

	       
	        boolean isSuccess = bookingService.createBooking(booking);

	        if (isSuccess) {
	            session.setAttribute("booking", booking);
	            response.sendRedirect(request.getContextPath() + "/Booking/booking-details.jsp");
	        }

	    } catch (DateTimeParseException e) {
	        response.getWriter().write("Invalid date format. Use YYYY-MM-DD.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().write("Error: " + e.getMessage());
	    }
	}
	
	private double calculateDistance(String origin, String destination) throws Exception {
	    String apiKey = "AIzaSyBRMESjK1QTbvTqYmrFmgu8mszqPpLtjVA";
	    String url = "https://maps.googleapis.com/maps/api/distancematrix/json"
	               + "?origins=" + URLEncoder.encode(origin, "UTF-8")
	               + "&destinations=" + URLEncoder.encode(destination, "UTF-8")
	               + "&key=" + apiKey;

	    HttpClient client = HttpClient.newHttpClient();
	    HttpRequest request = HttpRequest.newBuilder()
	            .uri(URI.create(url))
	            .build();

	    HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
	    JsonObject json = JsonParser.parseString(response.body()).getAsJsonObject();

	    if (json.get("status").getAsString().equals("OK")) {
	        JsonElement distanceElement = json.getAsJsonArray("rows")
	                .get(0).getAsJsonObject()
	                .getAsJsonArray("elements")
	                .get(0).getAsJsonObject()
	                .get("distance")
	                .getAsJsonObject()
	                .get("value"); 

	        return distanceElement.getAsDouble() / 1000.0; 
	    } else {
	        throw new Exception("Failed to calculate distance: " + json.get("status").getAsString());
	    }
    }

}
