

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Booking;
import com.example.service.BookingService;
import com.example.service.DriverService;

/**
 * Servlet implementation class AdminBookingAssignController
 */
@WebServlet("/admin/assignDriver")
public class AdminBookingAssignController extends HttpServlet {
	private static final long serialVersionUID = 1L;
private BookingService bookingService;
    
    public void init() throws ServletException {
        bookingService = new BookingService();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookingAssignController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        
        Booking booking = bookingService.getBookingById(bookingId);
        request.setAttribute("booking", booking);
        
       
        DriverService driverService = new DriverService();
        request.setAttribute("drivers", driverService.getAllDrivers());
        
        request.getRequestDispatcher("/Admin/adminBookingAssign.jsp").forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            int driverId = Integer.parseInt(request.getParameter("driverId"));
            String newStatus = request.getParameter("newStatus"); 
            
            boolean isAssigned = bookingService.assignDriverToBooking(bookingId, driverId, newStatus);
            if (isAssigned) {
                response.sendRedirect(request.getContextPath() + "/admin/viewBookings");
            } else {
                response.getWriter().write("Failed to assign driver.");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("Invalid input.");
        }
	}

}
