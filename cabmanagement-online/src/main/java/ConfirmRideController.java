

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.dao.BookingDAO;
import com.example.model.Booking;

/**
 * Servlet implementation class ConfirmRideController
 */
@WebServlet("/customer/confirmRide")
public class ConfirmRideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmRideController() {
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
            System.out.println("Confirming booking with ID: " + bookingId);

            
            boolean isConfirmed = BookingDAO.confirmBooking(bookingId, "Cash", "Pending");
            if (isConfirmed) {
                
                Booking updatedBooking = BookingDAO.getBookingById(bookingId);

                
                request.setAttribute("booking", updatedBooking);

                
                response.sendRedirect(request.getContextPath() +"/Booking/bookingConfirmed.jsp");
            } else {
                
                response.getWriter().write("Failed to confirm ride. Try again.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.getWriter().write("Invalid booking ID.");
        }
	}

}
