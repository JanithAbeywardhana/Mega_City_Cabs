

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.service.BookingService;

/**
 * Servlet implementation class DriverUpdateRideStatusController
 */
@WebServlet("/driverreg/updateRideStatus")
public class DriverUpdateRideStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BookingService bookingService;
    
    @Override
    public void init() throws ServletException {
        bookingService = new BookingService();
    }   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DriverUpdateRideStatusController() {
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
		 try {
	            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
	            String newStatus = request.getParameter("newStatus");
	            
	            boolean isUpdated = bookingService.updateBookingStatus(bookingId, newStatus);
	            if (isUpdated) {
	                response.sendRedirect(request.getContextPath() + "/driver/assignedRides");
	            } else {
	                response.getWriter().write("Failed to update booking status.");
	            }
	        } catch (NumberFormatException e) {
	            response.getWriter().write("Invalid booking ID.");
	        }
	}

}
