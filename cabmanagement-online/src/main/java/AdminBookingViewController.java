

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Booking;
import com.example.service.BookingService;

/**
 * Servlet implementation class AdminBookingViewController
 */
@WebServlet("/admin/viewBookings")
public class AdminBookingViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
private BookingService bookingService;
    
    public void init() throws ServletException {
        bookingService = new BookingService();
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookingViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Booking> bookings = bookingService.getAllBookings();
        request.setAttribute("bookings", bookings);
        
        request.getRequestDispatcher("/Admin/adminBookingList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
