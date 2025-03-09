

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.service.BookingService;

/**
 * Servlet implementation class AcceptBookingController
 */
@WebServlet("/admin/acceptBooking")
public class AcceptBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
private BookingService bookingService;
    
    public void init() throws ServletException {
        bookingService = new BookingService();
    }   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptBookingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        
        boolean isUpdated = bookingService.updateBookingStatus(bookingId, "Confirmed");
        if(isUpdated) {
            response.sendRedirect(request.getContextPath() + "/admin/viewBookings");
        } else {
            response.getWriter().write("Failed to accept booking.");
        }
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
